--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:42:12 05/11/2020
-- Design Name:   
-- Module Name:   /home/gehin/Documents/insa/projects/ProjetSystemInformatique/microprocessor/datapath_test_bench.vhd
-- Project Name:  microprocessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: datapath
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
 
ENTITY datapath_test_bench IS
END datapath_test_bench;
 
ARCHITECTURE behavior OF datapath_test_bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT datapath
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         REGISTER_OUT_2 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal REGISTER_OUT_2 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: datapath PORT MAP (
          CLK => CLK,
          RST => RST,
          REGISTER_OUT_2 => REGISTER_OUT_2
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
	RST <= '1','0' after 10 ns;

END;
