----------------------------------------------------------------------------------
-- Company:
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    22:15:34 11/29/2010 
-- Design Name: 
-- Module Name:    rfc - Behavioral 
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

-- declaring entity
entity rfc is
    Port ( DIN : in  STD_LOGIC;
           REA : in  STD_LOGIC;
           REB : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           OA : out  STD_LOGIC;
           OB : out  STD_LOGIC);
end rfc;

architecture Behavioral of rfc is

-- declaring components
component d_flipflop is
    Port ( InD : in  STD_LOGIC;
           InReset : in  STD_LOGIC;
           InPreset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           OutQ : out  STD_LOGIC;
           OutQNot : out  STD_LOGIC);
end component;

component tri_buff is
    Port ( Input : in std_logic;
           enable : in std_logic;
           Output : out std_logic);
end component;

component two_input_multiplexer is
    Port ( InA : in  STD_LOGIC;
           InB : in  STD_LOGIC;
           InControl : in  STD_LOGIC;
           OutC : out  STD_LOGIC);
end component;

-- declaring signals
signal sig1, sig2, dummy : std_logic;

begin
	
	-- instance of multiplexer used to select whether to write or not
	mux : two_input_multiplexer port map(sig1, DIN, WE, sig2);
	
	-- instance of flip flop that holds the value after every clock rising
	dflip : d_flipflop port map(sig2, '0', '0', CLK, sig1, dummy);
	
	-- tristate buffer for output A
	triA : tri_buff port map(sig1, REA, OA);
	
	-- tristate buffer for output B
	triB : tri_buff port map(sig1, REB, OB);

end Behavioral;

