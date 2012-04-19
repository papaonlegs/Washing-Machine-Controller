----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    20:30:55 12/08/2010 
-- Design Name: 
-- Module Name:    function_decode_logic - Behavioral 
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

entity function_decode_logic is
    Port ( Func : in  STD_LOGIC_VECTOR (1 downto 0);
           Condition : in  STD_LOGIC;
           Load_count : out  STD_LOGIC;
           Enable : out  STD_LOGIC);
end function_decode_logic;

architecture Behavioral of function_decode_logic is

begin

process (Func)
	begin
		if Func = "00" then
			Load_count <= '0';
			Enable <= '1';
		elsif Func = "01" then
			Load_count <= '0';
			Enable <= Condition;
		elsif Func = "10" then
			Load_count <= '1';
			Enable <= Condition;
		elsif Func = "11" then
			Load_count <= Condition;
			Enable <= '1';
		end if;
	end process;
	
end Behavioral;

