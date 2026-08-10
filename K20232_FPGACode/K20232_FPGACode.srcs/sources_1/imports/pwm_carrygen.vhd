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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pwm_carrygen is
    generic(PWM_RESOLUTION_IN_BITS  : integer := 16);
    Port ( CLK 							: in  STD_LOGIC;
           CE 							: in  STD_LOGIC;
           CCR_C 						: in  integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;  --キャリア周期
           CCR_PHASE 					: in  integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;		 --キャリア初期値
           CCR_PHASE_DIRECTION			: in  STD_LOGIC;													 --キャリア位相方向(0:プラス方向，1:マイナス方向)	
           CARRIER_AT_ZERO_PORT 		: out STD_LOGIC;
           CARRIER_AT_CCR_C_PORT		: out STD_LOGIC;
           FLAG_DOWN 					: out STD_LOGIC;
           CNT_CARRIER_PORT 			: out integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1
			  );
end pwm_carrygen;
architecture RTL of pwm_carrygen is
  signal ccr_c_lach						: integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
  signal cnt_carrier                : integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
  signal cnt_carrier_delayed        : integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
  signal cnt_carrier_delayed_2      : integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
  signal cnt_carrier_delayed_3      : integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
  signal cnt_carrier_delayed_4      : integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
  signal cnt_carrier_delayed_5      : integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;

  signal carrier_at_zero            : boolean;
  signal carrier_at_zero_delayed    : boolean;
  signal carrier_at_ccr_c           : boolean;
  signal carrier_at_ccr_c_delayed   : boolean;

  signal flag_up         				: boolean := true;
  signal flag_up_delayed 				: boolean := true;
  
begin
  process(CLK)
  begin
    if (CLK'event and CLK = '1') then
      --  三角波キャリア生成  --
      if ('0' = CE) then           -- タイマ停止
			ccr_c_lach	 	<= CCR_C;
			cnt_carrier 	<= CCR_PHASE;
			if('0' = CCR_PHASE_DIRECTION) then
				flag_up     <= true;
			else
				flag_up     <= false;
			end if;
		elsif(cnt_carrier = ccr_c_lach) then
				cnt_carrier <= cnt_carrier -1;
				flag_up 			<= false;
				carrier_at_ccr_c<= true;
		elsif(cnt_carrier = 0) then
				cnt_carrier <= cnt_carrier +1;
				flag_up 			<= true;
				carrier_at_zero <= true;
				ccr_c_lach		<= CCR_C;
		elsif(flag_up) then
				cnt_carrier <= cnt_carrier +1;
				carrier_at_ccr_c<= false;
				carrier_at_zero <= false;
		else
				cnt_carrier <= cnt_carrier -1;
				carrier_at_ccr_c<= false;
				carrier_at_zero <= false;			
		end if;
		
      --delaying
      cnt_carrier_delayed      <= cnt_carrier;
		cnt_carrier_delayed_2    <= cnt_carrier_delayed;
		cnt_carrier_delayed_3    <= cnt_carrier_delayed_2;
		cnt_carrier_delayed_4    <= cnt_carrier_delayed_3;
		cnt_carrier_delayed_5    <= cnt_carrier_delayed_4;
		
      carrier_at_zero_delayed  <= carrier_at_zero;
      carrier_at_ccr_c_delayed <= carrier_at_ccr_c;
      flag_up_delayed          <= flag_up;
    end if;
  end process;

  -- output
  CNT_CARRIER_PORT      <= cnt_carrier_delayed_4;
  CARRIER_AT_ZERO_PORT  <= '1' when carrier_at_zero_delayed  else '0';
  CARRIER_AT_CCR_C_PORT <= '1' when carrier_at_ccr_c_delayed else '0';
  FLAG_DOWN             <= '1' when not flag_up_delayed      else '0';
  
end RTL;
