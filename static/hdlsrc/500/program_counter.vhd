entity program_counter is
    port(
        clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        abs_rel_b: in std_logic;
        immediate: in std_logic;
        rs1 : in std_logic_vector(31 downto 0);
        immediate : in std_logic_vector(31 downto 0);
        data_out : out std_logic_vector(31 downto 0)
    );
end entity program_counter;