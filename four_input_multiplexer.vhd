----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    22:02:30 10/26/2010 
-- Design Name: 
-- Module Name:    four_input_multiplexer - Behavioral 
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

entity four_input_multiplexer is
    Port ( InA : in  STD_LOGIC;
           InB : in  STD_LOGIC;
           InC : in  STD_LOGIC;
           InD : in  STD_LOGIC;
           InControl : in  STD_LOGIC_VECTOR(1 downto 0);
           OutE : out  STD_LOGIC);
end four_input_multiplexer;

architecture Behavioral of four_input_multiplexer is

begin

with InControl select
OutE <= InA when "00",
InB when "01",
InC when "10",
InD when others;

end Behavioral;

