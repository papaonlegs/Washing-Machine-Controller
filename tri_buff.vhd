----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    18:07:51 10/31/2010 
-- Design Name: 
-- Module Name:    tri_buff - Behavioral 
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

entity tri_buff is
    Port ( Input : in  STD_LOGIC;
           Enable : in  STD_LOGIC;
           Output : out  STD_LOGIC);
end tri_buff;

architecture Behavioral of tri_buff is

begin

process(Input, Enable)
	begin
		if Enable = '1' then
			Output <= Input after 7 ns;
		else
			Output <= 'Z' after 7 ns;
		end if;
end process;

end Behavioral;

