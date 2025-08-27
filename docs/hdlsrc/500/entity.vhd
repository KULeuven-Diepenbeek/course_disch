entity processor is
    port(
        clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        pc : out STD_LOGIC_VECTOR(31 downto 0);
        inst : in STD_LOGIC_VECTOR(31 downto 0)
    );
end entity processor;