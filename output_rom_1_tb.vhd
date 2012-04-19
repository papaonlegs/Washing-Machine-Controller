--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Umar Farouk Umar
--
-- Create Date:   23:05:32 12/08/2010
-- Design Name:   
-- Module Name:   H:/ELE335/Serious/lab6/output_rom_1_tb.vhd
-- Project Name:  lab6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: output_rom_1
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
 
ENTITY output_rom_1_tb IS
END output_rom_1_tb;
 
ARCHITECTURE behavior OF output_rom_1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT output_rom_1
    PORT(
         Var : IN  std_logic_vector(3 downto 0);
         Func : OUT  std_logic_vector(1 downto 0);
         Cond : OUT  std_logic_vector(1 downto 0);
         Datapath : OUT  std_logic_vector(19 downto 0);
         Done : OUT  std_logic;
         Branch : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Var : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Func : std_logic_vector(1 downto 0);
   signal Cond : std_logic_vector(1 downto 0);
   signal Datapath : std_logic_vector(19 downto 0);
   signal Done : std_logic;
   signal Branch : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: output_rom_1 PORT MAP (
          Var => Var,
          Func => Func,
          Cond => Cond,
          Datapath => Datapath,
          Done => Done,
          Branch => Branch
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      Var <= "0000";
		
		wait for 100 ns;	

      Var <= "1000";
		
		wait for 100 ns;	

      Var <= "0001";
		
		wait for 100 ns;	

      Var <= "1010";
		
		wait for 100 ns;	

      Var <= "0011";
		
		wait for 100 ns;	

      Var <= "1100";
		
		wait for 100 ns;	

      Var <= "0101";
		
		wait for 100 ns;	

      Var <= "0110";
		
		wait for 100 ns;	

      Var <= "0111";

      -- insert stimulus here 

      wait;
   end process;

END;
