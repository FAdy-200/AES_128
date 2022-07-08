library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Key_Expansion is
port(
		key :in STD_LOGIC_VECTOR (127 downto 0);
		expanded_key : out STD_LOGIC_VECTOR (1407 downto 0)
		);
end Key_Expansion;

architecture behavior of Key_Expansion is
begin 		
				Round_1 :	entity work.Key_Expansion_Round(behavior)
				port map(
					subkey_in => key,
					subkey_number => 1,
					subkey_out => expanded_key(1407 downto 1280)
					);
end behavior;