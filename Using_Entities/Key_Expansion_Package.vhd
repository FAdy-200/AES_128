library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.Substitution_Package.ALL;

package Key_Expansion_Package is

	procedure expand_round(signal subkey_in : in STD_LOGIC_VECTOR (127 downto 0);
									signal subkey_number: in integer range 1 to 10;
									signal subkey_out :  out STD_LOGIC_VECTOR (127 downto 0)
                                    );
	procedure rcon(signal index: in integer range 1 to 10;
							variable rcon_value: out STD_LOGIC_VECTOR(7 downto 0)
							);
end package;


package body Key_Expansion_Package is

	procedure expand_round(signal subkey_in : in STD_LOGIC_VECTOR (127 downto 0);
									signal subkey_number: in integer range 1 to 10;
									signal subkey_out :  out STD_LOGIC_VECTOR (127 downto 0)
                                    ) is
				variable subkey_out_t:STD_LOGIC_VECTOR(127 downto 0);
				variable temp1:STD_LOGIC_VECTOR (31 downto 0);
				variable temp2:STD_LOGIC_VECTOR (31 downto 0);
				
	begin
			temp1 := subkey_in(31 downto 0);
			rcon(subkey_number,temp2);
			-- rotating the needed word and saving it in temp1
			substitute_key(temp1,temp1);
			temp1 := temp1 xor temp2;
			subkey_out_t(127 downto 128 - 32) := subkey_in(127 downto 128- 32) xor temp1;
			for J in 1 to 3 loop
				-- w[i][j] = w[i][j-1] xor w[i-1][j]
				subkey_out_t(127-32*J downto 128- 32*J - 32) := subkey_out_t(127-32*(J - 1) downto 128- 32*(J-1) - 32) xor subkey_in(127-32*J downto 128- 32*J - 32);
			end loop;
			subkey_out <= subkey_out_t;
	end expand_round;
	
	
	procedure rcon(signal index: in integer range 1 to 10;
							variable rcon_value: out STD_LOGIC_VECTOR (31 downto 0)) is
	begin 
		case index is
			when 1 => 	rcon_value 		:= x"01000000";
			when 2 => 	rcon_value 		:= x"02000000";
			when 3 => 	rcon_value 		:= x"04000000";
			when 4 => 	rcon_value 		:= x"08000000";
			when 5 => 	rcon_value 		:= x"10000000";
			when 6 => 	rcon_value 		:= x"20000000";
			when 7 => 	rcon_value 		:= x"40000000";
			when 8 => 	rcon_value 		:= x"80000000";
			when 9 => 	rcon_value 		:= x"1B000000";
			when 10 => 	rcon_value 		:=	x"36000000";
--			when others => rcon_value 	:= STD_LOGIC_VECTOR(shift_left(x"00800000",index));   -- getting the first 7 rcon values as they are just a 01 shifted left
		end case;
	end rcon;
end Key_Expansion_Package;