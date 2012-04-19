----------------------------------------------------------------------------------
-- Company:
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    18:21:54 10/31/2010 
-- Design Name: 
-- Module Name:    n_bit_load_hold_tristate_output_register - Behavioral 
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

entity n_bit_load_hold_tristate_output_register is
generic (n : positive := 4);
    Port ( InD_inputs : in  STD_LOGIC_VECTOR(n-1 downto 0);
           InLoad_hold : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           InReset : in  STD_LOGIC;
           Output_enable : in  STD_LOGIC;
           OutQ_outputs : out  STD_LOGIC_VECTOR(n-1 downto 0));
end n_bit_load_hold_tristate_output_register;

architecture Behavioral of n_bit_load_hold_tristate_output_register is

component n_bit_register_with_load_hold_control
generic (n : positive := 4);
    Port ( InD_inputs : in  STD_LOGIC_VECTOR(n-1 downto 0);
           InLoad_hold : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           InReset : in  STD_LOGIC;
           InPreset : in  STD_LOGIC;
           OutQ_outputs : out  STD_LOGIC_VECTOR(n-1 downto 0));
end component;

component n_bit_tri_state_buffer
generic (n : positive := 4);
    Port ( InData_in : in  STD_LOGIC_VECTOR(n-1 downto 0);
           Enable : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR(n-1 downto 0));
end component;

signal sig1 : STD_LOGIC_VECTOR(n-1 downto 0);

begin

n_bit_register_with_load_hold_control_i : n_bit_register_with_load_hold_control generic map (n) port map (InD_inputs, InLoad_hold, CLK, InReset, '0', sig1);
n_bit_tri_state_buffer_i : n_bit_tri_state_buffer generic map (n) port map (sig1, Output_enable, OutQ_outputs);

end Behavioral;

