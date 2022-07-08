library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity ENC is
port(
		data_in :in STD_LOGIC_VECTOR (127 downto 0);
		data_out : out STD_LOGIC_VECTOR (127 downto 0);
		expanded_key : in STD_LOGIC_VECTOR (1407 downto 0)
		);
end ENC;

architecture behavior of ENC is
		signal pre_enc : STD_LOGIC_VECTOR (127 downto 0);
		signal data_out_round_1 : STD_LOGIC_VECTOR(127 downto 0);
		
begin 	
			pre_enc <= data_in xor expanded_key(1407 downto 1280);
			U1 :	entity work.ENC_Round(behavior)
				port map(
					data_in => pre_enc,
					expanded_key => expanded_key(1279 downto 1152),
					data_out => data_out_round_1
					);
				data_out <= data_out_round_1;
end behavior;
