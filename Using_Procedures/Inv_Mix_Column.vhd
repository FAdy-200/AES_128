library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


package Inv_Mix_Column_Package is

	procedure inv_mix_columns(variable data_in_inv_mix : in STD_LOGIC_VECTOR (127 downto 0);
                             variable data_out_inv_mix :  out STD_LOGIC_VECTOR (127 downto 0)
                                    );
	procedure xtime_2(variable element_in_xtime_2 : in STD_LOGIC_VECTOR (7 downto 0);
							variable element_out_xtime_2 : out STD_LOGIC_VECTOR (7 downto 0)
								);
	procedure xtime_e(variable element_in_xtime_e : in STD_LOGIC_VECTOR (7 downto 0);
							variable element_out_xtime_e : out STD_LOGIC_VECTOR (7 downto 0)
								);
	procedure xtime_b(variable element_in_xtime_b : in STD_LOGIC_VECTOR (7 downto 0);
							variable element_out_xtime_b : out STD_LOGIC_VECTOR (7 downto 0)
								);
	procedure xtime_d(variable element_in_xtime_d : in STD_LOGIC_VECTOR (7 downto 0);
							variable element_out_xtime_d : out STD_LOGIC_VECTOR (7 downto 0)
								);
	procedure xtime_9(variable element_in_xtime_9 : in STD_LOGIC_VECTOR (7 downto 0);
							variable element_out_xtime_9 : out STD_LOGIC_VECTOR (7 downto 0)
								);
end package;


package body Inv_Mix_Column_Package is

	procedure inv_mix_columns(variable data_in_inv_mix : in STD_LOGIC_VECTOR (127 downto 0);
                             variable data_out_inv_mix :  out STD_LOGIC_VECTOR (127 downto 0)
                                    ) is
					variable temp_inv_mix:STD_LOGIC_VECTOR (47 downto 0);    -- to hold 4 intermediate values from xtime and two from xor
				begin
					-- 127-32*I is to select column, (j mod 4) is to select row 
					-- j is increeased each operation to componsate for the row shift of the mix matrix
					for I in 0 to 3 loop
						for J in 0 to 3 loop
							xtime_e(data_in_inv_mix(127-32*I - (J mod 4)*8 downto 128-32*I-8 - (J mod 4)*8),temp_inv_mix(47 downto 40));
							xtime_b(data_in_inv_mix(127-32*I- ((J+1) mod 4)*8 downto 128-32*I-8- ((J+1) mod 4)*8),temp_inv_mix(39 downto 32));
							xtime_d(data_in_inv_mix(127-32*I - ((J+2) mod 4)*8 downto 128-32*I-8- ((J+2) mod 4)*8),temp_inv_mix(31 downto 24));
							xtime_9(data_in_inv_mix(127-32*I- ((J+3) mod 4)*8 downto 128-32*I-8- ((J+3) mod 4)*8),temp_inv_mix(23 downto 16));
							temp_inv_mix(15 downto 8) := temp_inv_mix(47 downto 40) xor temp_inv_mix(39 downto 32);
							temp_inv_mix(7 downto 0)	:= temp_inv_mix(31 downto 24) xor temp_inv_mix(23 downto 16);
							data_out_inv_mix(127-32*I-(J mod 4)*8 downto 128-32*I-8-(J mod 4)*8) := temp_inv_mix(15 downto 8) xor temp_inv_mix(7 downto 0);
						end loop;
					end loop;
				end inv_mix_columns;
				
	procedure xtime_2(variable element_in_xtime_2 : in STD_LOGIC_VECTOR (7 downto 0);   -- nedded to be a variable to be used multiple times within other routines
							variable element_out_xtime_2 : out STD_LOGIC_VECTOR (7 downto 0)
								) is
					variable ov_xtime_2:STD_LOGIC;
					variable temp_xtime_2:STD_LOGIC_VECTOR(7 downto 0);
				begin
					ov_xtime_2 := element_in_xtime_2(7);
					case ov_xtime_2 is
						when '0' =>
							element_out_xtime_2 := STD_LOGIC_VECTOR(shift_left(unsigned(element_in_xtime_2), 1));
						when '1' =>
							temp_xtime_2 := STD_LOGIC_VECTOR(shift_left(unsigned(element_in_xtime_2), 1));
							element_out_xtime_2 := temp_xtime_2 xor "00011011";
					end case;
				end xtime_2;
				
				
	procedure xtime_e(variable element_in_xtime_e : in STD_LOGIC_VECTOR (7 downto 0);
						variable element_out_xtime_e : out STD_LOGIC_VECTOR (7 downto 0)
							) is
					variable temp_xtime_e:STD_LOGIC_VECTOR(31 downto 0);
				begin
					xtime_2(element_in_xtime_e,temp_xtime_e(31 downto 24));
					xtime_2(temp_xtime_e(31 downto 24),temp_xtime_e(23 downto 16));
					xtime_2(temp_xtime_e(23 downto 16),temp_xtime_e(15 downto 8));
					
					temp_xtime_e(7 downto 0) := temp_xtime_e(23 downto 16) xor temp_xtime_e(15 downto 8);
					element_out_xtime_e	:=	temp_xtime_e(7 downto 0) xor temp_xtime_e(31 downto 24);
				end xtime_e;
				
				
	procedure xtime_b(variable element_in_xtime_b : in STD_LOGIC_VECTOR (7 downto 0);
						variable element_out_xtime_b : out STD_LOGIC_VECTOR (7 downto 0)
							) is
					variable temp_xtime_b:STD_LOGIC_VECTOR(31 downto 0);
				begin
					xtime_2(element_in_xtime_b,temp_xtime_b(31 downto 24));
					xtime_2(temp_xtime_b(31 downto 24),temp_xtime_b(23 downto 16));
					xtime_2(temp_xtime_b(23 downto 16),temp_xtime_b(15 downto 8));
					
					temp_xtime_b(7 downto 0) := temp_xtime_b(31 downto 24) xor temp_xtime_b(15 downto 8);
					element_out_xtime_b	:=	temp_xtime_b(7 downto 0) xor element_in_xtime_b;
				end xtime_b;
				
				
	procedure xtime_d(variable element_in_xtime_d : in STD_LOGIC_VECTOR (7 downto 0);
						variable element_out_xtime_d : out STD_LOGIC_VECTOR (7 downto 0)
							) is
					variable temp_xtime_d:STD_LOGIC_VECTOR(31 downto 0);
				begin
					xtime_2(element_in_xtime_d,temp_xtime_d(31 downto 24));
					xtime_2(temp_xtime_d(31 downto 24),temp_xtime_d(23 downto 16));
					xtime_2(temp_xtime_d(23 downto 16),temp_xtime_d(15 downto 8));
					
					temp_xtime_d(7 downto 0) := temp_xtime_d(23 downto 16) xor temp_xtime_d(15 downto 8);
					element_out_xtime_d	:=	temp_xtime_d(7 downto 0) xor element_in_xtime_d;
				end xtime_d;
				
				
	procedure xtime_9(variable element_in_xtime_9 : in STD_LOGIC_VECTOR (7 downto 0);
						variable element_out_xtime_9 : out STD_LOGIC_VECTOR (7 downto 0)
							) is
					variable temp_xtime_9:STD_LOGIC_VECTOR(31 downto 0);
				begin
					xtime_2(element_in_xtime_9,temp_xtime_9(31 downto 24));
					xtime_2(temp_xtime_9(31 downto 24),temp_xtime_9(23 downto 16));
					xtime_2(temp_xtime_9(23 downto 16),temp_xtime_9(15 downto 8));
					
					element_out_xtime_9	:=	temp_xtime_9(15 downto 8) xor element_in_xtime_9;
				end xtime_9;
				

end Inv_Mix_Column_Package;