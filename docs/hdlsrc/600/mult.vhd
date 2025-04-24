entity multiplier is
    generic (
        G_WIDTH : natural := 4
    );
    port(
        A : in STD_LOGIC_VECTOR(G_WIDTH-1 downto 0);
        B : in STD_LOGIC_VECTOR(G_WIDTH-1 downto 0);
        Z : out STD_LOGIC_VECTOR(2*G_WIDTH-1 downto 0)
    );
end entity multiplier;