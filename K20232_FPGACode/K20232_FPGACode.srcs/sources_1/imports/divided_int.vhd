----------------------------------------------------------------------------------
-- Company: Nagaoka Power ElectronicsCo., Ltd.
-- Engineer: Ohnuma
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:     
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
--
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity divided_int is
    generic(PWM_RESOLUTION_IN_BITS  : integer := 12;
				CNT_SATRT  : integer := 1);
    port(
    	CLK              			: in std_logic;    --クロック
		CE 							: in std_logic;
    	DIVISOR_PORT     			: in integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1:= 1;  -- 間引き制御
    	CARRIER_AT_CCR_C 			: in std_logic;
    	CARRIER_AT_ZERO  			: in std_logic;
    	FLAG_INT_TOP     			: in std_logic;
    	FLAG_INT_BOTTOM  			: in std_logic;
    	CCR_ADDLY_IN     			: in integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
    	LOAD_DIVIDED_PORT 		: out std_logic;
    	INT_DIVIDED_PORT  		: out std_logic
    );
end divided_int;

architecture RTL of divided_int is
	signal int_selected   		: boolean                := false;
	signal cnt_int        		: integer range 0 to 127 := CNT_SATRT;
	signal divisor        		: integer range 0 to 127 := 1;
	signal ad_delayed     		: boolean                := false;
	signal load_divided   		: boolean                := false;
  	signal ad_delayed_offdelay : boolean;
	type delayline is array (15 downto 0) of boolean ;
		signal ad_delayed_delayline : delayline;
	
	component addelay is
    generic(PWM_RESOLUTION_IN_BITS : integer := PWM_RESOLUTION_IN_BITS);
    port (
      CLK          : in  std_logic;
      CCR_ADDLY_IN : in  integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1 := 10;
      ADTRIG_IN    : in  boolean;
      ADTRIG_OUT   : out boolean
      );
  end component;

begin
	process(CLK)
    	variable int_selected_old : boolean;
    begin
    	if(CLK = '1' and CLK'event)then
			if ('0' = CE) then           -- タイマ停止
				cnt_int <=CNT_SATRT;
    		elsif(int_selected and not int_selected_old) then
    			cnt_int <= cnt_int - 1;
    		end if;
			
    		if(cnt_int = 0) then
    			cnt_int     <= conv_integer(DIVISOR_PORT);
    		end if;
    		
   		int_selected_old := int_selected;
    		ad_delayed_delayline <= ad_delayed_delayline( ad_delayed_delayline'left-1 downto 0) & ad_delayed ;
    	end if;
	end process;

    int_selected <= (CARRIER_AT_ZERO = '1' and FLAG_INT_BOTTOM = '1') or (CARRIER_AT_CCR_C = '1' and FLAG_INT_TOP = '1');
    load_divided <= (cnt_int = 0);

	addelay_1 : addelay
	generic map (PWM_RESOLUTION_IN_BITS => PWM_RESOLUTION_IN_BITS)
	port map (	CLK          => CLK,
					CCR_ADDLY_IN => CCR_ADDLY_IN,
					ADTRIG_IN    => load_divided,
					ADTRIG_OUT   => ad_delayed);

    ad_delayed_offdelay <= ad_delayed 
								or (ad_delayed_delayline(0)) or (ad_delayed_delayline(1)) or (ad_delayed_delayline(2))
    							or (ad_delayed_delayline(3)) or (ad_delayed_delayline(4)) or (ad_delayed_delayline(5))
    							or (ad_delayed_delayline(6)) or (ad_delayed_delayline(7)) or (ad_delayed_delayline(8))
   							or (ad_delayed_delayline(9));
								
	-- output
	LOAD_DIVIDED_PORT <= '1' when load_divided     else '0';  --(cnt_int = 0);
	INT_DIVIDED_PORT  <= '1' when ad_delayed_offdelay else '0';
	
end RTL;
----------------------------------------------------------------------------------
-- Company: Nagaoka Power ElectronicsCo., Ltd.
-- Engineer: Ohnuma
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:     
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
--
-- Additional Comments: 
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity addelay is
  generic(PWM_RESOLUTION_IN_BITS : integer := 12);
  port (
    CLK 			: in std_logic;
    CCR_ADDLY_IN 	: in integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1 := 10;
    ADTRIG_IN  		: in  boolean;
    ADTRIG_OUT 		: out boolean
    );
end addelay;

architecture Behavioral of addelay is
	signal direct_mode    : boolean                                            := true;
	signal adtrig_delayed : boolean                                            := false;
	signal cnt_delay      : integer range -1 to (2** PWM_RESOLUTION_IN_BITS)-1 := 10;
  
begin
	process(CLK)
	begin
		if (CLK = '1' and CLK'event) then
			if (ADTRIG_IN) then
				cnt_delay <= CCR_ADDLY_IN;
			elsif (cnt_delay = -1) then
				cnt_delay <= -1;
			else
				cnt_delay <= cnt_delay -1;
		end if;
	end if;
end process;

  -- asynchronous
--  adtrig_delayed <= (cnt_delay = 0) or ((cnt_delay > 0)and ADTRIG_IN);
  adtrig_delayed <= (cnt_delay = 0);

  direct_mode    <= (CCR_ADDLY_IN = 0);
  ADTRIG_OUT     <= ADTRIG_IN when direct_mode else adtrig_delayed;


end architecture;

