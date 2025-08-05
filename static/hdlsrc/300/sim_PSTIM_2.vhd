
...
        operand1 <= x"8ffb9e07"; -- 2415631879
        operand2 <= x"fdcea5ee"; -- 4258178542
        ALUOp <= "000";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        -- check outputs
        if result /= x"8dca8406" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        if equal /= '0' then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        if x_lt_y_u /= '1' then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        if x_lt_y_s /= '1' then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;
...
        report "DISCH_GRADING (good, bad, total): " & integer'image(good_checks) & " " & integer'image(bad_checks) & " " & integer'image(good_checks + bad_checks) & "" severity note;
...