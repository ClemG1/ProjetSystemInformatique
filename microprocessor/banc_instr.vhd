----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:26:23 04/29/2020 
-- Design Name: 
-- Module Name:    banc_instr - Behavioral 
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
use IEEE.NUMERIC_STD.all;
use std.textio.all;
use ieee.std_logic_textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity banc_instr is
    Port ( Adresse : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC;
           D_OUT : out  STD_LOGIC_VECTOR (31 downto 0));
end banc_instr;

architecture Behavioral of banc_instr is

	type tabInstru is array(0 to 255) of std_logic_vector(31 downto 0);
	signal signalTab : tabInstru;
	
	-- Init memory with the filename "init_file" or not.
  impure function init_mem(filename: in string) return tabInstru is
    file f_handler: text;
    variable mem: tabInstru;
    variable f_line: line;
    variable data_line : std_logic_vector(31 downto 0);
    variable good: boolean;
    variable lineno: integer := 0;
  begin
    mem := (others => (others => '0'));
    file_open(f_handler, filename, READ_MODE);
    while (not endfile(f_handler)) loop
      readline(f_handler, f_line);
      hread(f_line, data_line, good);
      assert good report "READ ERROR" severity warning;
      mem(lineno) := data_line;
      lineno := lineno + 1;
    end loop;
    file_close(f_handler);
    return mem;
  end function;

begin

	process (CLK,signalTab,Adresse) is
	begin
		signalTab <= init_mem("init.exe");
		if rising_edge(CLK) then
			D_OUT <= signalTab(to_integer(unsigned(Adresse)));
		end if;
	end process;

end Behavioral;

