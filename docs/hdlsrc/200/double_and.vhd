...
architecture Behavioral of demo is

    component nbit_and is
        Generic(
            G_WIDTH : integer := 8
        );
        Port (
            A_vector: in std_logic_vector(G_WIDTH-1 downto 0);
            B_vector: in std_logic_vector(G_WIDTH-1 downto 0);
            Z_vector: out std_logic_vector(G_WIDTH-1 downto 0)
        );
    end component nbit_and;

    ...
begin

    mijn_4_bit_and_poort: component nbit_and
        generic map(    G_WIDTH => 4)
        port map (      A_vector => een_vier_bit_a,
                        B_vector => een_vier_bit_b,
                        Z_vector => een_vier_bit_z);
    
    ...

    mijn_91_bit_and_poort: component nbit_and
        generic map(    G_WIDTH => 91)
        port map (      A_vector => een_eenennegentig_bit_a,
                        B_vector => een_eenennegentig_bit_b,
                        Z_vector => een_eenennegentig_bit_z);

    ...
end Behavioral;
