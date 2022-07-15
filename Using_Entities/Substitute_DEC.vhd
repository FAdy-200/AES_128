library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.Substitution_Package.all;



entity Substitute_DEC is
port(
		data_in :in STD_LOGIC_VECTOR (127 downto 0);
		data_out : out STD_LOGIC_VECTOR (127 downto 0)
		);
end Substitute_DEC;

architecture behavior of Substitute_DEC is
	signal mode:std_logic;
begin 		
		mode<='1';
		substitute_all(data_in,mode,data_out);
end behavior;