----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:42:51 04/29/2020 
-- Design Name: 
-- Module Name:    banc_mem - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity banc_mem is
    Port ( Adresse : in  STD_LOGIC_VECTOR (7 downto 0);
           D_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           RW : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           D_OUT : out  STD_LOGIC_VECTOR (7 downto 0));
end banc_mem;

architecture Behavioral of banc_mem is

	type tabData is array(natural range 255 downto 0) of std_logic_vector(7 downto 0);
	signal signalTab : tabData :=(others => b"00000000");
	

begin

	Clock : process
	begin
		wait until CLK'event and CLK='1';
		if RST ='1' then
			signalTab <= (others => b"00000000");
		else
			if RW='0' then
				signalTab(to_integer(unsigned(Adresse))) <= D_IN;
			else
				D_OUT <= signalTab(to_integer(unsigned(Adresse)));
			end if;
		end if;
	end process;


end Behavioral;

