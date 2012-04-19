----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    20:13:55 12/08/2010 
-- Design Name: 
-- Module Name:    status_logic - Behavioral 
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

entity status_logic is
    Port ( Input : in  STD_LOGIC_VECTOR (3 downto 0);
           Output : out  STD_LOGIC);
end status_logic;

architecture Behavioral of status_logic is

begin

Output <= not (Input(0) or Input(1) or Input(2) or Input(3));

end Behavioral;

