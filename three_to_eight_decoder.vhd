--------------------------------------------------------------------------------
-- Company:
-- Engineer: Umar Farouk Umar
--
-- Create Date:    14:42:48 10/29/08
-- Design Name:    335labs
-- Module Name:    three_to_eight_decoder - Behavioral
-- Project Name:   Lab 5
-- Target Device:  XCR3064xl-6pc44
-- Tool versions:  Xilinx ISE	   7.104i and ModelSim XE III 6.0a starter 
-- Description:	 Three to eight decoder 
--
-- Dependencies:	none
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- ********* COMMENTS ON HOW THIS DEVICE DESIGN WORKS ******************
--
--	See page 6 of lab script 5
--
-- ENTITY 
-- the entity declaration defines the interface of "four_bit_alu"
--
-- ARCHITECTURE 
-- architecture describes the internal structure of the device 
--
-- COMPONENTS
-- This architecture requires two sub-components that your group 
-- will program for this lab: 
-- * "nbit_reg"
-- * "nbit_incrementer" 
-- 
-- The nbit components have a generic value "n" which must appear in the 
-- component declaration. No default value is needed in the component 
-- declaration but they will be necessary in your entity code for these 
-- devices.
-- 
-- SIGNALS
--	This device uses two internal signals which are both bit vectors 
-- (i.e. they are buses). Note that "dummy" is only used to catch the 
-- output of the Q_bar outputs of the register.
--
-- INSTANCES
--	The two sub-components are instantiated in the main body of the 
-- architecture code and their ports are mapped appropriately according 
-- to the design. Note that the nbit devices require "generic map" to 
-- set the bit-width value "n".
--
-- NOTE: This device will NOT compile or pass a syntax check until code 
-- files for the three sub-compontents are implemented. 
--
-- *********************************************************************

entity three_to_eight_decoder is
    Port ( 	OE : in std_logic;
	 			address : in std_logic_vector(2 downto 0);
            O_outputs : out std_logic_vector(7 downto 0));
end three_to_eight_decoder;

architecture with_select_arch of three_to_eight_decoder is

signal delay : std_logic_vector(7 downto 0) ;
signal choice : std_logic_vector (3 downto 0);

begin

choice(2 downto 0) <= address;
choice(3) <= OE; 

with choice select
      delay <=   "00000001" when "1000",
                 "00000010" when "1001",
                 "00000100" when "1010",
                 "00001000" when "1011",
                 "00010000" when "1100",
                 "00100000" when "1101",
                 "01000000" when "1110",
                 "10000000" when "1111",
					  "00000000" when "0---",
                 "00000000" when others;

O_outputs <= delay after 14 ns;

end with_select_arch;
