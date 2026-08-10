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

entity td_gen is
  generic(PWM_RESOLUTION_IN_BITS : integer := 16);
  port
    (
      CLK 			  	 : in std_logic;
      EN_EDGE		  	 : in std_logic;
      CCR_C           : in  integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
      CCR_U           : in  integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
      CCR_TD          : in  integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
      CCR_UP          : out integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
      CCR_UN          : out integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1
      );
end td_gen;

architecture Behavioral of td_gen is
  signal ccr_c_lach			: integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
  signal ccr_u_lach			: integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
  signal ccr_td_lach			: integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
  --signal ccr_u_plus        : integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
  --signal ccr_u_minu        : integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;
  signal flag_up_stay_off  : boolean;
  signal flag_un_stay_off 	: boolean;

	component latch is
	generic(PWM_RESOLUTION_IN_BITS : integer := PWM_RESOLUTION_IN_BITS);
    port (
				CLK     : in  std_logic;
      		EN_EDGE : in  std_logic;
      		D       : in  integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;  -- std_logic_vector(15 downto 0);
      		Q       : out integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1  --std_logic_vector(15 downto 0)
      	);
	end component;

begin
	latch_ccr_c : latch
		generic map (PWM_RESOLUTION_IN_BITS => PWM_RESOLUTION_IN_BITS)
    	port map (CLK => CLK, EN_EDGE => EN_EDGE, D => CCR_C, Q => ccr_c_lach);
	latch_ccr_u : latch
		generic map (PWM_RESOLUTION_IN_BITS => PWM_RESOLUTION_IN_BITS)
    	port map (CLK => CLK, EN_EDGE => EN_EDGE, D => CCR_U, Q => ccr_u_lach);
  	latch_ccr_td : latch
    	generic map (PWM_RESOLUTION_IN_BITS => PWM_RESOLUTION_IN_BITS)
    	port map (CLK => CLK, EN_EDGE => EN_EDGE, D => CCR_TD, Q => ccr_td_lach);

	process(CLK)
	begin
    if(CLK = '1'and CLK'event) then
		--ccr_u_plus 	<= (ccr_u_lach + ccr_td_lach/2);
		--ccr_u_minu 	<= (ccr_u_lach - ccr_td_lach/2);

        flag_up_stay_off   <= ccr_u_lach <= ccr_td_lach/2;
		--flag_un_stay_off   <= ccr_c_lach <  ccr_u_plus;
		flag_un_stay_off   <= (ccr_c_lach - ccr_td_lach/2) <  ccr_u_lach;
 
      if(flag_un_stay_off) then         			-- near top of carrier
      	CCR_UP <= ccr_u_lach*2 - ccr_c_lach; 		-- - 1 + ccr_u_stage1*2 - ccr_c_stage1;
			CCR_UN <= ccr_c_lach;       					-- + 1 + ccr_u_stage1*0 + ccr_c_stage1;
      elsif (flag_up_stay_off) then					-- near bottom
			CCR_UP <= 0;    									-- + 0 + ccr_u_stage1*0;
			CCR_UN <= ccr_u_lach*2;    					-- + 0 + ccr_u_stage1*2;
      else                              			-- middle of carrier
			CCR_UP <= (ccr_u_lach - ccr_td_lach/2);   						-- + 0 + ccr_u_stage1*1 - ccr_td_stage1/2;
			CCR_UN <= (ccr_u_lach + ccr_td_lach/2);   						-- + 0 + ccr_u_stage1*1 + ccr_td_stage1/2;
      end if;
    end if;
   end process;

end architecture;

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

entity latch is
	generic(PWM_RESOLUTION_IN_BITS : integer := 16);
	port (
			CLK     : in  std_logic;
    		EN_EDGE : in  std_logic;
    		D       : in  integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;  -- std_logic_vector(15 downto 0);
    		Q       : out integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1  --std_logic_vector(15 downto 0)
    	);
end latch;

architecture RTL of latch is
  signal hold        : integer range 0 to (2** PWM_RESOLUTION_IN_BITS)-1;  -- std_logic_vector(15 downto 0);
  signal en_edge_old : std_logic;
begin
	process (CLK)
	begin
		if(CLK = '1' and CLK'event) then
			if (EN_EDGE = '1' and en_edge_old = '0') then
				hold <= D;
			end if;
			en_edge_old <= EN_EDGE;
		end if;
	end process;
	
	Q <= hold;
  
end RTL;

