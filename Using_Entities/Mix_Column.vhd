library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.Mix_Column_Package.all;



entity Mix_Column is
port(
		data_in : in STD_LOGIC_VECTOR (127 downto 0);
		data_out :  out STD_LOGIC_VECTOR (127 downto 0)   
		);
end Mix_Column;

architecture behavior of Mix_Column is
begin 		
	mix_columns(data_in,data_out);	
end behavior;