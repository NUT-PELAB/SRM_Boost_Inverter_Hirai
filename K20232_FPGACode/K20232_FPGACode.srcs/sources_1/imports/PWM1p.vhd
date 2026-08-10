library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
--USE ieee.numeric_std.ALL;

entity PWM1P is
  generic(PWM_RESOLUTION_IN_BITS : integer := 16;
  			 CNT_SATRT  : integer := 1);
  port (
    CLK       				: in  STD_LOGIC;					 --FPGA clock 200M
    CE						: in  STD_LOGIC;
    CCR_C  					: in  STD_LOGIC_VECTOR ( 15 downto 0);  --キャリア周期(カウント上限値)
    CCR_PHASE				: in  STD_LOGIC_VECTOR ( 15 downto 0);
    CCR_PHASE_DIRECTION	    : in  STD_LOGIC;
	CCR_U					: in  STD_LOGIC_VECTOR ( 15 downto 0);
	CCR_TD					: in  STD_LOGIC_VECTOR ( 15 downto 0);
     DIVISOR   				: in  STD_LOGIC_VECTOR ( 15 downto 0);  --Divided interrupt
    CTRL      				: in  STD_LOGIC_VECTOR ( 15 downto 0);  --PWM control signals
    CCR_ADDLY 				: in  STD_LOGIC_VECTOR ( 15 downto 0);  --ADC delay
    OUTPUT					: out STD_LOGIC_VECTOR ( 15 downto 0)
    );
end PWM1P;

---------------------
--architecture 定義--
---------------------
architecture Behavioral of PWM1P is
	signal ccr_c_inte						: integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
	signal ccr_phase_inte				: integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
	signal ccr_u_inte						: integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
	signal ccr_td_inte					: integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
	signal divisor_inte					: integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
	signal ccr_addly_inte				: integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
	--内部信号
	signal carrier_at_zero_point 		: STD_LOGIC;
	signal carrier_at_ccr_c_point		: STD_LOGIC;
	signal flag_down						: STD_LOGIC;
	signal cnt_carrier_port				: integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
	
	signal load_divided_port			: STD_LOGIC;
	signal int_divided_port				: STD_LOGIC;
	
	signal ccr_up							: integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
	signal ccr_un							: integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;

	signal up								: STD_LOGIC;
	signal un								: STD_LOGIC;
	
  component pwm_carrygen 
    generic(PWM_RESOLUTION_IN_BITS  : integer := 16);
    Port ( CLK 							: in  STD_LOGIC;
           CE 								: in  STD_LOGIC;
           CCR_C 							: in  integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;  		--キャリア周期
           CCR_PHASE 					: in  integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;	  	--キャリア初期値
			  CCR_PHASE_DIRECTION		: in  STD_LOGIC;															--キャリア位相方向(0:プラス方向，1:マイナス方向)	
           CARRIER_AT_ZERO_PORT 		: out STD_LOGIC;
           CARRIER_AT_CCR_C_PORT		: out STD_LOGIC;
           FLAG_DOWN 					: out STD_LOGIC;
           CNT_CARRIER_PORT 			: out integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1
			  );
  end component;
  
  component divided_int
    generic(PWM_RESOLUTION_IN_BITS  : integer := 16;
				CNT_SATRT  : integer := 1);
   port(
			CLK              					: in STD_LOGIC;    --クロック
			CE 									: in STD_LOGIC;
			DIVISOR_PORT     					: in integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1:= 1;  -- 間引き制御
			CARRIER_AT_CCR_C 					: in STD_LOGIC;
			CARRIER_AT_ZERO  					: in STD_LOGIC;
			FLAG_INT_TOP     					: in STD_LOGIC;
			FLAG_INT_BOTTOM  					: in STD_LOGIC;
			CCR_ADDLY_IN     					: in integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
			LOAD_DIVIDED_PORT 				: out STD_LOGIC;
			INT_DIVIDED_PORT  				: out STD_LOGIC
			);
	end component;

  component td_gen
	generic(PWM_RESOLUTION_IN_BITS : integer := 16);
	port(
      CLK 			  	 	: in std_logic;
      EN_EDGE		  	 	: in std_logic;
      CCR_C           		: in  integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
      CCR_U           		: in  integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
      CCR_TD          		: in  integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
      CCR_UP          		: out integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
      CCR_UN          		: out integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1
      );
	end component;
	
	component notchgen
		generic(PWM_RESOLUTION_IN_BITS : integer := 16);
		port (
			CLK : in std_logic;
			CNT_CARRIER : in  integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
			CCR_C 		: in  integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
			CCR_UP      : in  integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
			CCR_UN      : in  integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
			UP          : out std_logic;
			UN          : out std_logic
			);
	end component;
	
begin

	ccr_c_inte <= CONV_INTEGER(unsigned(CCR_C));
	ccr_phase_inte <= CONV_INTEGER(unsigned(CCR_PHASE));
	ccr_u_inte <= CONV_INTEGER(unsigned(CCR_U));
	ccr_td_inte <= CONV_INTEGER(unsigned(CCR_TD));
	divisor_inte <= CONV_INTEGER(unsigned(DIVISOR));
	ccr_addly_inte <= CONV_INTEGER(unsigned(CCR_ADDLY));


	pwm_carrygen1 : pwm_carrygen
	generic map (PWM_RESOLUTION_IN_BITS => 16)
	port map(	CLK							=> CLK,
					CE 							=> CE,
					CCR_C 						=> ccr_c_inte,
					CCR_PHASE 					=> ccr_phase_inte,
					CCR_PHASE_DIRECTION		=> CCR_PHASE_DIRECTION,
					CARRIER_AT_ZERO_PORT 	=> carrier_at_zero_point,
					CARRIER_AT_CCR_C_PORT	=> carrier_at_ccr_c_point,
					FLAG_DOWN 					=> flag_down,
					CNT_CARRIER_PORT 			=> cnt_carrier_port);

	divided_int1 : divided_int
	generic map (PWM_RESOLUTION_IN_BITS => 16, CNT_SATRT => CNT_SATRT)
	port map(	CLK              		=> CLK,
					CE							=> CE,
					DIVISOR_PORT     		=> divisor_inte,
					CARRIER_AT_CCR_C 		=> carrier_at_zero_point,
					CARRIER_AT_ZERO  		=> carrier_at_ccr_c_point,
					FLAG_INT_TOP     		=> CTRL(0),
					FLAG_INT_BOTTOM  		=> CTRL(1),
					CCR_ADDLY_IN     		=> ccr_addly_inte,
					LOAD_DIVIDED_PORT 		=> load_divided_port,
					INT_DIVIDED_PORT  		=> int_divided_port);

	td_gen1 : td_gen
	generic map(PWM_RESOLUTION_IN_BITS => 16)
	port map(
					CLK			=> CLK,
					EN_EDGE		=> load_divided_port,
					CCR_C       => ccr_c_inte,
					CCR_U       => ccr_u_inte,
					CCR_TD      => ccr_td_inte,
					CCR_UP      => ccr_up,
					CCR_UN      => ccr_un
					);
	
	notchgen1 :notchgen
	generic map(PWM_RESOLUTION_IN_BITS => 16)
	port map (
					CLK 		=> CLK,
					CNT_CARRIER => cnt_carrier_port,
					CCR_C       => ccr_c_inte,
					CCR_UP      => ccr_up,
					CCR_UN      => ccr_un,
					UP          => up,
					UN          => un
				);
	
	OUTPUT(0) <= up;
	OUTPUT(1) <= un;
	OUTPUT(2) <= int_divided_port;
	OUTPUT(3) <= flag_down;
	
end Behavioral;


