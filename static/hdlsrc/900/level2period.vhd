-- entity
-- architecture
        signal input_d : STD_LOGIC;
-- begin

    PREG: process(clock_i)
    begin
        if rising_edge(clock_i) then 
            input_d <= input_i;
        end if;
    end process;

    output_i <= input_i AND not(input_d);

-- end architecture