----------------------------------------------------------------------------------
-- Company:
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    17:39:12 10/31/2010 
-- Design Name: 
-- Module Name:    n_bit_register_with_load_hold_control - Behavioral 
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

entity n_bit_register_with_load_hold_control is
generic (n : positive := 4);
    Port ( InD_inputs : in  STD_LOGIC_VECTOR(n-1 downto 0);
           InLoad_hold : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           InReset : in  STD_LOGIC;
           InPreset : in  STD_LOGIC;
           OutQ_outputs : out  STD_LOGIC_VECTOR(n-1 downto 0));
end n_bit_register_with_load_hold_control;

architecture Behavioral of n_bit_register_with_load_hold_control is

component n_bit_2_input_multiplexer
Generic ( n: positive := 4 );
    Port ( InA : in  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
           InB : in  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
           InControl : in  STD_LOGIC;
           OutC : out  STD_LOGIC_VECTOR(n-1 DOWNTO 0));
end component;

component n_bit_register
generic (n : positive := 4);
    Port ( CLK : in  STD_LOGIC;
           InD_inputs : in  STD_LOGIC_VECTOR(n-1 downto 0);
           InReset : in  STD_LOGIC;
           InPreset : in  STD_LOGIC;
           OutQ_outputs : out  STD_LOGIC_VECTOR(n-1 downto 0);
           OutQNot_outputs : out  STD_LOGIC_VECTOR(n-1 downto 0));
end component;

signal sig1, sig2, nc : STD_LOGIC_VECTOR(n-1 downto 0);

begin

n_bit_2_input_multiplexer_i : n_bit_2_input_multiplexer generic map (n) port map (sig2, InD_inputs, InLoad_hold, sig1);
n_bit_register_i : n_bit_register generic map (n) port map (CLK, sig1, InReset, InPreset, sig2, nc);

OutQ_outputs <= sig2;

end Behavioral;

