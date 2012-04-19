--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
--
-- Create Date:   20:41:50 12/08/2010
-- Design Name:   
-- Module Name:   H:/ELE335/Serious/lab6/function_decode_logic_tb.vhd
-- Project Name:  lab6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: function_decode_logic
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY function_decode_logic_tb IS
END function_decode_logic_tb;
 
ARCHITECTURE behavior OF function_decode_logic_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT function_decode_logic
    PORT(
         Func : IN  std_logic_vector(1 downto 0);
         Condition : IN  std_logic;
         Load_count : OUT  std_logic;
         Enable : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Func : std_logic_vector(1 downto 0) := (others => '0');
   signal Condition : std_logic := '0';

 	--Outputs
   signal Load_count : std_logic;
   signal Enable : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: function_decode_logic PORT MAP (
          Func => Func,
          Condition => Condition,
          Load_count => Load_count,
          Enable => Enable
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      Condition <= '1';
		
		wait for 100 ns;
		
		Func <= "00";
		
		wait for 100 ns;
		
		Func <= "01";
		
		wait for 100 ns;
		
		Func <= "10";
		
		wait for 100 ns;
		
		Func <= "11";

      -- insert stimulus here 

      wait;
   end process;

END;
