
...
        -- apply stimuli
        operator1 <= x"e9db2c09"; -- 3923454985
        operator2 <= x"789795be"; -- 2023200190
        ALUOp <= "100";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        -- check outputs
        if result /= x"6272c1c7" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        if zero /= '0' then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        if equal /= '0' then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        if carryOut /= '1' then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;
...
        report "DISCH_GRADING (good, bad, total): " & integer'image(good_checks) & " " & integer'image(bad_checks) & " " & integer'image(good_checks + bad_checks) & "" severity note;
...