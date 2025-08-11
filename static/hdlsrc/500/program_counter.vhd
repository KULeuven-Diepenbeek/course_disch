entity program_counter is
    port(
        clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        load : in STD_LOGIC;
        inc : in STD_LOGIC;
        data_in : in std_logic_vector(31 downto 0);
        data_out : out std_logic_vector(31 downto 0)
    );
end entity program_counter;