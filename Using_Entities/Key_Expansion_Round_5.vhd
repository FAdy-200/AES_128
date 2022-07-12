library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.Key_Expansion_Package.all;



entity Key_Expansion_Round_5 is
port(
		subkey_in :in STD_LOGIC_VECTOR (127 downto 0);
		subkey_out : out STD_LOGIC_VECTOR (127 downto 0)
		);
end Key_Expansion_Round_5;

architecture behavior of Key_Expansion_Round_5 is
	signal subkey_number: integer;
begin 		
		subkey_number <= 5;
		expand_round(subkey_in,subkey_number,subkey_out);
end behavior;