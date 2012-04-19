----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    19:32:27 10/28/2010 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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

entity alu is
    Port ( InA : in  STD_LOGIC_VECTOR(3 downto 0);
           InB : in  STD_LOGIC_VECTOR(3 downto 0);
           InControl : in  STD_LOGIC_VECTOR(2 downto 0);
           OutC : out  STD_LOGIC_VECTOR(3 downto 0);
           OutCarry : out  STD_LOGIC);
end alu;

architecture Behavioral of alu is

component four_bit_arithmetic_unit is
    Port ( InA : in  STD_LOGIC_VECTOR(3 downto 0);
           InB : in  STD_LOGIC_VECTOR(3 downto 0);
           InControl : in  STD_LOGIC_VECTOR(1 downto 0);
           OutSum : out  STD_LOGIC_VECTOR(3 downto 0);
           OutCarry : out  STD_LOGIC);
end component;

component n_bit_logic_unit
generic (n : positive);
    Port ( InA : in  STD_LOGIC_VECTOR(n-1 downto 0);
           InB : in  STD_LOGIC_VECTOR(n-1 downto 0);
           InControl : in  STD_LOGIC_VECTOR(1 downto 0);
           OutC : out  STD_LOGIC_VECTOR(n-1 downto 0));
end component;

component n_bit_2_input_multiplexer
generic (n : positive);
    Port ( InA : in  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
           InB : in  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
           InControl : in  STD_LOGIC;
           OutC : out  STD_LOGIC_VECTOR(n-1 DOWNTO 0));
end component;

signal sig1, sig2 : STD_LOGIC_VECTOR(3 DOWNTO 0);

begin

 four_bit_arithmetic_unit_i : four_bit_arithmetic_unit port map (InA, InB, InControl(1 downto 0), sig1, OutCarry);
 
 n_bit_logic_unit_i : n_bit_logic_unit generic map (4) port map (InA, InB, InControl(1 downto 0), sig2);
 
 n_bit_2_input_multiplexer_i : n_bit_2_input_multiplexer generic map (4) port map (sig1, sig2, InControl(2), OutC);

end Behavioral;

