----------------------------------------------------------------------------------
-- Company:
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    18:10:10 10/31/2010 
-- Design Name: 
-- Module Name:    n_bit_tri_state_buffer - Behavioral 
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

entity n_bit_tri_state_buffer is
generic (n : positive := 4);
    Port ( InData_in : in  STD_LOGIC_VECTOR(n-1 downto 0);
           Enable : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR(n-1 downto 0));
end n_bit_tri_state_buffer;

architecture Behavioral of n_bit_tri_state_buffer is

component tri_buff
    Port ( Input : in  STD_LOGIC;
           Enable : in  STD_LOGIC;
           Output : out  STD_LOGIC);
end component;

begin

inst : for i in n-1 downto 0 generate

	tri_buff_i : tri_buff port map (InData_in(i), Enable, Output(i));
	
end generate;

end Behavioral;

