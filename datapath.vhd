----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    15:23:14 12/13/2010 
-- Design Name: 
-- Module Name:    datapath - Behavioral 
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

entity datapath is
    Port ( Input : in  STD_LOGIC_VECTOR (3 downto 0);
           Control_bits : in  STD_LOGIC_VECTOR (19 downto 0);
           CLK : in  STD_LOGIC;
			  Reset : in STD_LOGIC;
			  Data_not : out  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (3 downto 0));
end datapath;

architecture Behavioral of datapath is

component n_bit_2_input_multiplexer
Generic ( n: positive := 4 );
    Port ( InA : in  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
           InB : in  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
           InControl : in  STD_LOGIC;
           OutC : out  STD_LOGIC_VECTOR(n-1 DOWNTO 0));
end component;

component eight_n_bit_register_file
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
end component;

component alu
    Port ( InA : in  STD_LOGIC_VECTOR(3 downto 0);
           InB : in  STD_LOGIC_VECTOR(3 downto 0);
           InControl : in  STD_LOGIC_VECTOR(2 downto 0);
           OutC : out  STD_LOGIC_VECTOR(3 downto 0);
           OutCarry : out  STD_LOGIC);
end component;

component four_bit_shifter
    Port ( InData_in : in  STD_LOGIC_VECTOR(3 downto 0);
           InG : in  STD_LOGIC_VECTOR(2 downto 0);
           OutA : out  STD_LOGIC_VECTOR(3 downto 0));
end component;

component status_logic
    Port ( Input : in  STD_LOGIC_VECTOR (3 downto 0);
           Output : out  STD_LOGIC);
end component;

component n_bit_load_hold_tristate_output_register
generic (n : positive := 4);
    Port ( InD_inputs : in  STD_LOGIC_VECTOR(n-1 downto 0);
           InLoad_hold : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           InReset : in  STD_LOGIC;
           Output_enable : in  STD_LOGIC;
           OutQ_outputs : out  STD_LOGIC_VECTOR(n-1 downto 0));
end component;

signal shifter_mux, mux_register, register_alua, register_alub, alu_shifter : STD_LOGIC_VECTOR(3 downto 0);
signal dummy : STD_LOGIC;

begin

n_bit_2_input_multiplexer_i : n_bit_2_input_multiplexer generic map (4) port map (shifter_mux, Input, Control_bits(19), mux_register);
eight_n_bit_register_file_i : eight_n_bit_register_file generic map (4) port map (mux_register, Control_bits(14 downto 12), Control_bits(10 downto 8), Control_bits(18 downto 16), Control_bits(11), Control_bits(7), Control_bits(15), CLK, register_alua, register_alub);
alu_i : alu port map (register_alua, register_alub, Control_bits(6 downto 4), alu_shifter, dummy);
four_bit_shifter_i : four_bit_shifter port map (alu_shifter, Control_bits(3 downto 1), shifter_mux);
status_logic_i : status_logic port map (shifter_mux, Data_not);
n_bit_load_hold_tristate_output_register_i : n_bit_load_hold_tristate_output_register generic map (4) port map (shifter_mux, '1', CLK, Reset, Control_bits(0), Output);

end Behavioral;

