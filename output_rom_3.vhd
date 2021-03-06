----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    19:23:14 12/15/2010 
-- Design Name: 
-- Module Name:    output_rom_3 - Behavioral 
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

entity output_rom_3 is
Port ( Var	 : in  STD_LOGIC_VECTOR (3 downto 0);
           Func : out  STD_LOGIC_VECTOR (1 downto 0); -- 2nd
           Cond : out  STD_LOGIC_VECTOR (1 downto 0); -- 3rd
           Datapath : out  STD_LOGIC_VECTOR (19 downto 0); -- 5th
           Done : out  STD_LOGIC; -- 4th
           Branch : out  STD_LOGIC_VECTOR (3 downto 0)); -- 1st
end output_rom_3;

architecture Behavioral of output_rom_3 is

signal everything : STD_LOGIC_VECTOR (28 downto 0);

begin

with Var select
everything <= "00000101000000000000000000000" when "0000",
"00000000010001000000000000000" when "0001",
"10001111000011000100010100000" when "0010",
"00000000000011001100110010001" when "0011",
"00000000000011001100110010111" when "0100",
"00000000000011001100110010111" when "0101",
"00000000000011001100110010111" when "0110",
"00001000000011001100110010111" when "0111",
"00000001000011001100110000001" when "1000",
"00000001000011001100110010101" when "1001",
"00000001000011001100110010101" when "1010",
"00000001000011001100110010101" when "1011",
"00001001000011001100110010101" when "1100",
"00001101000001000100010110000" when "1101",
"00001000100000000000000000000" when "1110",
"00001000000000000000000000000" when "1111",
"ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" when others;

Branch <= everything(28 downto 25);
Func <= everything(24 downto 23);
Cond <= everything(22 downto 21);
Done <= everything(20);
Datapath <= everything(19 downto 0);

end Behavioral;

