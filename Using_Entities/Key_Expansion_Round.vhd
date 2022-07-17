library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.Key_Expansion_Package.all;



entity Key_Expansion_Round is
port(
		subkey_in :in STD_LOGIC_VECTOR (127 downto 0);
		rcon_value: in STD_LOGIC_VECTOR (31 downto 0);
		subkey_out : out STD_LOGIC_VECTOR (127 downto 0)
		);
end Key_Expansion_Round;

architecture behavior of Key_Expansion_Round is
begin 		
		expand_round(subkey_in,rcon_value,subkey_out);
end behavior;