library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity Add is
port(
		data_in_1 :in STD_LOGIC_VECTOR (127 downto 0);
		data_in_2 : in STD_LOGIC_VECTOR (127 downto 0);
		data_out: out STD_LOGIC_VECTOR (127 downto 0)
		);
end Add;

architecture behavior of Add is
begin 		
				data_out <= data_in_1 xor data_in_2;
end behavior;