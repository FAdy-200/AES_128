library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


package Shift_Row_Package is

    
        

        procedure shift_rows(variable data_in : in STD_LOGIC_VECTOR (127 downto 0);
                             variable data_out :  out STD_LOGIC_VECTOR (127 downto 0)
                                    );

end package;

package body Shift_Row_Package is


        procedure shift_rows(variable data_in : in STD_LOGIC_VECTOR (127 downto 0);
                             variable data_out :  out STD_LOGIC_VECTOR (127 downto 0)
                                    ) is
				 variable arrValue : STD_LOGIC_VECTOR (127 downto 0); -- signal of vector type

			begin

            
               arrValue(127 downto 120)	:=	data_in(127 downto 120);
               arrValue(95 downto 88) 		:=	data_in(95 downto 88);
               arrValue(63 downto 56) 		:= data_in(63 downto 56);
               arrValue(31 downto 24) 		:= data_in(31 downto 24);
               arrValue(119 downto 112) 	:= data_in(87 downto 80);
               arrValue(87 downto 80) 		:=	data_in(55 downto 48);
               arrValue(55 downto 48) 		:= data_in(23 downto 16);
               arrValue(23 downto 16) 		:= data_in(119 downto 112);
               arrValue(111 downto 104) 	:= data_in(47 downto 40);
					arrValue(79 downto 72) 		:= data_in(15 downto 8);
               arrValue(47 downto 40) 		:= data_in(111 downto 104);
					arrValue(15 downto 8) 		:= data_in(79 downto 72);
               arrValue(103 downto 96) 	:= data_in(7 downto 0);
               arrValue(71 downto 64) 		:= data_in(103 downto 96);
               arrValue(39 downto 32) 		:= data_in(71 downto 64);
               arrValue(7 downto 0) 		:= data_in(39 downto 32);

					data_out := arrValue;

        end shift_rows;
end Shift_Row_Package;
