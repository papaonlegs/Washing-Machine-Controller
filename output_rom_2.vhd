----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    23:42:19 12/14/2010 
-- Design Name: 
-- Module Name:    output_rom_2 - Behavioral 
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

entity output_rom_2 is
Port ( Var	 : in  STD_LOGIC_VECTOR (3 downto 0);
           Func : out  STD_LOGIC_VECTOR (1 downto 0); -- 2nd
           Cond : out  STD_LOGIC_VECTOR (1 downto 0); -- 3rd
           Datapath : out  STD_LOGIC_VECTOR (19 downto 0); -- 5th
           Done : out  STD_LOGIC; -- 4th
           Branch : out  STD_LOGIC_VECTOR (3 downto 0)); -- 1st
end output_rom_2;

architecture Behavioral of output_rom_2 is

signal everything : STD_LOGIC_VECTOR (28 downto 0);

begin

with Var select
everything <= "00000101000000000000000000000" when "0000",
"00000101010001000000000000000" when "0001",
"00000101000011000100010100000" when "0010",
"00000101000101001100111000001" when "0011",
"00000101000101010101010010011" when "0100",
"00000101000101010101010010011" when "0101",
"00000101000101010101010010011" when "0110",
"00000101000101010101010011011" when "0111",
"00000101000101010101010011011" when "1000",
"00000101000101010101010011011" when "1001",
"01001110000001010101011110000" when "1010",
"00001000100111000100010000001" when "1011",
"00001000000000000000000000000" when "1100",
"00001000000000000000000000000" when "1101",
"00001000000000000000000000000" when "1110",
"00001000000000000000000000000" when "1111",
"ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" when others;

Branch <= everything(28 downto 25);
Func <= everything(24 downto 23);
Cond <= everything(22 downto 21);
Done <= everything(20);
Datapath <= everything(19 downto 0);

end Behavioral;

