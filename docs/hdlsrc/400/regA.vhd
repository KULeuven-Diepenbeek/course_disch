    PREGA: process(clock_i)
    begin
        if rising_edge(clock_i) then
            if reset_i = '1' then 
                regA <= (others => '0');
            else
                if load_A = '1' then 
                    regA <= regA_in;
                end if;
            end if;
        end if;
    end process;