library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Key_Expansion is
port(
		key :in STD_LOGIC_VECTOR (127 downto 0);
		expanded_key_out : out STD_LOGIC_VECTOR (1407 downto 0)
		);
end Key_Expansion;

architecture behavior of Key_Expansion is
	signal expanded_key :STD_LOGIC_VECTOR (1407 downto 0);
begin 		
				Round_1 :	entity work.Key_Expansion_Round(behavior)
				port map(
					subkey_in => key,
					rcon_value => x"01000000",
					subkey_out => expanded_key(1279 downto 1152)
					);
				Round_2 :	entity work.Key_Expansion_Round(behavior)
				port map(
					subkey_in => expanded_key(1279 downto 1152),
					rcon_value => x"02000000",
					subkey_out => expanded_key(1151 downto 1024)
					);
				Round_3 :	entity work.Key_Expansion_Round(behavior)
				port map(
					subkey_in => expanded_key(1151 downto 1024),
					rcon_value => x"04000000",
					subkey_out => expanded_key(1023 downto 896)
					);
				Round_4 :	entity work.Key_Expansion_Round(behavior)
				port map(
					subkey_in => expanded_key(1023 downto 896),
					rcon_value => x"08000000",
					subkey_out => expanded_key(895 downto 768)
					);
				Round_5 :	entity work.Key_Expansion_Round(behavior)
				port map(
					subkey_in => expanded_key(895 downto 768),
					rcon_value => x"10000000",
					subkey_out => expanded_key(767 downto 640)
					);
				Round_6 :	entity work.Key_Expansion_Round(behavior)
				port map(
					subkey_in => expanded_key(767 downto 640),
					rcon_value => x"20000000",
					subkey_out => expanded_key(639 downto 512)
					);
				Round_7 :	entity work.Key_Expansion_Round(behavior)
				port map(
					subkey_in => expanded_key(639 downto 512),
					rcon_value => x"40000000",
					subkey_out => expanded_key(511 downto 384)
					);
				Round_8 :	entity work.Key_Expansion_Round(behavior)
				port map(
					subkey_in => expanded_key(511 downto 384),
					rcon_value => x"80000000",
					subkey_out => expanded_key(383 downto 256)
					);
				Round_9 :	entity work.Key_Expansion_Round(behavior)
				port map(
					subkey_in => expanded_key(383 downto 256),
					rcon_value => x"1B000000",
					subkey_out => expanded_key(255 downto 128)
					);
				Round_10 :	entity work.Key_Expansion_Round(behavior)
				port map(
					subkey_in => expanded_key(255 downto 128),
					rcon_value => x"36000000",
					subkey_out => expanded_key(127 downto 0)
					);
				expanded_key(1407 downto 1280) <= key;
				expanded_key_out <= expanded_key;
end behavior;