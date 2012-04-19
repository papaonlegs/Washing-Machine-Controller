----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    22:33:42 11/11/2010 
-- Design Name: 
-- Module Name:    n_bit_synchronous_counter_with_parallel_load - Behavioral 
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

entity n_bit_synchronous_counter_with_parallel_load is
generic (n : positive := 8);
    Port ( D_inputs : in  STD_LOGIC_VECTOR(n-1 downto 0);
           Load_count : in  STD_LOGIC;
           Count_enable : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Q_outputs : out  STD_LOGIC_VECTOR(n-1 downto 0));
end n_bit_synchronous_counter_with_parallel_load;

architecture Behavioral of n_bit_synchronous_counter_with_parallel_load is

-- component pf n- bit incrementer
component n_bit_incrementer
generic (n : positive := 4);
    Port ( InA : in  STD_LOGIC_VECTOR(n-1 downto 0);
           InC_in : in  STD_LOGIC;
           OutSum : out  STD_LOGIC_VECTOR(n-1 downto 0);
           OutC_out : out  STD_LOGIC);
end component;

-- component of n-bit 2 input multiplexer
component n_bit_2_input_multiplexer
Generic ( n: positive := 4 );
    Port ( InA : in  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
           InB : in  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
           InControl : in  STD_LOGIC;
           OutC : out  STD_LOGIC_VECTOR(n-1 DOWNTO 0));
end component;

-- component of n-bit register
component n_bit_register
generic (n : positive := 4);
    Port ( CLK : in  STD_LOGIC;
           InD_inputs : in  STD_LOGIC_VECTOR(n-1 downto 0);
           InReset : in  STD_LOGIC;
           InPreset : in  STD_LOGIC;
           OutQ_outputs : out  STD_LOGIC_VECTOR(n-1 downto 0);
           OutQNot_outputs : out  STD_LOGIC_VECTOR(n-1 downto 0));
end component;

-- signals used to convey bits inbetween devices
signal reg_in, in_mux, mux_reg, nc2 : STD_LOGIC_VECTOR(n-1 downto 0);
signal nc : STD_LOGIC;

begin

-- instance of devices
n_bit_incrementer_one : n_bit_incrementer generic map (n) port map (reg_in, Count_enable, in_mux, nc);
n_bit_2_input_multiplexer_one : n_bit_2_input_multiplexer generic map (n) port map (in_mux, D_inputs, Load_count, mux_reg);
n_bit_register_one : n_bit_register generic map (n) port map (CLK, mux_reg, Reset, '0', reg_in, nc2);

-- output is iniated as the signal that passes from the register to the incrementer
Q_outputs <= reg_in;

end Behavioral;

