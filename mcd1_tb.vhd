--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
--
-- Create Date:   22:17:41 12/13/2010
-- Design Name:   
-- Module Name:   H:/ELE335/Serious/lab6/mcd1_tb.vhd
-- Project Name:  lab6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mcd1
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
 
ENTITY mcd1_tb IS
END mcd1_tb;
 
ARCHITECTURE behavior OF mcd1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mcd1
    PORT(
         Start : IN  std_logic;
         Alt : IN  std_logic;
         Data_in : IN  std_logic_vector(3 downto 0);
         CLK : IN  std_logic;
         Reset : IN  std_logic;
         Done : OUT  std_logic;
         Data_out : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Start : std_logic := '0';
   signal Alt : std_logic := '0';
   signal Data_in : std_logic_vector(3 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal Done : std_logic;
   signal Data_out : std_logic_vector(3 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mcd1 PORT MAP (
          Start => Start,
          Alt => Alt,
          Data_in => Data_in,
          CLK => CLK,
          Reset => Reset,
          Done => Done,
          Data_out => Data_out
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
		Data_in <= "1101";
		
		wait for 100 ns;
		
		Start <= '1';
		
		wait for 100 ns;
		
		Start <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
