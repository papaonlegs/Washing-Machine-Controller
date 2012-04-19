----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    18:13:07 10/30/2010 
-- Design Name: 
-- Module Name:    shift_control_logic - Behavioral 
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

entity shift_control_logic is
    Port ( InA : in  STD_LOGIC_VECTOR(2 downto 0);
           OutB : out  STD_LOGIC_VECTOR(1 downto 0));
end shift_control_logic;

architecture Behavioral of shift_control_logic is

begin

OutB(0) <= (not InA(2)) and (InA(1) or InA(0)) after 7ns;
OutB(1) <= InA(2) and (InA(1) or InA(0)) after 7ns;

end Behavioral;

