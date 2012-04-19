----------------------------------------------------------------------------------
-- Company:
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    22:40:36 10/30/2010 
-- Design Name: 
-- Module Name:    d_flipflop - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity d_flipflop is
    Port ( InD : in  STD_LOGIC;
           InReset : in  STD_LOGIC;
           InPreset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           OutQ : out  STD_LOGIC;
           OutQNot : out  STD_LOGIC);
end d_flipflop;

architecture Behavioral of d_flipflop is

begin

process (InD, InReset, InPreset, CLK)
begin
if InReset = '1' then
	OutQ <= '0' after 7 ns;
	OutQNot <= '1' after 7 ns;
elsif InPreset = '1' then
	OutQ <= '1' after 7 ns;
	OutQNot <= '0' after 7 ns;
elsif CLK = '1' and CLK'event then	
	if InD = '1' then
		OutQ <= '1' after 7 ns;
		OutQNot <= '0' after 7 ns;
	else
		OutQ <= '0' after 7 ns;
		OutQNot <= '1' after 7 ns;
	end if;
end if;

end process;

end Behavioral;

