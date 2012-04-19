----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    18:18:33 10/30/2010 
-- Design Name: 
-- Module Name:    four_bit_shifter - Behavioral 
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

entity four_bit_shifter is
    Port ( InData_in : in  STD_LOGIC_VECTOR(3 downto 0);
           InG : in  STD_LOGIC_VECTOR(2 downto 0);
           OutA : out  STD_LOGIC_VECTOR(3 downto 0));
end four_bit_shifter;

architecture Behavioral of four_bit_shifter is

component shift_control_logic
    Port ( InA : in  STD_LOGIC_VECTOR(2 downto 0);
           OutB : out  STD_LOGIC_VECTOR(1 downto 0));
end component;

component n_bit_shifter_rotator_unit
generic (n : positive := 4);
    Port ( InData_ln1 : in  STD_LOGIC_VECTOR(n-1 downto 0);
           InData_ln2 : in  STD_LOGIC_VECTOR(n-1 downto 0);
           InRight_in : in  STD_LOGIC;
           InRight_select : in  STD_LOGIC;
           InLeft_in : in  STD_LOGIC;
           InLeft_select : in  STD_LOGIC;
           InControl : in  STD_LOGIC_VECTOR(1 downto 0);
           OutA : out  STD_LOGIC_VECTOR(n-1 downto 0));
end component;

signal Control: STD_LOGIC_VECTOR(1 downto 0);
signal nc: STD_LOGIC_VECTOR(3 downto 0);

begin

shift_control_logic_one : shift_control_logic port map (InG, Control);
n_bit_shifter_rotator_unit_one : n_bit_shifter_rotator_unit port map (InData_in, nc, InG(0), InG(1), InG(0), InG(1), Control, OutA);

end Behavioral;

