----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    19:21:58 10/28/2010 
-- Design Name: 
-- Module Name:    n_bit_logic_unit - Behavioral 
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

entity n_bit_logic_unit is
generic (n : positive := 4);
    Port ( InA : in  STD_LOGIC_VECTOR(n-1 downto 0);
           InB : in  STD_LOGIC_VECTOR(n-1 downto 0);
           InControl : in  STD_LOGIC_VECTOR(1 downto 0);
           OutC : out  STD_LOGIC_VECTOR(n-1 downto 0));
end n_bit_logic_unit;

architecture Behavioral of n_bit_logic_unit is

component logic_slice
    Port ( InA : in  STD_LOGIC;
           InB : in  STD_LOGIC;
           InControl : in  STD_LOGIC_VECTOR(1 downto 0);
           OutC : out  STD_LOGIC);
end component;

begin

inst : for i in n-1 downto 0 generate

logic_slice_i : logic_slice port map (InA(i), InB(i), InControl, OutC(i));

end generate;

end Behavioral;

