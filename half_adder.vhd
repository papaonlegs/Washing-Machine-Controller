----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
-- 
-- Create Date:    11:26:11 10/22/2010 
-- Design Name: 
-- Module Name:    half_adder - Behavioral 
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

entity half_adder is
    Port ( InA : in  STD_LOGIC;
           InB : in  STD_LOGIC;
           OutSum : out  STD_LOGIC;
           OutCarry : out  STD_LOGIC);
end half_adder;

architecture Behavioral of half_adder is

component xor_gate
Port ( InA : in  STD_LOGIC;
           InB : in  STD_LOGIC;
           OutC : out  STD_LOGIC);
end component;

component and_gate
Port ( InA : in  STD_LOGIC;
           InB : in  STD_LOGIC;
           OutC : out  STD_LOGIC);
end component;

begin

Sum : xor_gate port map (InA, InB, OutSum);
Carry : and_gate port map (InA, InB, OutCarry);

end Behavioral;

