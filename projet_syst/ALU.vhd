----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:30:34 04/15/2020 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in  STD_LOGIC_VECTOR (2 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           N : out  STD_LOGIC;
           O : out  STD_LOGIC;
           Z : out  STD_LOGIC;
           C : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

signal resultat : std_logic_vector(7 downto 0);
signal val_aux : std_logic_vector(8 downto 0);
signal val_aux_mul : std_logic_vector(15 downto 0);

begin


process(A,B,Ctrl_Alu) is
begin
	-- Questions
	-- signé en entrée?
	-- résultat nul meme si on a une retenue? Z<= ??

	case Ctrl_Alu is
		when "001" =>
			val_aux <= (b"0" & A) + (b"0" & B);
			resultat <= val_aux (7 downto 0);
			C <= val_aux(8);
			N <= '0';
			if (A(7)=B(7))AND(A(7)/=resultat(7)) then
				O <= '1';
			else
				O <= '0';
			end if;
			if val_aux="000000000" then
				Z<='1';
			else
				Z<='0';
			end if;
			
			
		
		when "010" =>
			val_aux <= (b"0" & A) - (b"0" & B);
			if val_aux(8) = '1' then
				resultat <= val_aux(7 downto 0);
				N <= '0';
			else
				resultat <= not(val_aux(7 downto 0))+1;
				N <= '1';
			end if;
			C <= '0';
			if (A(7)/=B(7))AND(B(7)=resultat(7)) then
				O <= '1';
			else
				O <= '0';
			end if;
			if val_aux="000000000" then
				Z<='1';
			else
				Z<='0';
			end if;
			
			
			
		when "011" =>
			val_aux_mul <= A * B;
			resultat <= val_aux_mul(7 downto 0);
			if val_aux_mul(15 downto 8) = "00000000" then
				O <= '0';
			else
				O <= '1';
			end if;
			C <= '0';
			if (A(7)/=B(7)) then
				N <= '1';
			else
				N <= '0';
			end if;
			if (A="000000000")OR(B="000000000") then
				Z<='1';
			else
				Z<='0';
			end if;
			
	end case;
	S<=resultat;
			
		
end process;



end Behavioral;

