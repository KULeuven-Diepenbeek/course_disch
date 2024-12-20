entity alu is
    generic(
        WIDTH : natural := 16
    );
    port(
        X : IN STD_LOGIC_VECTOR(WIDTH-1 downto 0);
        Y : IN STD_LOGIC_VECTOR(WIDTH-1 downto 0);
        Z : OUT STD_LOGIC_VECTOR(WIDTH-1 downto 0);

        zx : IN STD_LOGIC;
        zy : IN STD_LOGIC;
        nx : IN STD_LOGIC;
        ny : IN STD_LOGIC;
        f : IN STD_LOGIC;
        no : IN STD_LOGIC;

        zr : OUT STD_LOGIC;
        ng : OUT STD_LOGIC
    );
end entity alu;