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

entity notchgen is
  generic(PWM_RESOLUTION_IN_BITS : integer := 12);
  port (
    CLK 			 : in std_logic;
    CNT_CARRIER : in  integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
    CCR_C 		 : in  integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
    CCR_UP      : in  integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
    CCR_UN      : in  integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
    UP          : out std_logic;
    UN          : out std_logic
    );
end notchgen;

architecture Behavioral of notchgen is
  signal up_signal : boolean;
  signal un_signal : boolean;
  signal up_signal_delay : boolean;
  signal un_signal_delay : boolean;
begin
  process(CLK)
  begin
    if (CLK = '1' and CLK'event) then
		if (CNT_CARRIER = CCR_C) then
			if(CCR_UP = CCR_C) then
				up_signal       <= true;
			else
				up_signal       <= CCR_UP > CNT_CARRIER;   
			end if;
			
			if(CCR_UN = CCR_C) then
				un_signal       <= false;
			else
				un_signal 		 <= CCR_UN <= CNT_CARRIER;
			end if;
		elsif (CNT_CARRIER = 0) then
			if(CCR_UP = 0) then
				up_signal       <= false;
			else
				up_signal       <= CCR_UP > CNT_CARRIER;   
			end if;
			
			if(CCR_UN = 0) then
				un_signal       <= true;
			else
				un_signal 		 <= CCR_UN <= CNT_CARRIER;
			end if;
		else		
			up_signal       <= CCR_UP > CNT_CARRIER;   
			un_signal 		 <= CCR_UN <= CNT_CARRIER;
		end if;
    end if;
  end process;

  UP <= '1' when up_signal else '0';
  UN <= '1' when un_signal else '0';

end architecture;
