library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.Substitution_Package.ALL;

package Key_Expansion_Package is

	procedure expand_round(signal subkey_in : in STD_LOGIC_VECTOR (127 downto 0);
									signal rcon_value: in STD_LOGIC_VECTOR (31 downto 0);
									signal subkey_out :  out STD_LOGIC_VECTOR (127 downto 0)
                                    );
end package;


package body Key_Expansion_Package is

	procedure expand_round(signal subkey_in : in STD_LOGIC_VECTOR (127 downto 0);
									signal rcon_value: in STD_LOGIC_VECTOR (31 downto 0);
									signal subkey_out :  out STD_LOGIC_VECTOR (127 downto 0)
                                    ) is
				variable subkey_out_t:STD_LOGIC_VECTOR(127 downto 0);
				variable temp1:STD_LOGIC_VECTOR (31 downto 0);
				
	begin
			temp1 := subkey_in(31 downto 0);
			-- rotating the needed word and saving it in temp1
			substitute_key(temp1,temp1);
			
			temp1 := temp1 xor rcon_value;
			
			subkey_out_t(127 downto 128 - 32) := subkey_in(127 downto 128- 32) xor temp1;
			for J in 1 to 3 loop
				-- w[i][j] = w[i][j-1] xor w[i-1][j]
				subkey_out_t(127-32*J downto 128- 32*J - 32) := subkey_out_t(127-32*(J - 1) downto 128- 32*(J-1) - 32) xor subkey_in(127-32*J downto 128- 32*J - 32);
			end loop;
			subkey_out <= subkey_out_t;
	end expand_round;
	
end Key_Expansion_Package;