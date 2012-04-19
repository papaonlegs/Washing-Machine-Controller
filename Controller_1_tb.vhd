--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
--
-- Create Date:   23:13:55 12/12/2010
-- Design Name:   
-- Module Name:   H:/ELE335/Serious/lab6/Controller_1_tb.vhd
-- Project Name:  lab6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Controller_1
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
 
ENTITY Controller_1_tb IS
END Controller_1_tb;
 
ARCHITECTURE behavior OF Controller_1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Controller_1
    PORT(
         Start : IN  std_logic;
         Data_not : IN  std_logic;
         Alt : IN  std_logic;
         Datapath_control : OUT  std_logic_vector(19 downto 0);
         Done : OUT  std_logic;
         Reset : IN  std_logic;
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Start : std_logic := '0';
   signal Data_not : std_logic := '0';
   signal Alt : std_logic := '0';
   signal Reset : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Datapath_control : std_logic_vector(19 downto 0);
   signal Done : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Controller_1 PORT MAP (
          Start => Start,
          Data_not => Data_not,
          Alt => Alt,
          Datapath_control => Datapath_control,
          Done => Done,
          Reset => Reset,
          CLK => CLK
        );

 
	CLK <= not CLK after 50 ns;
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
			
			Reset <= '1';
			
			wait for 100 ns;
			
			Reset <= '0';
			Data_not <= '1';
						
			wait for 100 ns;
			
			Start <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;
