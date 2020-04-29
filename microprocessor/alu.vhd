----------------------------------------------------------------------------------
-- Company: INSA Toulouse
-- Engineer: Dauriac Alexandre / Gehin Clément
-- 
-- Create Date:    11:25:39 04/29/2020 
-- Design Name: 
-- Module Name:    alu - Behavioral 
-- Project Name: Systeme Informatique
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in  STD_LOGIC_VECTOR (2 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           C : out  STD_LOGIC;
           N : out  STD_LOGIC;
           Z : out  STD_LOGIC;
           O : out  STD_LOGIC);
end alu;

architecture Behavioral of alu is

signal S_16 : STD_LOGIC_VECTOR (15 downto 0);

begin

process (A,B,Ctrl_Alu,S_16) is
begin
	
	case Ctrl_Alu is
		--addition
		when "001" =>
			S_16 <= ("00000000" & A) + ("00000000" & B);
			S <= S_16 (7 downto 0);
			C <= S_16(8);
			N <= S_16(7);
			if A = "00000000" AND B = "00000000" then
				Z <= '1';
			else
				z <= '0';
			end if;
			if A(7) = B(7) AND B(7) /= S_16(7) then
				O <= '1';
			else 
				O <= '0';
			end if;
		--multiplication
		when "010" =>
			S_16 <= A * B;
			S <= S_16 (7 downto 0);
			C <= '0';
			N <= S_16(7);
			if A = "00000000" OR B = "00000000" then
				Z <= '1';
			else
				Z <= '0';
			end if;
			if S_16 (15 downto 8) = "00000000" then
				O <= '0';
			else
				O <= '1';
			end if;
		--substraction
		when "011" =>
			S_16 <= ("00000000" & A) - ("00000000" & B);
			S <= S_16 (7 downto 0);
			C <= '0';
			N <= S_16(7);
			if A = B then
				Z <= '1';
			else
				z <= '0';
			end if;
			if A(7) /= B(7) AND B(7) = S_16(7) then
				O <= '1';
			else 
				O <= '0';
			end if;
		when others =>
			S_16 <= "0000000000000000";
			S <= S_16 (7 downto 0);
			C <= '0';
			N <= '0';
			Z <= '0';
			O <= '0';
			assert false report "Invalid entry for Ctrl_Alu" severity error; 
	end case;

end process;

end Behavioral;

