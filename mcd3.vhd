----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    22:19:27 12/15/2010 
-- Design Name: 
-- Module Name:    mcd3 - Behavioral 
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

entity mcd3 is
Port ( Start : in  STD_LOGIC;
           Alt : in  STD_LOGIC;
           Data_in : in  STD_LOGIC_VECTOR (3 downto 0);
           CLK : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Done : out  STD_LOGIC;
           Data_out : out  STD_LOGIC_VECTOR (3 downto 0));
end mcd3;

architecture Behavioral of mcd3 is

component Controller_3
    Port ( Start : in  STD_LOGIC;
			  Data_not : in STD_LOGIC;
           Alt : in  STD_LOGIC;
			  Datapath_control : out STD_LOGIC_VECTOR(19 downto 0);
           Done : out  STD_LOGIC;
			  Reset : in  STD_LOGIC;
			  CLK : in  STD_LOGIC);
end component;

component datapath
    Port ( Input : in  STD_LOGIC_VECTOR (3 downto 0);
           Control_bits : in  STD_LOGIC_VECTOR (19 downto 0);
           CLK : in  STD_LOGIC;
			  Reset : in STD_LOGIC;
			  Data_not : out  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Data_zero : STD_LOGIC;
signal Control_bits : STD_LOGIC_VECTOR(19 downto 0);

begin

Controller_3_i : Controller_3 port map (Start, Data_zero, Alt, Control_bits, Done, Reset, CLK);
datapath_i : datapath port map (Data_in, Control_bits, CLK, Reset, Data_zero, Data_out);

end Behavioral;

