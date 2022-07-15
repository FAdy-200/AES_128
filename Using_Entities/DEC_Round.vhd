library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.Inv_Shift_Row_Package.all;




entity DEC_Round is
port(
		data_in :in STD_LOGIC_VECTOR (127 downto 0);
		data_out : out STD_LOGIC_VECTOR (127 downto 0);
		expanded_key : in STD_LOGIC_VECTOR (127 downto 0)
		);
end DEC_Round;

architecture behavior of DEC_Round is
		signal add_out : STD_LOGIC_VECTOR (127 downto 0);
	   signal mix_out : STD_LOGIC_VECTOR (127 downto 0);
		signal shift_out : STD_LOGIC_VECTOR (127 downto 0);
		
begin
				Add :	entity work.Add(behavior)
                port map(
                    data_in_1 => data_in,
                    data_in_2 => expanded_key,
                    data_out => add_out
                    ); 
				Inv_Mix_Columns :	entity work.Inv_Mix_Column(behavior)
				port map(
					data_in => add_out,
					data_out => mix_out
					);	
                inv_shift_rows(mix_out,shift_out);
				Substitute :	entity work.Substitute_DEC(behavior)
				port map(
					data_in => shift_out,
					data_out => data_out
					);
				
				
end behavior;