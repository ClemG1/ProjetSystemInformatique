--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:12:31 04/29/2020
-- Design Name:   
-- Module Name:   C:/Users/Alex/Documents/INSA/4A/TD_archimat/microprocessor/test_banc_mem.vhd
-- Project Name:  microprocessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: banc_mem
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
 
ENTITY test_banc_mem IS
END test_banc_mem;
 
ARCHITECTURE behavior OF test_banc_mem IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT banc_mem
    PORT(
         Adresse : IN  std_logic_vector(7 downto 0);
         D_IN : IN  std_logic_vector(7 downto 0);
         RW : IN  std_logic;
         RST : IN  std_logic;
         CLK : IN  std_logic;
         D_OUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Adresse : std_logic_vector(7 downto 0) := (others => '0');
   signal D_IN : std_logic_vector(7 downto 0) := (others => '0');
   signal RW : std_logic := '0';
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal D_OUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: banc_mem PORT MAP (
          Adresse => Adresse,
          D_IN => D_IN,
          RW => RW,
          RST => RST,
          CLK => CLK,
          D_OUT => D_OUT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
RST <= '0', '1' after 10 ns , '0' after 20 ns;
Adresse <="00000000", "00000001" after 30 ns, "00000000" after 50 ns;
D_IN <= "11111111", "10101010" after 30 ns, "00000000" after 50 ns;
RW <= '0','1' after 50 ns; 

END;
