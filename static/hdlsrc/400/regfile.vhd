entity regfile is
    generic (
        G_WIDTH : natural := 32; -- Breedte van de registers
        G_REGCOUNT_LOG2 : natural := 3 -- log2(# registers)
    );
    port(
        clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        we : in std_logic;
        src1 : in std_logic_vector(G_REGCOUNT_LOG2-1 downto 0);
        src2 : in std_logic_vector(G_REGCOUNT_LOG2-1 downto 0);
        dest : in std_logic_vector(G_REGCOUNT_LOG2-1 downto 0);
        data : in std_logic_vector(G_WIDTH-1 downto 0);
        data1 : out std_logic_vector(G_WIDTH-1 downto 0);
        data2 : out std_logic_vector(G_WIDTH-1 downto 0)
    );
end entity regfile;