--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
--
-- Create Date:   22:43:48 11/11/2010
-- Design Name:   
-- Module Name:   H:/ELE335/Serious/First/n_bit_synchronous_counter_with_parallel_load_tb.vhd
-- Project Name:  First
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: n_bit_synchronous_counter_with_parallel_load
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
 
ENTITY n_bit_synchronous_counter_with_parallel_load_tb IS
END n_bit_synchronous_counter_with_parallel_load_tb;
 
ARCHITECTURE behavior OF n_bit_synchronous_counter_with_parallel_load_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT n_bit_synchronous_counter_with_parallel_load
    PORT(
         D_inputs : IN  std_logic_vector(7 downto 0);
         Load_count : IN  std_logic;
         Count_enable : IN  std_logic;
         CLK : IN  std_logic;
         Reset : IN  std_logic;
         Q_outputs : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal D_inputs : std_logic_vector(7 downto 0) := (others => '0');
   signal Load_count : std_logic := '0';
   signal Count_enable : std_logic := '0';
   signal CLK : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal Q_outputs : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: n_bit_synchronous_counter_with_parallel_load PORT MAP (
          D_inputs => D_inputs,
          Load_count => Load_count,
          Count_enable => Count_enable,
          CLK => CLK,
          Reset => Reset,
          Q_outputs => Q_outputs
        );

 CLK <= not CLK after 50 ns; -- repetitive clock pulsing through out the test bench
 
 
 -- The circuit under test is an 8-bit synchronous counter with a count enable and count/load input .
-- This test bench provides a 100ns clock signal to test the counting operation.
-- Load/count is first set to 1 and enabled 100ns afterwards.
-- The counter test all possible input combinations every 100 ns
-- The eight digit D input is '01010101'
 

   -- Stimulus process
   tb: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

     Reset <= '1'; -- enabling the reset so the values of Q are 00000000
	  
	  wait for 100 ns;
	  
	  Reset <= '0'; -- disabling the reset so that the counter can work
	  D_inputs <= "01010101"; -- setting the D input
	  Load_count <= '1'; -- loading the D inputs
	  
	  wait for 200 ns;
	  
	  Load_count <= '0'; -- switch from loading value to counting
	  
	  wait for 200 ns;
	  
	  Count_enable <= '1'; -- enable counting
	  
      -- insert stimulus here 

      wait;
   end process;

END;
