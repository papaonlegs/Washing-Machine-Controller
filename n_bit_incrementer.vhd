----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    12:02:26 11/05/2010 
-- Design Name: 
-- Module Name:    n_bit_incrementer - Behavioral 
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

entity n_bit_incrementer is
generic (n : positive := 4);
    Port ( InA : in  STD_LOGIC_VECTOR(n-1 downto 0);
           InC_in : in  STD_LOGIC;
           OutSum : out  STD_LOGIC_VECTOR(n-1 downto 0);
           OutC_out : out  STD_LOGIC);
end n_bit_incrementer;

architecture Behavioral of n_bit_incrementer is

--components
component half_adder
    Port ( InA : in  STD_LOGIC;
           InB : in  STD_LOGIC;
           OutSum : out  STD_LOGIC;
           OutCarry : out  STD_LOGIC);
end component;

signal carry : STD_LOGIC_VECTOR(n-1 downto 0);

begin

--the first adder
half_adder_one : half_adder port map (InA(0), InC_in, OutSum(0), carry(0));

inst : for i in n-1 downto 1 generate -- iterative for loop

--the last half adder
	half_adder_i : half_adder port map (InA(i), carry(i-1), OutSum(i), carry(i));
	
end generate;

OutC_out <= carry(n-1);

end Behavioral;

