----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    22:15:37 12/15/2010 
-- Design Name: 
-- Module Name:    Controller_2 - Behavioral 
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

entity Controller_2 is
 Port ( Start : in  STD_LOGIC;
			  Data_not : in STD_LOGIC;
           Alt : in  STD_LOGIC;
			  Datapath_control : out STD_LOGIC_VECTOR(19 downto 0);
           Done : out  STD_LOGIC;
			  Reset : in  STD_LOGIC;
			  CLK : in  STD_LOGIC);
end Controller_2;

architecture Behavioral of Controller_2 is

component four_input_multiplexer
    Port ( InA : in  STD_LOGIC;
           InB : in  STD_LOGIC;
           InC : in  STD_LOGIC;
           InD : in  STD_LOGIC;
           InControl : in  STD_LOGIC_VECTOR(1 downto 0);
           OutE : out  STD_LOGIC);
end component;

component function_decode_logic
    Port ( Func : in  STD_LOGIC_VECTOR (1 downto 0);
           Condition : in  STD_LOGIC;
           Load_count : out  STD_LOGIC;
           Enable : out  STD_LOGIC);
end component;

component n_bit_synchronous_counter_with_parallel_load
generic (n : positive := 8);
    Port ( D_inputs : in  STD_LOGIC_VECTOR(n-1 downto 0);
           Load_count : in  STD_LOGIC;
           Count_enable : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Q_outputs : out  STD_LOGIC_VECTOR(n-1 downto 0));
end component;

component output_rom_2
    Port ( Var	 : in  STD_LOGIC_VECTOR (3 downto 0);
           Func : out  STD_LOGIC_VECTOR (1 downto 0); -- 2nd
           Cond : out  STD_LOGIC_VECTOR (1 downto 0); -- 3rd
           Datapath : out  STD_LOGIC_VECTOR (19 downto 0); -- 5th
           Done : out  STD_LOGIC; -- 4th
           Branch : out  STD_LOGIC_VECTOR (3 downto 0)); -- 1st
end component;

signal mux_dec, dec_count_load, dec_count_enable : STD_LOGIC;
signal count_rom, rom_count_branch : STD_LOGIC_VECTOR (3 downto 0);
signal rom_function, rom_cond : STD_LOGIC_VECTOR (1 downto 0);

begin

four_input_multiplexer_i : four_input_multiplexer port map ('1', Start, Data_not, Alt, rom_cond, mux_dec);
function_decode_logic_i : function_decode_logic port map (rom_function, mux_dec, dec_count_load, dec_count_enable);
n_bit_synchronous_counter_with_parallel_load_i : n_bit_synchronous_counter_with_parallel_load generic map (4) port map (rom_count_branch, dec_count_load, dec_count_enable, CLK, Reset, count_rom);
output_rom_2_i : output_rom_2 port map (count_rom, rom_function, rom_cond, Datapath_control, Done, rom_count_branch);

end Behavioral;

