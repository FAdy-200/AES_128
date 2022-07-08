library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.Shift_Row_Package.all;
--use work.Mix_Column_Package.all;
use work.Substitution_Package.all;



entity ENC_Round is
port(
		data_in :in STD_LOGIC_VECTOR (127 downto 0);
		data_out : out STD_LOGIC_VECTOR (127 downto 0);
		expanded_key : in STD_LOGIC_VECTOR (127 downto 0)
		);
end ENC_Round;

architecture behavior of ENC_Round is
		signal temp : STD_LOGIC_VECTOR (127 downto 0);
		signal mode : STD_LOGIC;
begin 		
				mode <= '0';
				substitute_all(data_in,mode,temp);
				--shift_rows(temp,temp);
				--temp <= temp xor expanded_key;
				data_out <= temp;
end behavior;