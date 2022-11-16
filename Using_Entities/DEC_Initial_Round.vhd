library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.Inv_Shift_Row_Package.all;



entity DEC_Initial_Round is
port(
		data_in :in STD_LOGIC_VECTOR (127 downto 0);
		data_out : out STD_LOGIC_VECTOR (127 downto 0);
		expanded_key : in STD_LOGIC_VECTOR (127 downto 0)
		);
end DEC_Initial_Round;

architecture behavior of DEC_Initial_Round is
		signal add_out : STD_LOGIC_VECTOR (127 downto 0);
		signal inv_shift_out : STD_LOGIC_VECTOR (127 downto 0);
begin
                Add :	entity work.Add(behavior)
                port map(
                    data_in_1 => data_in,
                    data_in_2 => expanded_key,
                    data_out => add_out
                    );
				Substitute :	entity work.Substitute_DEC(behavior)
				port map(
					data_in => add_out,
					data_out => data_out
					);

end behavior;