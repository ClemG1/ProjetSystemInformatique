----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:04:38 05/06/2020 
-- Design Name: 
-- Module Name:    datapath - Structural 
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

entity datapath is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  REGISTER_OUT_2 : out STD_LOGIC_VECTOR (7 downto 0));
end datapath;

architecture Behavioral of datapath is

signal A_LI_DI : STD_LOGIC_VECTOR (7 downto 0);
signal OP_LI_DI : STD_LOGIC_VECTOR (7 downto 0);
signal B_LI_DI : STD_LOGIC_VECTOR (7 downto 0);
signal C_LI_DI : STD_LOGIC_VECTOR (7 downto 0);

signal A_DI_EX : STD_LOGIC_VECTOR (7 downto 0);
signal OP_DI_EX : STD_LOGIC_VECTOR (7 downto 0);
signal B_DI_EX : STD_LOGIC_VECTOR (7 downto 0);
signal C_DI_EX : STD_LOGIC_VECTOR (7 downto 0);

signal A_EX_MEM : STD_LOGIC_VECTOR (7 downto 0);
signal OP_EX_MEM : STD_LOGIC_VECTOR (7 downto 0);
signal B_EX_MEM : STD_LOGIC_VECTOR (7 downto 0);

signal A_MEM_RE : STD_LOGIC_VECTOR (7 downto 0);
signal OP_MEM_RE : STD_LOGIC_VECTOR (7 downto 0);
signal B_MEM_RE : STD_LOGIC_VECTOR (7 downto 0);

--instruction signal
signal INSTR_OUT : STD_LOGIC_VECTOR (31 downto 0);
signal INSTR_NUM : STD_LOGIC_VECTOR (7 downto 0) := "00000000";

--register file signal
signal QA_OUT : STD_LOGIC_VECTOR (7 downto 0);

--LC signals
signal LC_RF : STD_LOGIC;

--temporary signal for register
signal B_RF : STD_LOGIC_VECTOR (3 downto 0);

begin

register_file_instance : entity WORK.register_file
port map (
	A_Address => B_LI_DI (3 downto 0),
	B_Address => B_RF,
	W_Address => A_MEM_RE (3 downto 0),
	W => LC_RF,
	DATA => B_MEM_RE,
	RST => RST,
	CLK => CLK,
	QA => QA_OUT,
	QB => REGISTER_OUT_2);
	
banc_instr_instance : entity WORK.banc_instr
port map (
	Adresse => INSTR_NUM,
	CLK => CLK,
	D_OUT => INSTR_OUT);
	
IP : process (CLK, INSTR_NUM, RST)
begin
	if RST = '1' then
		INSTR_NUM <= "11111111";
	else 
		if rising_edge(CLK) then
			INSTR_NUM <= INSTR_NUM + 1;
		end if;
	end if;
end process;

LC_RF_PROCESS : process (OP_MEM_RE)
begin
	case OP_MEM_RE is
		--AFC
		when "00000110" =>
			LC_RF  <= '1';
		when "00000101" =>
			LC_RF  <= '1';
		when others =>
			LC_RF  <= '0';
	end case;
end process;

LI_DI : process (CLK,INSTR_OUT,RST)
begin
	if RST = '0' then
		if rising_edge(CLK) then
			OP_LI_DI <= INSTR_OUT (31 downto 24);
			A_LI_DI <= INSTR_OUT (23 downto 16);
			B_LI_DI <= INSTR_OUT (15 downto 8);
			C_LI_DI <= INSTR_OUT (7 downto 0);
		end if;
	else
		OP_LI_DI <= "00000000";
		A_LI_DI <= "00000000";
		B_LI_DI <= "00000000";
		C_LI_DI <= "00000000";
	end if;
end process;

MUX : process (CLK, OP_LI_DI, B_LI_DI, QA_OUT, RST)
begin
	if RST = '0' then
		if rising_edge(CLK) then
			case OP_DI_EX is
				--CPY
				when "00000101" =>
					B_DI_EX <= QA_OUT;
				when others =>
					B_DI_EX <= B_LI_DI;
			end case;
		end if;
	else
		B_DI_EX <= "00000000";
	end if;
end process;

DI_EX : process (CLK, OP_LI_DI, A_LI_DI, B_LI_DI, RST)
begin
	if RST = '0' then
		if rising_edge(CLK) then
			OP_DI_EX <= OP_LI_DI;
			A_DI_EX <= A_LI_DI;
		end if;
	else
		OP_DI_EX <= "00000000";
		A_DI_EX <= "00000000";
	end if;
end process;

EX_MEM : process (CLK, OP_DI_EX, A_DI_EX, B_DI_EX,RST)
begin
	if RST = '0' then
		if rising_edge(CLK) then
			OP_EX_MEM <= OP_DI_EX;
			A_EX_MEM <= A_DI_EX;
			B_EX_MEM <= B_DI_EX;
		end if;
	else
		OP_EX_MEM <= "00000000";
		A_EX_MEM <= "00000000";
		B_EX_MEM <= "00000000";
	end if;
end process;

MEM_RE : process (CLK, OP_EX_MEM, A_EX_MEM, B_EX_MEM,RST)
begin
	if RST = '0' then
		if rising_edge(CLK) then
			OP_MEM_RE <= OP_EX_MEM;
			A_MEM_RE <= A_EX_MEM;
			B_MEM_RE <= B_EX_MEM;
		end if;
	else
		OP_MEM_RE <= "00000000";
		A_MEM_RE <= "00000000";
		B_MEM_RE <= "00000000";
	end if;
end process;

end Behavioral;

