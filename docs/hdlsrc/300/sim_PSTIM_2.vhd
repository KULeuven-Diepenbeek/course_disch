...
        X <= x"329a";
        Y <= x"ae51";
        zx <= '0';
        zy <= '1';
        nx <= '0';
        ny <= '1';
        f <= '0';
        no <= '1';
        wait for 1 ns;
        if (Z /= x"cd65") then
            report "Error in outcome (not x)" severity note;
            v_incorrect_z := v_incorrect_z + 1;
        else
            v_correct_z := v_correct_z + 1;
        end if;
        if (zr /= '0') then
            report "Error in zero flag (not x)" severity note;
            v_incorrect_zr := v_incorrect_zr + 1;
        else
            v_correct_zr := v_correct_zr + 1;
        end if;
        if (ng /= '1') then
            report "Error in negative flag (not x)" severity note;
            v_incorrect_ng := v_incorrect_ng + 1;
        else
            v_correct_ng := v_correct_ng + 1;
        end if;
        wait for 1 ns;
...