    PREGAB: process(clock_i)
    begin
        if rising_edge(clock_i) then
            if reset_i = '1' then 
                regA <= (others => '0');
                regB <= (others => '0');
            else
                if load_A = '1' then 
                    regA <= regA_in;
                end if;
                
                if load_B = '1' then 
                    regB <= regB_in;
                end if;
            end if;
        end if;
    end process;