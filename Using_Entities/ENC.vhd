library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity ENC is
port(
		data_in :in STD_LOGIC_VECTOR (127 downto 0);
		data_out : out STD_LOGIC_VECTOR (127 downto 0);
		clk: in STD_LOGIC;
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
		signal pre_rounds_reg : STD_LOGIC_VECTOR (127 downto 0);
		signal data_out_round_1_reg : STD_LOGIC_VECTOR(127 downto 0);
		signal data_out_round_2_reg : STD_LOGIC_VECTOR(127 downto 0);
		signal data_out_round_3_reg : STD_LOGIC_VECTOR(127 downto 0);
		signal data_out_round_4_reg : STD_LOGIC_VECTOR(127 downto 0);
		signal data_out_round_5_reg : STD_LOGIC_VECTOR(127 downto 0);
		signal data_out_round_6_reg : STD_LOGIC_VECTOR(127 downto 0);
		signal data_out_round_7_reg : STD_LOGIC_VECTOR(127 downto 0);
		signal data_out_round_8_reg : STD_LOGIC_VECTOR(127 downto 0);
		signal data_out_round_9_reg : STD_LOGIC_VECTOR(127 downto 0);
begin 	
			Add :	entity work.Add(behavior)
				port map(
					data_in_1 => data_in,
					data_in_2 => expanded_key(1407 downto 1280),
					data_out => pre_rounds
					);
			Round_1 :	entity work.ENC_Round(behavior)
				port map(
					data_in => pre_rounds_reg,
					expanded_key => expanded_key(1279 downto 1152),
					data_out => data_out_round_1
					);
			Round_2 :	entity work.ENC_Round(behavior)
				port map(
					data_in => data_out_round_1_reg,
					expanded_key => expanded_key(1151 downto 1024),
					data_out => data_out_round_2
					);
			Round_3 :	entity work.ENC_Round(behavior)
				port map(
					data_in => data_out_round_2_reg,
					expanded_key => expanded_key(1023 downto 896),
					data_out => data_out_round_3
					);
			Round_4 :	entity work.ENC_Round(behavior)
				port map(
					data_in => data_out_round_3_Reg,
					expanded_key => expanded_key(895 downto 768),
					data_out => data_out_round_4
					);
			Round_5 :	entity work.ENC_Round(behavior)
				port map(
					data_in => data_out_round_4_reg,
					expanded_key => expanded_key(767 downto 640),
					data_out => data_out_round_5
					);
			Round_6 :	entity work.ENC_Round(behavior)
				port map(
					data_in => data_out_round_5_reg,
					expanded_key => expanded_key(639 downto 512),
					data_out => data_out_round_6
					);
			Round_7 :	entity work.ENC_Round(behavior)
				port map(
					data_in => data_out_round_6_reg,
					expanded_key => expanded_key(511 downto 384),
					data_out => data_out_round_7
					);
			Round_8 :	entity work.ENC_Round(behavior)
				port map(
					data_in => data_out_round_7_reg,
					expanded_key => expanded_key(383 downto 256),
					data_out => data_out_round_8
					);
			Round_9 :	entity work.ENC_Round(behavior)
				port map(
					data_in => data_out_round_8_reg,
					expanded_key => expanded_key(255 downto 128),
					data_out => data_out_round_9
					);
			Last_Round :	entity work.ENC_Last_Round(behavior)
				port map(
					data_in => data_out_round_9_reg,
					expanded_key => expanded_key(127 downto 0),
					data_out => data_out
					);
-- 	REGISTER CREATION
		process (clk)
		begin
			if rising_edge(clk) then 
				pre_rounds_reg <= pre_rounds;
				data_out_round_1_reg <=data_out_round_1;
				data_out_round_2_reg <=data_out_round_2;
				data_out_round_3_reg <=data_out_round_3;
				data_out_round_4_reg <=data_out_round_4;
				data_out_round_5_reg <=data_out_round_5;
				data_out_round_6_reg <=data_out_round_6;
				data_out_round_7_reg <=data_out_round_7;
				data_out_round_8_reg <=data_out_round_8;
				data_out_round_9_reg <=data_out_round_9;
			end if;
		end process;
end behavior;
