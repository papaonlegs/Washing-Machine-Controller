----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    22:26:22 11/29/2010 
-- Design Name: 
-- Module Name:    eight_n_bit_register_file - Behavioral 
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

entity eight_n_bit_register_file is
generic (n : positive := 4);
    Port ( Data_in : in  STD_LOGIC_VECTOR (n-1 downto 0);
           Read_address_a : in  STD_LOGIC_VECTOR (2 downto 0);
           Read_address_b : in  STD_LOGIC_VECTOR (2 downto 0);
           Write_address : in  STD_LOGIC_VECTOR (2 downto 0);
           REA : in  STD_LOGIC;
           REB : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           OutA : out  STD_LOGIC_VECTOR (n-1 downto 0);
           OutB : out  STD_LOGIC_VECTOR (n-1 downto 0));
end eight_n_bit_register_file;

architecture Behavioral of eight_n_bit_register_file is

component three_to_eight_decoder
    Port ( 	OE : in std_logic;
	 			address : in std_logic_vector(2 downto 0);
            O_outputs : out std_logic_vector(7 downto 0));
end component;

component rfc_register
generic (n : positive := 4);
    Port ( Data_in : in  STD_LOGIC_VECTOR (n-1 downto 0);
           REA : in  STD_LOGIC;
           REB : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           OutA : out  STD_LOGIC_VECTOR (n-1 downto 0);
           OutB : out  STD_LOGIC_VECTOR (n-1 downto 0));
end component;

signal ReadA, ReadB, WriteA : STD_LOGIC_VECTOR (7 downto 0);

begin

three_to_eight_decoder_one : three_to_eight_decoder port map (REA, Read_address_a, ReadA);
three_to_eight_decoder_two : three_to_eight_decoder port map (REB, Read_address_b, ReadB);
three_to_eight_decoder_three : three_to_eight_decoder port map (WE, Write_address, WriteA);

inst : for i in 7 downto 0 generate
	rfc_register_i : rfc_register generic map (n) port map (Data_in, ReadA(i), ReadB(i), WriteA(i), CLK, OutA, OutB);
end generate;

end Behavioral;

