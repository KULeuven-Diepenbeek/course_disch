    component processor is
        generic(
            G_DATAWIDTH : natural := 32;
            G_REGCOUNT_LOG2 : natural := 5
        );
        port(
            clock : in STD_LOGIC;
            reset : in STD_LOGIC;
            ce : in STD_LOGIC;
            pc : out std_logic_vector(G_DATAWIDTH-1 downto 0);
            inst : in STD_LOGIC_VECTOR(G_DATAWIDTH-1 downto 0);
            data_out : out STD_LOGIC_VECTOR(G_DATAWIDTH-1 downto 0);
            data_out_we : out STD_LOGIC
        );
    end component processor;