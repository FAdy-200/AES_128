library IEEE;
use ieee.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.all;
use ieee.STD_LOGIC_UNSIGNED.ALL;
use work.AES_ENC_Package.all;
use work.AES_DEC_Package.all;
use work.Key_Expansion_Package.all;


entity AES is
port(
		data_in :in STD_LOGIC_VECTOR (127 downto 0);
		data_out : out STD_LOGIC_VECTOR (127 downto 0);
		key : in STD_LOGIC_VECTOR (127 downto 0);
		mode : in STD_LOGIC
		);
end AES;

architecture main of AES is
	signal expanded_key : STD_LOGIC_VECTOR (1407 downto 0);
	------ temp
	--	signal	keyt :  STD_LOGIC_VECTOR (127 downto 0):="01010100011010000110000101110100011100110010000001101101011110010010000001001011011101010110111001100111001000000100011001110101";
	--	signal modet :  STD_LOGIC := '0';
	------
begin
	process(mode)
	begin
		expand(key,expanded_key);
		case mode is 
			when '0' =>								-- encryption mode
				encrypt(data_in,expanded_key,data_out);	
			when '1' =>								-- dencryption mode 						
				decrypt(data_in,expanded_key,data_out);	
		end case; 
	end process;
end main;
