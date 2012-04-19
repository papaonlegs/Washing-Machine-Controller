----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    22:06:17 10/26/2010 
-- Design Name: 
-- Module Name:    logic_slice - Behavioral 
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

entity logic_slice is
    Port ( InA : in  STD_LOGIC;
           InB : in  STD_LOGIC;
           InControl : in  STD_LOGIC_VECTOR(1 downto 0);
           OutC : out  STD_LOGIC);
end logic_slice;

architecture Behavioral of logic_slice is

component not_gate
	Port ( InA : in  STD_LOGIC;
           OutB : out  STD_LOGIC);
end component;

component and_gate
	Port ( InA : in  STD_LOGIC;
           InB : in  STD_LOGIC;
           OutC : out  STD_LOGIC);
end component;

component xor_gate
	Port ( InA : in  STD_LOGIC;
           InB : in  STD_LOGIC;
           OutC : out  STD_LOGIC);
end component;

component or_gate
	Port ( InA : in  STD_LOGIC;
           InB : in  STD_LOGIC;
           OutC : out  STD_LOGIC);
end component;

component four_input_multiplexer
    Port ( InA : in  STD_LOGIC;
           InB : in  STD_LOGIC;
           InC : in  STD_LOGIC;
           InD : in  STD_LOGIC;
           InControl : in  STD_LOGIC_VECTOR(1 downto 0);
           OutE : out  STD_LOGIC);
end component;

signal Sig1, Sig2, Sig3, Sig4 : STD_LOGIC;

begin

not_gate_i : not_gate port map (InA, Sig1);

and_gate_i : and_gate port map (InA, InB, Sig2);

xor_gate_i : xor_gate port map (InA, InB, Sig3);

or_gate_i : or_gate port map (InA, InB, Sig4);

four_input_multiplexer_i : four_input_multiplexer port map (Sig1, Sig2, Sig3, Sig4, InControl, OutC);

end Behavioral;

