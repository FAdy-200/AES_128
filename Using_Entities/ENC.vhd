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
			Add :	entity work.Add(behavior)
				port map(
					data_in_1 => data_in,
					data_in_2 => expanded_key(1407 downto 1280),
					data_out => pre_rounds
					);
			Round_1 :	entity work.ENC_Round(behavior)
				port map(
					data_in => pre_rounds,
					expanded_key => expanded_key(1279 downto 1152),
					data_out => data_out_round_1
					);
			Round_2 :	entity work.ENC_Round(behavior)
				port map(
					data_in => data_out_round_1,
					expanded_key => expanded_key(1151 downto 1024),
					data_out => data_out_round_2
					);
			Round_3 :	entity work.ENC_Round(behavior)
				port map(
					data_in => data_out_round_2,
					expanded_key => expanded_key(1023 downto 896),
					data_out => data_out_round_3
					);
			Round_4 :	entity work.ENC_Round(behavior)
				port map(
					data_in => data_out_round_3,
					expanded_key => expanded_key(895 downto 768),
					data_out => data_out_round_4
					);
			Round_5 :	entity work.ENC_Round(behavior)
				port map(
					data_in => data_out_round_4,
					expanded_key => expanded_key(767 downto 640),
					data_out => data_out_round_5
					);
			Round_6 :	entity work.ENC_Round(behavior)
				port map(
					data_in => data_out_round_5,
					expanded_key => expanded_key(639 downto 512),
					data_out => data_out_round_6
					);
			Round_7 :	entity work.ENC_Round(behavior)
				port map(
					data_in => data_out_round_6,
					expanded_key => expanded_key(511 downto 384),
					data_out => data_out_round_7
					);
			Round_8 :	entity work.ENC_Round(behavior)
				port map(
					data_in => data_out_round_7,
					expanded_key => expanded_key(383 downto 256),
					data_out => data_out_round_8
					);
			Round_9 :	entity work.ENC_Round(behavior)
				port map(
					data_in => data_out_round_8,
					expanded_key => expanded_key(255 downto 128),
					data_out => data_out_round_9
					);
			Last_Round :	entity work.ENC_Last_Round(behavior)
				port map(
					data_in => data_out_round_9,
					expanded_key => expanded_key(127 downto 0),
					data_out => data_out
					);
end behavior;
