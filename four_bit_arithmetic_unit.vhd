----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    21:50:12 10/26/2010 
-- Design Name: 
-- Module Name:    four_bit_arithmetic_unit - Behavioral 
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

entity four_bit_arithmetic_unit is
    Port ( InA : in  STD_LOGIC_VECTOR(3 downto 0);
           InB : in  STD_LOGIC_VECTOR(3 downto 0);
           InControl : in  STD_LOGIC_VECTOR(1 downto 0);
           OutSum : out  STD_LOGIC_VECTOR(3 downto 0);
           OutCarry : out  STD_LOGIC);
end four_bit_arithmetic_unit;

architecture Behavioral of four_bit_arithmetic_unit is

component n_bit_2_input_multiplexer
Generic ( n: positive);
    Port ( InA : in  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
           InB : in  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
           InControl : in  STD_LOGIC;
           OutC : out  STD_LOGIC_VECTOR(n-1 DOWNTO 0));
end component;

component four_bit_adder_subtractor is
    Port ( InA : in  STD_LOGIC_VECTOR(3 downto 0);
           InB : in  STD_LOGIC_VECTOR(3 downto 0);
           InControl : in  STD_LOGIC;
           OutSum : out  STD_LOGIC_VECTOR(3 downto 0);
           OutCarry : out  STD_LOGIC);
end component;

Signal Sig1 : STD_LOGIC_VECTOR(3 downto 0);

begin

n_bit_2_input_multiplexer_i : n_bit_2_input_multiplexer generic map(4) port map ("0001", InB, InControl(0), Sig1);
four_bit_adder_subtractor_i : four_bit_adder_subtractor port map (InA, Sig1, InControl(1), OutSum, OutCarry);

end Behavioral;

