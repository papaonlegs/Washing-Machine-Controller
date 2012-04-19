--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
--
-- Create Date:   20:15:21 12/08/2010
-- Design Name:   
-- Module Name:   H:/ELE335/Serious/lab6/status_logic_tb.vhd
-- Project Name:  lab6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: status_logic
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
 
ENTITY status_logic_tb IS
END status_logic_tb;
 
ARCHITECTURE behavior OF status_logic_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT status_logic
    PORT(
         Input : IN  std_logic_vector(3 downto 0);
         Output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Input : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Output : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: status_logic PORT MAP (
          Input => Input,
          Output => Output
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      Input <= "1001";
		
		wait for 100 ns;
		
		Input <= "0000";
		
		wait for 100 ns;
		
		Input <= "1111";

      -- insert stimulus here 

      wait;
   end process;

END;
