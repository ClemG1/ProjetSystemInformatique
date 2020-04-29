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

	type tabInstru is array(natural range 255 downto 0) of std_logic_vector(7 downto 0);
	signal signalTab : tabInstru;
	
begin

	Clock : process
	begin
		D_OUT <= signalTab(conv_integer(unsigned(Adresse)));
	end process;

end Behavioral;

