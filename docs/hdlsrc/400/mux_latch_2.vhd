    PMUX: process(rotate_left, rotate_right, MUX_select)
    begin
        if MUX_select = '0' then 
            transformed <= rotate_left;
        else if MUX_select = '1' then
            transformed <= rotate_right;
        end if;
    end process PMUX;