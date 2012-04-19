----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    20:22:22 10/26/2010 
-- Design Name: 
-- Module Name:    n_bit_2_input_multiplexer - Behavioral 
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

entity n_bit_2_input_multiplexer is
Generic ( n: positive := 4 );
    Port ( InA : in  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
           InB : in  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
           InControl : in  STD_LOGIC;
           OutC : out  STD_LOGIC_VECTOR(n-1 DOWNTO 0));
end n_bit_2_input_multiplexer;

architecture Behavioral of n_bit_2_input_multiplexer is

Component two_input_multiplexer
	Port ( InA : in  STD_LOGIC;
           InB : in  STD_LOGIC;
           InControl : in  STD_LOGIC;
           OutC : out  STD_LOGIC);

end Component;

begin

inst : for i in n-1 downto 0 generate
	
	two_input_multiplexer_i : two_input_multiplexer port map (InA(i), InB(i), InControl, OutC(i));

end generate;

end Behavioral;

