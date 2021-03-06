library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


package Substitution_Package is

		  procedure substitute_key(variable data_in : in STD_LOGIC_VECTOR (31 downto 0);
											variable data_out :  out STD_LOGIC_VECTOR (31 downto 0)
                                    );
        

        procedure substitute_all(variable data_in : in STD_LOGIC_VECTOR (127 downto 0);
											variable mode : in STD_LOGIC;
											variable data_out :  out STD_LOGIC_VECTOR (127 downto 0)
                                    );
												
        procedure substitute_element_enc(variable element_in : in STD_LOGIC_VECTOR (7 downto 0);
												variable element_out :  out STD_LOGIC_VECTOR (7 downto 0)
                                    );
		  procedure substitute_element_dec(variable element_in : in STD_LOGIC_VECTOR (7 downto 0);
												variable element_out :  out STD_LOGIC_VECTOR (7 downto 0)
                                    );

end package;

package body Substitution_Package is

		  procedure substitute_key(variable data_in : in STD_LOGIC_VECTOR (31 downto 0);
											variable data_out :  out STD_LOGIC_VECTOR (31 downto 0)
											) is
			begin
				for I in 0 to 3 loop
					substitute_element_enc(data_in(31-I*8 downto 32-I*8-8),data_out(31-I*8 downto 32-I*8-8));
				end loop;			
			end substitute_key;
			
			
			
        procedure substitute_all(variable data_in : in STD_LOGIC_VECTOR (127 downto 0);
											variable mode : in STD_LOGIC;
											variable data_out :  out STD_LOGIC_VECTOR (127 downto 0)
                                    ) is
			begin 
				for I in 0 to 15 loop
					if mode = '0' then
						substitute_element_enc(data_in(127-I*8 downto 128-I*8-8),data_out(127-I*8 downto 128-I*8-8));
					else
						substitute_element_dec(data_in(127-I*8 downto 128-I*8-8),data_out(127-I*8 downto 128-I*8-8));
					end if;
				end loop;
			end substitute_all;
		
			
			
			
			
        procedure substitute_element_enc(variable element_in : in STD_LOGIC_VECTOR (7 downto 0);
												variable element_out :  out STD_LOGIC_VECTOR (7 downto 0)
                                    ) is
			begin 
					case element_in is
						when x"00" => element_out := x"63"; 
						when x"01" => element_out := x"7C"; 
						when x"02" => element_out := x"77"; 
						when x"03" => element_out := x"7B"; 
						when x"04" => element_out := x"F2"; 
						when x"05" => element_out := x"6B"; 
						when x"06" => element_out := x"6F"; 
						when x"07" => element_out := x"C5"; 
						when x"08" => element_out := x"30"; 
						when x"09" => element_out := x"01"; 
						when x"0a" => element_out := x"67"; 
						when x"0b" => element_out := x"2B"; 
						when x"0c" => element_out := x"FE"; 
						when x"0d" => element_out := x"D7"; 
						when x"0e" => element_out := x"AB"; 
						when x"0f" => element_out := x"76"; 
						when x"10" => element_out := x"CA"; 
						when x"11" => element_out := x"82"; 
						when x"12" => element_out := x"C9"; 
						when x"13" => element_out := x"7D"; 
						when x"14" => element_out := x"FA"; 
						when x"15" => element_out := x"59"; 
						when x"16" => element_out := x"47"; 
						when x"17" => element_out := x"F0"; 
						when x"18" => element_out := x"AD"; 
						when x"19" => element_out := x"D4"; 
						when x"1a" => element_out := x"A2"; 
						when x"1b" => element_out := x"AF"; 
						when x"1c" => element_out := x"9C"; 
						when x"1d" => element_out := x"A4"; 
						when x"1e" => element_out := x"72"; 
						when x"1f" => element_out := x"C0"; 
						when x"20" => element_out := x"B7"; 
						when x"21" => element_out := x"FD"; 
						when x"22" => element_out := x"93"; 
						when x"23" => element_out := x"26"; 
						when x"24" => element_out := x"36"; 
						when x"25" => element_out := x"3F"; 
						when x"26" => element_out := x"F7"; 
						when x"27" => element_out := x"CC"; 
						when x"28" => element_out := x"34"; 
						when x"29" => element_out := x"A5"; 
						when x"2a" => element_out := x"E5"; 
						when x"2b" => element_out := x"F1"; 
						when x"2c" => element_out := x"71"; 
						when x"2d" => element_out := x"D8"; 
						when x"2e" => element_out := x"31"; 
						when x"2f" => element_out := x"15"; 
						when x"30" => element_out := x"04"; 
						when x"31" => element_out := x"C7"; 
						when x"32" => element_out := x"23"; 
						when x"33" => element_out := x"C3"; 
						when x"34" => element_out := x"18"; 
						when x"35" => element_out := x"96"; 
						when x"36" => element_out := x"05"; 
						when x"37" => element_out := x"9A"; 
						when x"38" => element_out := x"07"; 
						when x"39" => element_out := x"12"; 
						when x"3a" => element_out := x"80"; 
						when x"3b" => element_out := x"E2"; 
						when x"3c" => element_out := x"EB"; 
						when x"3d" => element_out := x"27"; 
						when x"3e" => element_out := x"B2"; 
						when x"3f" => element_out := x"75"; 
						when x"40" => element_out := x"09"; 
						when x"41" => element_out := x"83"; 
						when x"42" => element_out := x"2C"; 
						when x"43" => element_out := x"1A"; 
						when x"44" => element_out := x"1B"; 
						when x"45" => element_out := x"6E"; 
						when x"46" => element_out := x"5A"; 
						when x"47" => element_out := x"A0"; 
						when x"48" => element_out := x"52"; 
						when x"49" => element_out := x"3B"; 
						when x"4a" => element_out := x"D6"; 
						when x"4b" => element_out := x"B3"; 
						when x"4c" => element_out := x"29"; 
						when x"4d" => element_out := x"E3"; 
						when x"4e" => element_out := x"2F"; 
						when x"4f" => element_out := x"84"; 
						when x"50" => element_out := x"53"; 
						when x"51" => element_out := x"D1"; 
						when x"52" => element_out := x"00"; 
						when x"53" => element_out := x"ED"; 
						when x"54" => element_out := x"20"; 
						when x"55" => element_out := x"FC"; 
						when x"56" => element_out := x"B1"; 
						when x"57" => element_out := x"5B"; 
						when x"58" => element_out := x"6A"; 
						when x"59" => element_out := x"CB"; 
						when x"5a" => element_out := x"BE"; 
						when x"5b" => element_out := x"39"; 
						when x"5c" => element_out := x"4A"; 
						when x"5d" => element_out := x"4C"; 
						when x"5e" => element_out := x"58"; 
						when x"5f" => element_out := x"CF"; 
						when x"60" => element_out := x"D0"; 
						when x"61" => element_out := x"EF"; 
						when x"62" => element_out := x"AA"; 
						when x"63" => element_out := x"FB"; 
						when x"64" => element_out := x"43"; 
						when x"65" => element_out := x"4D"; 
						when x"66" => element_out := x"33"; 
						when x"67" => element_out := x"85"; 
						when x"68" => element_out := x"45"; 
						when x"69" => element_out := x"F9"; 
						when x"6a" => element_out := x"02"; 
						when x"6b" => element_out := x"7F"; 
						when x"6c" => element_out := x"50"; 
						when x"6d" => element_out := x"3C"; 
						when x"6e" => element_out := x"9F"; 
						when x"6f" => element_out := x"A8"; 
						when x"70" => element_out := x"51"; 
						when x"71" => element_out := x"A3"; 
						when x"72" => element_out := x"40"; 
						when x"73" => element_out := x"8F"; 
						when x"74" => element_out := x"92"; 
						when x"75" => element_out := x"9D"; 
						when x"76" => element_out := x"38"; 
						when x"77" => element_out := x"F5"; 
						when x"78" => element_out := x"BC"; 
						when x"79" => element_out := x"B6"; 
						when x"7a" => element_out := x"DA"; 
						when x"7b" => element_out := x"21"; 
						when x"7c" => element_out := x"10"; 
						when x"7d" => element_out := x"FF"; 
						when x"7e" => element_out := x"F3"; 
						when x"7f" => element_out := x"D2"; 
						when x"80" => element_out := x"CD"; 
						when x"81" => element_out := x"0C"; 
						when x"82" => element_out := x"13"; 
						when x"83" => element_out := x"EC"; 
						when x"84" => element_out := x"5F"; 
						when x"85" => element_out := x"97"; 
						when x"86" => element_out := x"44"; 
						when x"87" => element_out := x"17"; 
						when x"88" => element_out := x"C4"; 
						when x"89" => element_out := x"A7"; 
						when x"8a" => element_out := x"7E"; 
						when x"8b" => element_out := x"3D"; 
						when x"8c" => element_out := x"64"; 
						when x"8d" => element_out := x"5D"; 
						when x"8e" => element_out := x"19"; 
						when x"8f" => element_out := x"73"; 
						when x"90" => element_out := x"60"; 
						when x"91" => element_out := x"81"; 
						when x"92" => element_out := x"4F"; 
						when x"93" => element_out := x"DC"; 
						when x"94" => element_out := x"22"; 
						when x"95" => element_out := x"2A"; 
						when x"96" => element_out := x"90"; 
						when x"97" => element_out := x"88"; 
						when x"98" => element_out := x"46"; 
						when x"99" => element_out := x"EE"; 
						when x"9a" => element_out := x"B8"; 
						when x"9b" => element_out := x"14"; 
						when x"9c" => element_out := x"DE"; 
						when x"9d" => element_out := x"5E"; 
						when x"9e" => element_out := x"0B"; 
						when x"9f" => element_out := x"DB"; 
						when x"a0" => element_out := x"E0"; 
						when x"a1" => element_out := x"32"; 
						when x"a2" => element_out := x"3A"; 
						when x"a3" => element_out := x"0A"; 
						when x"a4" => element_out := x"49"; 
						when x"a5" => element_out := x"06"; 
						when x"a6" => element_out := x"24"; 
						when x"a7" => element_out := x"5C"; 
						when x"a8" => element_out := x"C2"; 
						when x"a9" => element_out := x"D3"; 
						when x"aa" => element_out := x"AC"; 
						when x"ab" => element_out := x"62"; 
						when x"ac" => element_out := x"91"; 
						when x"ad" => element_out := x"95"; 
						when x"ae" => element_out := x"E4"; 
						when x"af" => element_out := x"79"; 
						when x"b0" => element_out := x"E7"; 
						when x"b1" => element_out := x"C8"; 
						when x"b2" => element_out := x"37"; 
						when x"b3" => element_out := x"6D"; 
						when x"b4" => element_out := x"8D"; 
						when x"b5" => element_out := x"D5"; 
						when x"b6" => element_out := x"4E"; 
						when x"b7" => element_out := x"A9"; 
						when x"b8" => element_out := x"6C"; 
						when x"b9" => element_out := x"56"; 
						when x"ba" => element_out := x"F4"; 
						when x"bb" => element_out := x"EA"; 
						when x"bc" => element_out := x"65"; 
						when x"bd" => element_out := x"7A"; 
						when x"be" => element_out := x"AE"; 
						when x"bf" => element_out := x"08"; 
						when x"c0" => element_out := x"BA"; 
						when x"c1" => element_out := x"78"; 
						when x"c2" => element_out := x"25"; 
						when x"c3" => element_out := x"2E"; 
						when x"c4" => element_out := x"1C"; 
						when x"c5" => element_out := x"A6"; 
						when x"c6" => element_out := x"B4"; 
						when x"c7" => element_out := x"C6"; 
						when x"c8" => element_out := x"E8"; 
						when x"c9" => element_out := x"DD"; 
						when x"ca" => element_out := x"74"; 
						when x"cb" => element_out := x"1F"; 
						when x"cc" => element_out := x"4B"; 
						when x"cd" => element_out := x"BD"; 
						when x"ce" => element_out := x"8B"; 
						when x"cf" => element_out := x"8A"; 
						when x"d0" => element_out := x"70"; 
						when x"d1" => element_out := x"3E"; 
						when x"d2" => element_out := x"B5"; 
						when x"d3" => element_out := x"66"; 
						when x"d4" => element_out := x"48"; 
						when x"d5" => element_out := x"03"; 
						when x"d6" => element_out := x"F6"; 
						when x"d7" => element_out := x"0E"; 
						when x"d8" => element_out := x"61"; 
						when x"d9" => element_out := x"35"; 
						when x"da" => element_out := x"57"; 
						when x"db" => element_out := x"B9"; 
						when x"dc" => element_out := x"86"; 
						when x"dd" => element_out := x"C1"; 
						when x"de" => element_out := x"1D"; 
						when x"df" => element_out := x"9E"; 
						when x"e0" => element_out := x"E1"; 
						when x"e1" => element_out := x"F8"; 
						when x"e2" => element_out := x"98"; 
						when x"e3" => element_out := x"11"; 
						when x"e4" => element_out := x"69"; 
						when x"e5" => element_out := x"D9"; 
						when x"e6" => element_out := x"8E"; 
						when x"e7" => element_out := x"94"; 
						when x"e8" => element_out := x"9B"; 
						when x"e9" => element_out := x"1E"; 
						when x"ea" => element_out := x"87"; 
						when x"eb" => element_out := x"E9"; 
						when x"ec" => element_out := x"CE"; 
						when x"ed" => element_out := x"55"; 
						when x"ee" => element_out := x"28"; 
						when x"ef" => element_out := x"DF"; 
						when x"f0" => element_out := x"8C"; 
						when x"f1" => element_out := x"A1"; 
						when x"f2" => element_out := x"89"; 
						when x"f3" => element_out := x"0D"; 
						when x"f4" => element_out := x"BF"; 
						when x"f5" => element_out := x"E6"; 
						when x"f6" => element_out := x"42"; 
						when x"f7" => element_out := x"68"; 
						when x"f8" => element_out := x"41"; 
						when x"f9" => element_out := x"99"; 
						when x"fa" => element_out := x"2D"; 
						when x"fb" => element_out := x"0F"; 
						when x"fc" => element_out := x"B0"; 
						when x"fd" => element_out := x"54"; 
						when x"fe" => element_out := x"BB"; 
						when x"ff" => element_out := x"16"; 
					end case;
				
			end substitute_element_enc;
			
		        procedure substitute_element_dec(variable element_in : in STD_LOGIC_VECTOR (7 downto 0);
												variable element_out :  out STD_LOGIC_VECTOR (7 downto 0)
                                    ) is
			begin 
					case element_in is
						when x"00" => element_out := x"52"; 
						when x"01" => element_out := x"09"; 
						when x"02" => element_out := x"6A"; 
						when x"03" => element_out := x"D5"; 
						when x"04" => element_out := x"30"; 
						when x"05" => element_out := x"36"; 
						when x"06" => element_out := x"A5"; 
						when x"07" => element_out := x"38"; 
						when x"08" => element_out := x"BF"; 
						when x"09" => element_out := x"40"; 
						when x"0a" => element_out := x"A3"; 
						when x"0b" => element_out := x"9E"; 
						when x"0c" => element_out := x"81"; 
						when x"0d" => element_out := x"F3"; 
						when x"0e" => element_out := x"D7"; 
						when x"0f" => element_out := x"FB"; 
						when x"10" => element_out := x"7C"; 
						when x"11" => element_out := x"E3"; 
						when x"12" => element_out := x"39"; 
						when x"13" => element_out := x"82"; 
						when x"14" => element_out := x"9B"; 
						when x"15" => element_out := x"2F"; 
						when x"16" => element_out := x"FF"; 
						when x"17" => element_out := x"87"; 
						when x"18" => element_out := x"34"; 
						when x"19" => element_out := x"8E"; 
						when x"1a" => element_out := x"43"; 
						when x"1b" => element_out := x"44"; 
						when x"1c" => element_out := x"C4"; 
						when x"1d" => element_out := x"DE"; 
						when x"1e" => element_out := x"E9"; 
						when x"1f" => element_out := x"CB"; 
						when x"20" => element_out := x"54"; 
						when x"21" => element_out := x"7B"; 
						when x"22" => element_out := x"94"; 
						when x"23" => element_out := x"32"; 
						when x"24" => element_out := x"A6"; 
						when x"25" => element_out := x"C2"; 
						when x"26" => element_out := x"23"; 
						when x"27" => element_out := x"3D"; 
						when x"28" => element_out := x"EE"; 
						when x"29" => element_out := x"4C"; 
						when x"2a" => element_out := x"95"; 
						when x"2b" => element_out := x"0B"; 
						when x"2c" => element_out := x"42"; 
						when x"2d" => element_out := x"FA"; 
						when x"2e" => element_out := x"C3"; 
						when x"2f" => element_out := x"4E"; 
						when x"30" => element_out := x"08"; 
						when x"31" => element_out := x"2E"; 
						when x"32" => element_out := x"A1"; 
						when x"33" => element_out := x"66"; 
						when x"34" => element_out := x"28"; 
						when x"35" => element_out := x"D9"; 
						when x"36" => element_out := x"24"; 
						when x"37" => element_out := x"B2"; 
						when x"38" => element_out := x"76"; 
						when x"39" => element_out := x"5B"; 
						when x"3a" => element_out := x"A2"; 
						when x"3b" => element_out := x"49"; 
						when x"3c" => element_out := x"6D"; 
						when x"3d" => element_out := x"8B"; 
						when x"3e" => element_out := x"D1"; 
						when x"3f" => element_out := x"25"; 
						when x"40" => element_out := x"72"; 
						when x"41" => element_out := x"F8"; 
						when x"42" => element_out := x"F6"; 
						when x"43" => element_out := x"64"; 
						when x"44" => element_out := x"86"; 
						when x"45" => element_out := x"68"; 
						when x"46" => element_out := x"98"; 
						when x"47" => element_out := x"16"; 
						when x"48" => element_out := x"D4"; 
						when x"49" => element_out := x"A4"; 
						when x"4a" => element_out := x"5C"; 
						when x"4b" => element_out := x"CC"; 
						when x"4c" => element_out := x"5D"; 
						when x"4d" => element_out := x"65"; 
						when x"4e" => element_out := x"B6"; 
						when x"4f" => element_out := x"92"; 
						when x"50" => element_out := x"6C"; 
						when x"51" => element_out := x"70"; 
						when x"52" => element_out := x"48"; 
						when x"53" => element_out := x"50"; 
						when x"54" => element_out := x"FD"; 
						when x"55" => element_out := x"ED"; 
						when x"56" => element_out := x"B9"; 
						when x"57" => element_out := x"DA"; 
						when x"58" => element_out := x"5E"; 
						when x"59" => element_out := x"15"; 
						when x"5a" => element_out := x"46"; 
						when x"5b" => element_out := x"57"; 
						when x"5c" => element_out := x"A7"; 
						when x"5d" => element_out := x"8D"; 
						when x"5e" => element_out := x"9D"; 
						when x"5f" => element_out := x"84"; 
						when x"60" => element_out := x"90"; 
						when x"61" => element_out := x"D8"; 
						when x"62" => element_out := x"AB"; 
						when x"63" => element_out := x"00"; 
						when x"64" => element_out := x"8C"; 
						when x"65" => element_out := x"BC"; 
						when x"66" => element_out := x"D3"; 
						when x"67" => element_out := x"0A"; 
						when x"68" => element_out := x"F7"; 
						when x"69" => element_out := x"E4"; 
						when x"6a" => element_out := x"58"; 
						when x"6b" => element_out := x"05"; 
						when x"6c" => element_out := x"B8"; 
						when x"6d" => element_out := x"B3"; 
						when x"6e" => element_out := x"45"; 
						when x"6f" => element_out := x"06"; 
						when x"70" => element_out := x"D0"; 
						when x"71" => element_out := x"2C"; 
						when x"72" => element_out := x"1E"; 
						when x"73" => element_out := x"8F"; 
						when x"74" => element_out := x"CA"; 
						when x"75" => element_out := x"3F"; 
						when x"76" => element_out := x"0F"; 
						when x"77" => element_out := x"02"; 
						when x"78" => element_out := x"C1"; 
						when x"79" => element_out := x"AF"; 
						when x"7a" => element_out := x"BD"; 
						when x"7b" => element_out := x"03"; 
						when x"7c" => element_out := x"01"; 
						when x"7d" => element_out := x"13"; 
						when x"7e" => element_out := x"8A"; 
						when x"7f" => element_out := x"6B"; 
						when x"80" => element_out := x"3A"; 
						when x"81" => element_out := x"91"; 
						when x"82" => element_out := x"11"; 
						when x"83" => element_out := x"41"; 
						when x"84" => element_out := x"4F"; 
						when x"85" => element_out := x"67"; 
						when x"86" => element_out := x"DC"; 
						when x"87" => element_out := x"EA"; 
						when x"88" => element_out := x"97"; 
						when x"89" => element_out := x"F2"; 
						when x"8a" => element_out := x"CF"; 
						when x"8b" => element_out := x"CE"; 
						when x"8c" => element_out := x"F0"; 
						when x"8d" => element_out := x"B4"; 
						when x"8e" => element_out := x"E6"; 
						when x"8f" => element_out := x"73"; 
						when x"90" => element_out := x"96"; 
						when x"91" => element_out := x"AC"; 
						when x"92" => element_out := x"74"; 
						when x"93" => element_out := x"22"; 
						when x"94" => element_out := x"E7"; 
						when x"95" => element_out := x"AD"; 
						when x"96" => element_out := x"35"; 
						when x"97" => element_out := x"85"; 
						when x"98" => element_out := x"E2"; 
						when x"99" => element_out := x"F9"; 
						when x"9a" => element_out := x"37"; 
						when x"9b" => element_out := x"E8"; 
						when x"9c" => element_out := x"1C"; 
						when x"9d" => element_out := x"75"; 
						when x"9e" => element_out := x"DF"; 
						when x"9f" => element_out := x"6E"; 
						when x"a0" => element_out := x"47"; 
						when x"a1" => element_out := x"F1"; 
						when x"a2" => element_out := x"1A"; 
						when x"a3" => element_out := x"71"; 
						when x"a4" => element_out := x"1D"; 
						when x"a5" => element_out := x"29"; 
						when x"a6" => element_out := x"C5"; 
						when x"a7" => element_out := x"89"; 
						when x"a8" => element_out := x"6F"; 
						when x"a9" => element_out := x"B7"; 
						when x"aa" => element_out := x"62"; 
						when x"ab" => element_out := x"0E"; 
						when x"ac" => element_out := x"AA"; 
						when x"ad" => element_out := x"18"; 
						when x"ae" => element_out := x"BE"; 
						when x"af" => element_out := x"1B"; 
						when x"b0" => element_out := x"FC"; 
						when x"b1" => element_out := x"56"; 
						when x"b2" => element_out := x"3E"; 
						when x"b3" => element_out := x"4B"; 
						when x"b4" => element_out := x"C6"; 
						when x"b5" => element_out := x"D2"; 
						when x"b6" => element_out := x"79"; 
						when x"b7" => element_out := x"20"; 
						when x"b8" => element_out := x"9A"; 
						when x"b9" => element_out := x"DB"; 
						when x"ba" => element_out := x"C0"; 
						when x"bb" => element_out := x"FE"; 
						when x"bc" => element_out := x"78"; 
						when x"bd" => element_out := x"CD"; 
						when x"be" => element_out := x"5A"; 
						when x"bf" => element_out := x"F4"; 
						when x"c0" => element_out := x"1F"; 
						when x"c1" => element_out := x"DD"; 
						when x"c2" => element_out := x"A8"; 
						when x"c3" => element_out := x"33"; 
						when x"c4" => element_out := x"88"; 
						when x"c5" => element_out := x"07"; 
						when x"c6" => element_out := x"C7"; 
						when x"c7" => element_out := x"31"; 
						when x"c8" => element_out := x"B1"; 
						when x"c9" => element_out := x"12"; 
						when x"ca" => element_out := x"10"; 
						when x"cb" => element_out := x"59"; 
						when x"cc" => element_out := x"27"; 
						when x"cd" => element_out := x"80"; 
						when x"ce" => element_out := x"EC"; 
						when x"cf" => element_out := x"5F"; 
						when x"d0" => element_out := x"60"; 
						when x"d1" => element_out := x"51"; 
						when x"d2" => element_out := x"7F"; 
						when x"d3" => element_out := x"A9"; 
						when x"d4" => element_out := x"19"; 
						when x"d5" => element_out := x"B5"; 
						when x"d6" => element_out := x"4A"; 
						when x"d7" => element_out := x"0D"; 
						when x"d8" => element_out := x"2D"; 
						when x"d9" => element_out := x"E5"; 
						when x"da" => element_out := x"7A"; 
						when x"db" => element_out := x"9F"; 
						when x"dc" => element_out := x"93"; 
						when x"dd" => element_out := x"C9"; 
						when x"de" => element_out := x"9C"; 
						when x"df" => element_out := x"EF"; 
						when x"e0" => element_out := x"A0"; 
						when x"e1" => element_out := x"E0"; 
						when x"e2" => element_out := x"3B"; 
						when x"e3" => element_out := x"4D"; 
						when x"e4" => element_out := x"AE"; 
						when x"e5" => element_out := x"2A"; 
						when x"e6" => element_out := x"F5"; 
						when x"e7" => element_out := x"B0"; 
						when x"e8" => element_out := x"C8"; 
						when x"e9" => element_out := x"EB"; 
						when x"ea" => element_out := x"BB"; 
						when x"eb" => element_out := x"3C"; 
						when x"ec" => element_out := x"83"; 
						when x"ed" => element_out := x"53"; 
						when x"ee" => element_out := x"99"; 
						when x"ef" => element_out := x"61"; 
						when x"f0" => element_out := x"17"; 
						when x"f1" => element_out := x"2B"; 
						when x"f2" => element_out := x"04"; 
						when x"f3" => element_out := x"7E"; 
						when x"f4" => element_out := x"BA"; 
						when x"f5" => element_out := x"77"; 
						when x"f6" => element_out := x"D6"; 
						when x"f7" => element_out := x"26"; 
						when x"f8" => element_out := x"E1"; 
						when x"f9" => element_out := x"69"; 
						when x"fa" => element_out := x"14"; 
						when x"fb" => element_out := x"63"; 
						when x"fc" => element_out := x"55"; 
						when x"fd" => element_out := x"21"; 
						when x"fe" => element_out := x"0C"; 
						when x"ff" => element_out := x"7D"; 

					end case;
				
			end substitute_element_dec;
			
end Substitution_Package;