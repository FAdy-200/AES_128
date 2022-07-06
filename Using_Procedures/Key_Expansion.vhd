library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.Substitution_Package.ALL;

package Key_Expansion_Package is

	procedure expand(signal key : in STD_LOGIC_VECTOR (127 downto 0);
                             signal expanded_key_out :  out STD_LOGIC_VECTOR (1407 downto 0)
                                    );
	procedure rcon(variable index: in integer;
							variable rcon_value: out STD_LOGIC_VECTOR(7 downto 0)
							);
end package;


package body Key_Expansion_Package is

	procedure expand(signal key : in STD_LOGIC_VECTOR (127 downto 0);
                             signal expanded_key_out :  out STD_LOGIC_VECTOR (1407 downto 0)
                                    ) is
				variable expanded_key:STD_LOGIC_VECTOR (1407 downto 0);
				variable temp1:STD_LOGIC_VECTOR (31 downto 0);
				variable temp2:STD_LOGIC_VECTOR (31 downto 0);
				variable temp3:STD_LOGIC_VECTOR (31 downto 0);
				variable ind : integer;
	begin
		expanded_key(1407 downto 1280) := key;
		for I in 1 to 10 loop
			-- 128*(I-1) is to select needed column/round key
			-- getting the Rcon value of this loop and saving it in temp1
			ind := I;
			rcon(ind,temp2);
			-- rotating the needed word and saving it in temp1
			temp1 := STD_LOGIC_VECTOR(shift_left(unsigned(expanded_key(1407-128*(I-1)-3*32 downto 1408 - 128 * (I-1)- 3 * 32 - 32)),8));
			temp1(7 downto 0) := expanded_key(1407-128*(I-1)-3*32 downto 1408 - 128 * (I-1)-3*32 - 8);
			-- substitute the shifted word and xoring the Rcon value saving it in temp3
			substitute_key(temp1,temp3);
			temp1:=temp3;
			temp3:=temp1 xor temp2;
			-- w[i][0] = temp3 xor w[i-1][0] 
			expanded_key(1407-128*I downto 1408 - 128 * I - 32) := expanded_key(1407-128*(I-1) downto 1408 - 128 * (I-1) - 32) xor temp3;
			for J in 1 to 3 loop
				-- w[i][j] = w[i][j-1] xor w[i-1][j]
				expanded_key(1407-128*I-32*J downto 1408 - 128*I- 32*J - 32) := expanded_key(1407-128*I-32*(J - 1) downto 1408 - 128*I- 32*(J-1) - 32) xor expanded_key(1407-128*(I-1)-32*J downto 1408 - 128*(I-1)- 32*J - 32);
			end loop;
		end loop;
		expanded_key_out <= expanded_key;
	end expand;
	
	
	procedure rcon(variable index: in integer;
							variable rcon_value: out STD_LOGIC_VECTOR (31 downto 0)) is
	begin 
		case index is
			when 9 => 	rcon_value 		:= x"1B000000";
			when 10 => 	rcon_value 		:=	x"36000000";
			when others => rcon_value 	:= STD_LOGIC_VECTOR(shift_left(x"00800000",index));   -- getting the first 7 rcon values as they are just a 01 shifted left
		end case;
	end rcon;
end Key_Expansion_Package;