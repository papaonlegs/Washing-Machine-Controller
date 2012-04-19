----------------------------------------------------------------------------------
-- Company:
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    17:12:20 10/31/2010 
-- Design Name: 
-- Module Name:    n_bit_register - Behavioral 
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

entity n_bit_register is
generic (n : positive := 4);
    Port ( CLK : in  STD_LOGIC;
           InD_inputs : in  STD_LOGIC_VECTOR(n-1 downto 0);
           InReset : in  STD_LOGIC;
           InPreset : in  STD_LOGIC;
           OutQ_outputs : out  STD_LOGIC_VECTOR(n-1 downto 0);
           OutQNot_outputs : out  STD_LOGIC_VECTOR(n-1 downto 0));
end n_bit_register;

architecture Behavioral of n_bit_register is

component d_flipflop
    Port ( InD : in  STD_LOGIC;
           InReset : in  STD_LOGIC;
           InPreset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           OutQ : out  STD_LOGIC;
           OutQNot : out  STD_LOGIC);
end component;

begin

inst : for i in n-1 downto 0 generate

d_flipflop_i : d_flipflop port map (InD_inputs(i), InReset, InPreset, CLK, OutQ_outputs(i), OutQNot_outputs(i));

end generate;

end Behavioral;

