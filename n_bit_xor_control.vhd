----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    20:41:09 10/26/2010 
-- Design Name: 
-- Module Name:    n_bit_xor_control - Behavioral 
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

entity n_bit_xor_control is
Generic (n : Positive := 4);
    Port ( InA : in  STD_LOGIC_VECTOR(n-1 downto 0);
           InControl : in  STD_LOGIC;
           OutB : out  STD_LOGIC_VECTOR(n-1 downto 0));
end n_bit_xor_control;

architecture Behavioral of n_bit_xor_control is

component xor_gate
Port ( InA : in  STD_LOGIC;
           InB : in  STD_LOGIC;
           OutC : out  STD_LOGIC);
end component;

begin

inst : for i in n-1 downto 0 generate

	xor_gate_i : xor_gate port map (InA(i), InControl, OutB(i));
	
end generate;

end Behavioral;

