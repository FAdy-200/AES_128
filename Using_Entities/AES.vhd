library IEEE;
use ieee.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.all;
use ieee.STD_LOGIC_UNSIGNED.ALL;
--use work.AES_ENC_Package.all;
--use work.AES_DEC_Package.all;
--use work.Key_Expansion_Package.all;


entity AES is
port(
		data_in :in STD_LOGIC_VECTOR (127 downto 0);
		data_out : out STD_LOGIC_VECTOR (127 downto 0);
		key : in STD_LOGIC_VECTOR (127 downto 0);
		mode : in STD_LOGIC
		);
end AES;

architecture main of AES is
	shared variable expanded_key : STD_LOGIC_VECTOR (1407 downto 0);
	signal data_out_enc : STD_LOGIC_VECTOR (127 downto 0); 
begin
		
		U1 :	entity work.ENC(behavior)
				port map(
					data_in => data_in,
					expanded_key => expanded_key,
					data_out => data_out_enc
					);
					
		--expand(key,expanded_key);
		process(mode)
		begin
		case mode is 
			when '0' =>								-- encryption mode
				data_out <= data_out_enc;
			when '1' =>								-- dencryption mode 						
				data_out <= data_in;
				--decrypt(data_in,expanded_key,data_out);			
		end case;
		end process;
end main;
