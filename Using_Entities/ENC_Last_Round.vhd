library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.Shift_Row_Package.all;



entity ENC_Last_Round is
port(
		data_in :in STD_LOGIC_VECTOR (127 downto 0);
		data_out : out STD_LOGIC_VECTOR (127 downto 0);
		expanded_key : in STD_LOGIC_VECTOR (127 downto 0)
		);
end ENC_Last_Round;

architecture behavior of ENC_Last_Round is
		signal substitue_out : STD_LOGIC_VECTOR (127 downto 0);
		signal shift_out : STD_LOGIC_VECTOR (127 downto 0);
begin 		
				Substitute :	entity work.Substitute_ENC(behavior)
				port map(
					data_in => data_in,
					data_out => substitue_out
					);
				Add :	entity work.Add(behavior)
				port map(
					data_in_1 => substitue_out,
					data_in_2 => expanded_key,
					data_out => data_out
					);
end behavior;