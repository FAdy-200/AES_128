library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity DEC is
	port(
			data_in_dec :in STD_LOGIC_VECTOR (127 downto 0);
			data_out_dec : out STD_LOGIC_VECTOR (127 downto 0);
			expanded_key_dec : in STD_LOGIC_VECTOR (1407 downto 0)
			);
	end DEC;

architecture behavior of DEC is
		signal pre_rounds : STD_LOGIC_VECTOR (127 downto 0);
		signal data_out_round_1 : STD_LOGIC_VECTOR(127 downto 0);
		signal data_out_round_2 : STD_LOGIC_VECTOR(127 downto 0);
		signal data_out_round_3 : STD_LOGIC_VECTOR(127 downto 0);
		signal data_out_round_4 : STD_LOGIC_VECTOR(127 downto 0);
		signal data_out_round_5 : STD_LOGIC_VECTOR(127 downto 0);
		signal data_out_round_6 : STD_LOGIC_VECTOR(127 downto 0);
		signal data_out_round_7 : STD_LOGIC_VECTOR(127 downto 0);
		signal data_out_round_8 : STD_LOGIC_VECTOR(127 downto 0);
		signal data_out_round_9 : STD_LOGIC_VECTOR(127 downto 0);
begin 	

			First_Round :	entity work.DEC_Initial_Round(behavior)
			port map(
				data_in => data_in_dec,
				expanded_key => expanded_key_dec(127 downto 0),
				data_out => pre_rounds
				);
			Round_1 :	entity work.DEC_Round(behavior)
				port map(
					data_in => pre_rounds,
					expanded_key => expanded_key_dec(255 downto 128),
					data_out => data_out_round_1
					);
			Round_2 :	entity work.DEC_Round(behavior)
				port map(
					data_in => data_out_round_1,
					expanded_key => expanded_key_dec(383 downto 256),
					data_out => data_out_round_2
					);
			Round_3 :	entity work.DEC_Round(behavior)
				port map(
					data_in => data_out_round_2,
					expanded_key => expanded_key_dec(511 downto 384),
					data_out => data_out_round_3
					);
			Round_4 :	entity work.DEC_Round(behavior)
				port map(
					data_in => data_out_round_3,
					expanded_key => expanded_key_dec(639 downto 512),
					data_out => data_out_round_4
					);
			Round_5 :	entity work.DEC_Round(behavior)
				port map(
					data_in => data_out_round_4,
					expanded_key => expanded_key_dec(767 downto 640),
					data_out => data_out_round_5
					);
			Round_6 :	entity work.DEC_Round(behavior)
				port map(
					data_in => data_out_round_5,
					expanded_key => expanded_key_dec(895 downto 768),
					data_out => data_out_round_6
					);
			Round_7 :	entity work.DEC_Round(behavior)
				port map(
					data_in => data_out_round_6,
					expanded_key => expanded_key_dec(1023 downto 896),
					data_out => data_out_round_7
					);
			Round_8 :	entity work.DEC_Round(behavior)
				port map(
					data_in => data_out_round_7,
					expanded_key => expanded_key_dec(1151 downto 1024),
					data_out => data_out_round_8
					);
			Round_9 :	entity work.DEC_Round(behavior)
				port map(
					data_in => data_out_round_8,
					expanded_key => expanded_key_dec(1279 downto 1152),
					data_out => data_out_round_9
					);
			Add :	entity work.Add(behavior)
				port map(
						data_in_1 => data_out_round_9
						data_in_2 => expanded_key_dec(1407 downto 1280),
						data_out => data_out_dec
						);
end behavior;