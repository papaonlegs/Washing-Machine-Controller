----------------------------------------------------------------------------------
-- Company:
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    22:21:49 11/29/2010 
-- Design Name: 
-- Module Name:    rfc_register - Behavioral 
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

-- declaring components
entity rfc_register is
generic (n : positive := 4);
    Port ( Data_in : in  STD_LOGIC_VECTOR (n-1 downto 0);
           REA : in  STD_LOGIC;
           REB : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           OutA : out  STD_LOGIC_VECTOR (n-1 downto 0);
           OutB : out  STD_LOGIC_VECTOR (n-1 downto 0));
end rfc_register;

architecture Behavioral of rfc_register is

-- declaring components
component rfc
    Port ( DIN : in  STD_LOGIC;
           REA : in  STD_LOGIC;
           REB : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           OA : out  STD_LOGIC;
           OB : out  STD_LOGIC);
end component;

begin

-- instance of loop
inst : for i in n-1 downto 0 generate
	-- instance of rfc looped so we can get an n bit word output
	rfc_i : rfc port map (Data_in(i), REA, REB, WE, CLK, OutA(i), OutB(i));
end generate;

end Behavioral;

