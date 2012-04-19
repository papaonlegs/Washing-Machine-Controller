----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    21:24:33 10/26/2010 
-- Design Name: 
-- Module Name:    four_bit_LAC_adder - Behavioral 
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

entity four_bit_LAC_adder is
    Port ( InA : in  STD_LOGIC_VECTOR(3 downto 0);
           InB : in  STD_LOGIC_VECTOR(3 downto 0);
           InCarry : in  STD_LOGIC;
           OutSum : out  STD_LOGIC_VECTOR(3 downto 0);
           OutCarry : out  STD_LOGIC);
end four_bit_LAC_adder;

architecture Behavioral of four_bit_LAC_adder is

component four_bit_LAC
	 Port ( InA : in  STD_LOGIC_VECTOR(3 downto 0);
           InB : in  STD_LOGIC_VECTOR(3 downto 0);
           InCarry : in  STD_LOGIC;
           OutCarry : out  STD_LOGIC_VECTOR(3 downto 0));
end component;

component n_bit_adder
generic (n : positive);
	 Port ( InA : in  STD_LOGIC_VECTOR(n-1 downto 0);
           InB : in  STD_LOGIC_VECTOR(n-1 downto 0);
           InCarry : in  STD_LOGIC_VECTOR(n-1 downto 0);
           OutSum : out  STD_LOGIC_VECTOR(n-1 downto 0);
           OutCarry : out  STD_LOGIC);
end component;

Signal Carry : STD_LOGIC_VECTOR(3 downto 0);

begin

four_bit_LAC_i : four_bit_LAC port map (InA, InB, InCarry, Carry);
n_bit_adder_i : n_bit_adder generic map (4) port map (InA, InB, Carry, OutSum, OutCarry);

end Behavioral;

