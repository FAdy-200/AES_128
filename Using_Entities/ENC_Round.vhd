library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.Shift_Row_Package.all;



entity ENC_Round is
port(
		data_in :in STD_LOGIC_VECTOR (127 downto 0);
		data_out : out STD_LOGIC_VECTOR (127 downto 0);
		expanded_key : in STD_LOGIC_VECTOR (127 downto 0)
		);
end ENC_Round;

architecture behavior of ENC_Round is
		signal substitue_out : STD_LOGIC_VECTOR (127 downto 0);
		signal shift_out : STD_LOGIC_VECTOR (127 downto 0);
		signal mix_out : STD_LOGIC_VECTOR (127 downto 0);
begin 		
				Substitute :	entity work.Substitute_ENC(behavior)
				port map(
					data_in => data_in,
					data_out => substitue_out
					);
				shift_rows(substitue_out,shift_out);
				Mix_Columns :	entity work.Mix_Column(behavior)
				port map(
					data_in => shift_out,
					data_out => mix_out
				);	
				Add :	entity work.Add(behavior)
				port map(
					data_in_1 => mix_out,
					data_in_2 => expanded_key,
					data_out => data_out
					);
end behavior;