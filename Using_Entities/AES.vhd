library IEEE;
use ieee.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.all;
use ieee.STD_LOGIC_UNSIGNED.ALL;


entity AES is
port(
		data_in :in STD_LOGIC_VECTOR (127 downto 0);
		data_out : out STD_LOGIC_VECTOR (127 downto 0);
		key : in STD_LOGIC_VECTOR (127 downto 0);
		mode : in STD_LOGIC;
		clk : in STD_LOGIC;
		clk_key: in STD_LOGIC
		);
end AES;

architecture main of AES is
	signal expanded_key_reg : STD_LOGIC_VECTOR (1407 downto 0);
	signal key_reg : STD_LOGIC_VECTOR (127 downto 0);
	signal expanded_key : STD_LOGIC_VECTOR (1407 downto 0);
	signal data_out_enc : STD_LOGIC_VECTOR (127 downto 0); 
	signal data_out_dec : STD_LOGIC_VECTOR (127 downto 0); 
	signal data_in_reg : STD_LOGIC_VECTOR (127 downto 0); 
	signal data_enc_reg : STD_LOGIC_VECTOR (127 downto 0); 
	signal data_dec_reg : STD_LOGIC_VECTOR (127 downto 0); 
	signal temp : STD_LOGIC_VECTOR (127 downto 0);
begin
		
		ENC :	entity work.ENC(behavior)
				port map(
					data_in => data_in_reg,
					expanded_key => expanded_key_reg,
					data_out => data_out_enc,
					clk => clk
					);
		DEC :	entity work.DEC(behavior)
				port map(
					data_in => data_in_reg,
					expanded_key => expanded_key_reg,
					data_out => data_out_dec,
					clk => clk
					);
		Expand :	entity work.Key_Expansion(behavior)
				port map(
					key => key_reg,
					expanded_key_out => expanded_key
					);
					
-- 	REGISTER CREATION
		process (clk)
		begin
			if rising_edge(clk) then 
				data_in_reg<= data_in;
				data_enc_reg <= data_out_enc;
				data_dec_reg <= data_out_dec;
			end if;
		end process;
		
-- 	REGISTER CREATION
		process (clk_key)
		begin
			if rising_edge(clk_key) then 
				key_reg <= key;
				expanded_key_reg <= expanded_key;
			end if;
		end process;
		
-- 	MUX FOR OUTPUT
		process (mode,data_enc_reg,data_in_reg,data_dec_reg)
		begin 
			case mode is
				when '0' => temp <= data_enc_reg;
				when '1' => temp <= data_dec_reg;
				when others => null;
			end case;
		end process;
		data_out <= temp;
end main;
