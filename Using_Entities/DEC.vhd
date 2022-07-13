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

			Round_0 :	entity work.DEC_Initial_Round(behavior)
			port map(
				data_in => data_in_dec,
				expanded_key => expanded_key_dec(127 downto 0),
				data_out_dec => pre_rounds
				);
-- package AES_DEC_Package is

--   procedure decrypt(signal data_in_dec : in STD_LOGIC_VECTOR (127 downto 0);
-- 										signal expanded_key_dec : in STD_LOGIC_VECTOR (1407 downto 0);
-- 										signal data_out_dec :  out STD_LOGIC_VECTOR (127 downto 0)
--                                     );

-- end package;


-- package body AES_DEC_Package is

--   procedure decrypt(signal data_in_dec : in STD_LOGIC_VECTOR (127 downto 0);
-- 										signal expanded_key_dec : in STD_LOGIC_VECTOR (1407 downto 0);
-- 										signal data_out_dec :  out STD_LOGIC_VECTOR (127 downto 0)
--                                     ) is
-- 					variable temp_dec : STD_LOGIC_VECTOR (127 downto 0) := data_in_dec;
-- 					variable mode_dec : STD_LOGIC := '1';
-- 			begin
-- --				temp_dec:= temp_dec xor expanded_key_dec(127 downto 0);
-- --				inv_shift_rows(temp_dec,temp_dec);
-- --				substitute_all(temp_dec,mode_dec,temp_dec);
-- --				for I in 9 downto 1 loop
-- --					temp_dec:= temp_dec xor expanded_key_dec(1407 - I*128 downto 1408 - 128 - I * 128);
-- --					inv_mix_columns(temp_dec,temp_dec);
-- --					inv_shift_rows(temp_dec,temp_dec);
-- --					substitute_all(temp_dec,mode_dec,temp_dec);
-- --				end loop;
-- --				temp_dec:= temp_dec xor expanded_key_dec(1407 downto 1280);
-- --				data_out_dec <= temp_dec;
-- 			end decrypt;
-- end AES_DEC_Package;