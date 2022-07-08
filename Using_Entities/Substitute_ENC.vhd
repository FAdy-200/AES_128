library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.Substitution_Package.all;



entity Substitute_ENC is
port(
		data_in :in STD_LOGIC_VECTOR (127 downto 0);
		data_out : out STD_LOGIC_VECTOR (127 downto 0)
		);
end Substitute_ENC;

architecture behavior of Substitute_ENC is
	signal mode:std_logic;
begin 		
		mode<='0';
		substitute_all(data_in,mode,data_out);
end behavior;