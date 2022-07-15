library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
 
entity AES_TB is
end entity;
 
architecture sim of AES_TB is
 
    constant clock_frequency : integer := 100e6; -- 100 MHz
    constant clock_period    : time    := 1000 ms / clock_frequency;
 
    signal clk    : STD_LOGIC := '1';
    signal key  : STD_LOGIC_VECTOR(127 downto 0);
    signal data_in : STD_LOGIC_VECTOR(127 downto 0);
	 signal data_out : STD_LOGIC_VECTOR(127 downto 0);
	 signal mode : STD_LOGIC :='0';
begin
 
		AES : entity work.AES(main)
		port map(
		  key => key,
        clk    => clk,
        data_in   => data_in,
        data_out => data_out,
		  mode => mode
		  );
 
    -- Process for generating the clock
    clk <= not clk after clock_period/2;
    -- Testbench sequence
    process is
    begin
        key <= x"2B7E151628AED2A6ABF7158809CF4F3C";
        data_in <= x"6BC1BEE22E409F96E93D7E117393172A";
		  wait for 10 ns;
		  wait;
    end process;
 
end architecture;