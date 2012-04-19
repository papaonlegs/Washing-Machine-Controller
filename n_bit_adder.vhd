----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    20:52:01 10/26/2010 
-- Design Name: 
-- Module Name:    n_bit_adder - Behavioral 
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

entity n_bit_adder is
generic (n : positive := 4);
    Port ( InA : in  STD_LOGIC_VECTOR(n-1 downto 0);
           InB : in  STD_LOGIC_VECTOR(n-1 downto 0);
           InCarry : in  STD_LOGIC_VECTOR(n-1 downto 0);
           OutSum : out  STD_LOGIC_VECTOR(n-1 downto 0);
           OutCarry : out  STD_LOGIC);
end n_bit_adder;

architecture Behavioral of n_bit_adder is

component full_adder
	Port ( InA : in  STD_LOGIC;
           InB : in  STD_LOGIC;
           InCarry : in  STD_LOGIC;
           OutSum : out  STD_LOGIC;
           OutCarry : out  STD_LOGIC);
end component;

signal nc: STD_LOGIC_VECTOR(n-1 downto 0);

begin

inst : for i in n-2 downto 0 generate

	full_adder_i : full_adder port map (InA(i), InB(i), InCarry(i), OutSum(i), nc(i));
	
end generate;

full_adder_n_1 : full_adder port map (InA(n-1), InB(n-1), InCarry(n-1), OutSum(n-1), OutCarry);

end Behavioral;

