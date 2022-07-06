library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.Shift_Row_Package.all;
use work.Mix_Column_Package.all;
use work.Substitution_Package.all;

package AES_ENC_Package is

  procedure encrypt(signal data_in : in STD_LOGIC_VECTOR (127 downto 0);
										signal expanded_key : in STD_LOGIC_VECTOR (1407 downto 0);
										signal data_out :  out STD_LOGIC_VECTOR (127 downto 0)
                                    );

end package;


package body AES_ENC_Package is

  procedure encrypt(signal data_in : in STD_LOGIC_VECTOR (127 downto 0);
										signal expanded_key : in STD_LOGIC_VECTOR (1407 downto 0);
										signal data_out :  out STD_LOGIC_VECTOR (127 downto 0)
                                    ) is
					variable temp : STD_LOGIC_VECTOR (127 downto 0);
					variable mode : STD_LOGIC := '0';
			begin
				temp:= data_in xor expanded_key(1407 downto 1280);
				for I in 1 to 9 loop
					substitute_all(temp,mode,temp);
					shift_rows(temp,temp);
					mix_columns(temp,temp);
					temp:= temp xor expanded_key(1407 - I*128 downto 1408 - 128 - I * 128);
				end loop;
				substitute_all(temp,mode,temp);
				shift_rows(temp,temp);
				temp:= temp xor expanded_key(127 downto 0);
				data_out <= temp;
			end encrypt;
end AES_ENC_Package;