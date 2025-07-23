padding <= (others => my_vector(7));
my_shifted_vector <= padding(3-1 downto 0) & my_vector(7 downto 3);