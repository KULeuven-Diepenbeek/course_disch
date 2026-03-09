    PEVENODD: process(result)
    begin
        if result(0) = '0' then 
            even <= '1';
        else 
            odd <= '1'
        end if;
    end process PEVENODD;