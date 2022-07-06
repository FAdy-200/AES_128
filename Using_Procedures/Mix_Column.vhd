library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


package Mix_Column_Package is

	procedure mix_columns(variable data_in : in STD_LOGIC_VECTOR (127 downto 0);
                             variable data_out :  out STD_LOGIC_VECTOR (127 downto 0)
                                    );
	procedure xtime_2(variable element_in : in STD_LOGIC_VECTOR (7 downto 0);
							variable element_out : out STD_LOGIC_VECTOR (7 downto 0)
								);
	procedure xtime_3(variable element_in : in STD_LOGIC_VECTOR (7 downto 0);
							variable element_out : out STD_LOGIC_VECTOR (7 downto 0)
								);
end package;


package body Mix_Column_Package is

	procedure mix_columns(variable data_in : in STD_LOGIC_VECTOR (127 downto 0);
                             variable data_out :  out STD_LOGIC_VECTOR (127 downto 0)
                                    ) is
					variable temp:STD_LOGIC_VECTOR (47 downto 0);    -- to hold 4 intermediate values from xtime and two from xor
				begin
				 -- 127-32*I is to select column (j mod 4), is to select row 
				 -- j is increeased each operation to componsate for the row shift of the mix matrix
					for I in 0 to 3 loop
						for J in 0 to 3 loop
							xtime_2(data_in(127-32*I - (J mod 4)*8 downto 128-32*I-8 - (J mod 4)*8),temp(47 downto 40));   
							xtime_3(data_in(127-32*I- ((J+1) mod 4)*8 downto 128-32*I-8- ((J+1) mod 4)*8),temp(39 downto 32));
							temp(31 downto 24) := data_in(127-32*I - ((J+2) mod 4)*8 downto 128-32*I-8- ((J+2) mod 4)*8);
							temp(23 downto 16) := data_in(127-32*I- ((J+3) mod 4)*8 downto 128-32*I-8- ((J+3) mod 4)*8);
							temp(15 downto 8) := temp(47 downto 40) xor temp(39 downto 32);
							temp(7 downto 0)	:= temp(31 downto 24) xor temp(23 downto 16);
							data_out(127-32*I-(J mod 4)*8 downto 128-32*I-8-(J mod 4)*8) := temp(15 downto 8) xor temp(7 downto 0);
						end loop;
					end loop;

				end mix_columns;
				
	procedure xtime_2(variable element_in : in STD_LOGIC_VECTOR (7 downto 0);
							variable element_out : out STD_LOGIC_VECTOR (7 downto 0)
								) is
					variable ov:STD_LOGIC;
					variable temp:STD_LOGIC_VECTOR(7 downto 0);
				begin
					ov := element_in(7);
					case ov is
						when '0' =>
							element_out := STD_LOGIC_VECTOR(shift_left(unsigned(element_in), 1));
						when '1' =>
							temp := STD_LOGIC_VECTOR(shift_left(unsigned(element_in), 1));
							element_out := temp xor "00011011";
					end case;
				end xtime_2;
				
	procedure xtime_3(variable element_in : in STD_LOGIC_VECTOR (7 downto 0);
						variable element_out : out STD_LOGIC_VECTOR (7 downto 0)
							) is
					variable temp:STD_LOGIC_VECTOR(7 downto 0);
				begin
					xtime_2(element_in,temp);
					element_out	:=	temp xor element_in;
				end xtime_3;
				
end Mix_Column_Package;