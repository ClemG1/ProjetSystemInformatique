----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:36:51 04/29/2020 
-- Design Name: 
-- Module Name:    register_file - Behavioral 
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

entity register_file is
    Port ( A_Address : in  STD_LOGIC_VECTOR (3 downto 0);
           B_Address : in  STD_LOGIC_VECTOR (3 downto 0);
           W_Address : in  STD_LOGIC_VECTOR (3 downto 0);
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
end register_file;

architecture Behavioral of register_file is

type Register_File is array (0 to 15) of STD_LOGIC_VECTOR (7 downto 0);
signal registers : Register_File;

begin

process (A_Address,B_Address,W_Address,W,DATA,RST,CLK,registers) is
begin
	if rising_edge(CLK) then
		--reading
		QA <= registers(to_integer(unsigned(A_Address)));
		QB <= registers(to_integer(unsigned(B_Address)));
		--writing
		if W = '1' then
			registers(to_integer(unsigned(W_Address))) <= DATA;
		end if;
		--bypass
		if W = '1' AND A_Address = W_Address then
			QA <= DATA;
		end if;
		if W = '1' AND B_Address = W_Address then
			QB <= DATA;
		end if;
		--reset
		if RST = '1' then
			registers <= (others => b"00000000");
		end if;
	end if;
	
end process;

end Behavioral;

