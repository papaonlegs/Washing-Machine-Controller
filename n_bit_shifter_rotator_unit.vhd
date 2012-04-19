----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    17:48:06 10/30/2010 
-- Design Name: 
-- Module Name:    n_bit_shifter_rotator_unit - Behavioral 
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

entity n_bit_shifter_rotator_unit is
generic (n : positive := 4);
    Port ( InData_ln1 : in  STD_LOGIC_VECTOR(n-1 downto 0);
           InData_ln2 : in  STD_LOGIC_VECTOR(n-1 downto 0);
           InRight_in : in  STD_LOGIC;
           InRight_select : in  STD_LOGIC;
           InLeft_in : in  STD_LOGIC;
           InLeft_select : in  STD_LOGIC;
           InControl : in  STD_LOGIC_VECTOR(1 downto 0);
           OutA : out  STD_LOGIC_VECTOR(n-1 downto 0));
end n_bit_shifter_rotator_unit;

architecture Behavioral of n_bit_shifter_rotator_unit is

component two_input_multiplexer
    Port ( InA : in  STD_LOGIC;
           InB : in  STD_LOGIC;
           InControl : in  STD_LOGIC;
           OutC : out  STD_LOGIC);
end component;

component four_input_multiplexer
    Port ( InA : in  STD_LOGIC;
           InB : in  STD_LOGIC;
			  InC : in  STD_LOGIC;
			  InD : in  STD_LOGIC;
           InControl : in  STD_LOGIC_VECTOR(1 downto 0);
           OutE : out  STD_LOGIC);
end component;

signal sig1, sig2 : STD_LOGIC;

begin

two_input_multiplexer_one : two_input_multiplexer port map (InData_ln1(n-1), InRight_in, InRight_select, sig1);
two_input_multiplexer_two : two_input_multiplexer port map (InData_ln1(0), InLeft_in, InLeft_select, sig2);

four_input_multiplexer_one : four_input_multiplexer port map (InData_ln1(0), sig1, InData_ln1(1), InData_ln2(0), InControl, OutA(0));
four_input_multiplexer_two : four_input_multiplexer port map (InData_ln1(n-1), InData_ln1(n-2), sig2, InData_ln2(n-1), InControl, OutA(n-1));

inst : for i in n-2 downto 1 generate

four_input_multiplexer_i : four_input_multiplexer port map (InData_ln1(i), InData_ln1(i-1), InData_ln1(i+1), InData_ln2(i), InControl, OutA(i));

end generate;

end Behavioral;

