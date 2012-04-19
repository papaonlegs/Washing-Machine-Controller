----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    21:15:40 10/26/2010 
-- Design Name: 
-- Module Name:    four_bit_LAC - Behavioral 
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

entity four_bit_LAC is
    Port ( InA : in  STD_LOGIC_VECTOR(3 downto 0);
           InB : in  STD_LOGIC_VECTOR(3 downto 0);
           InCarry : in  STD_LOGIC;
           OutCarry : out  STD_LOGIC_VECTOR(3 downto 0));
end four_bit_LAC;

architecture Behavioral of four_bit_LAC is

Signal G, P : STD_LOGIC_VECTOR(3 downto 0);

begin

G <= InA and InB after 7 ns;
P <= InA or InB after 7 ns;

OutCarry(0) <= InCarry;
OutCarry(1) <= G(0) or (P(0) and InCarry) after 14 ns;
OutCarry(2) <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and InCarry) after 14 ns;
OutCarry(3) <= G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0)) or (P(2) and P(1) and P(0) and InCarry) after 14 ns;

end Behavioral;

