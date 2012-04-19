----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    11:53:00 10/22/2010 
-- Design Name: 
-- Module Name:    full_adder - Behavioral 
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

entity full_adder is
    Port ( InA : in  STD_LOGIC;
           InB : in  STD_LOGIC;
           InCarry : in  STD_LOGIC;
           OutSum : out  STD_LOGIC;
           OutCarry : out  STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is

component half_adder
Port ( InA : in  STD_LOGIC;
           InB : in  STD_LOGIC;
           OutSum : out  STD_LOGIC;
           OutCarry : out  STD_LOGIC);
end component;

component or_gate
Port ( InA : in  STD_LOGIC;
           InB : in  STD_LOGIC;
           OutC : out  STD_LOGIC);
end component;

signal Signal1, Signal2, Signal3 : STD_LOGIC;

begin

HalfAdder1 : half_adder port map (InA, InB, Signal1, Signal2);
HalfAdder2 : half_adder port map (Signal1, InCarry, OutSum, Signal3);
OrGate : or_gate port map (Signal2, Signal3, OutCarry);

end Behavioral;

