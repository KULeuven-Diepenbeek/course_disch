zeroes <= (others => '0');
my_shifted_vector <= my_vector(7-3 downto 0) & zeroes(3-1 downto 0);