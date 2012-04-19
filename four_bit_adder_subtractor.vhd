----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    21:39:07 10/26/2010 
-- Design Name: 
-- Module Name:    four_bit_adder_subtractor - Behavioral 
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

entity four_bit_adder_subtractor is
    Port ( InA : in  STD_LOGIC_VECTOR(3 downto 0);
           InB : in  STD_LOGIC_VECTOR(3 downto 0);
           InControl : in  STD_LOGIC;
           OutSum : out  STD_LOGIC_VECTOR(3 downto 0);
           OutCarry : out  STD_LOGIC);
end four_bit_adder_subtractor;

architecture Behavioral of four_bit_adder_subtractor is

component n_bit_xor_control
Generic (n : Positive);
    Port ( InA : in  STD_LOGIC_VECTOR(n-1 downto 0);
           InControl : in  STD_LOGIC;
           OutB : out  STD_LOGIC_VECTOR(n-1 downto 0));
end component;

component four_bit_LAC_adder
    Port ( InA : in  STD_LOGIC_VECTOR(3 downto 0);
           InB : in  STD_LOGIC_VECTOR(3 downto 0);
           InCarry : in  STD_LOGIC;
           OutSum : out  STD_LOGIC_VECTOR(3 downto 0);
           OutCarry : out  STD_LOGIC);
end component;

signal Sig1 : STD_LOGIC_VECTOR(3 downto 0); 

begin

n_bit_xor_control_i : n_bit_xor_control generic map (4) port map (InB, InControl, Sig1);
four_bit_LAC_adder_i : four_bit_LAC_adder port map (InA, Sig1, InControl, OutSum, OutCarry);

end Behavioral;

