    PMUX: process(rotate_left, MUX_select)
    begin
        if MUX_select = '0' then 
            transformed <= rotate_left;
        else 
            transformed <= rotate_right;
        end if;
    end process PMUX;