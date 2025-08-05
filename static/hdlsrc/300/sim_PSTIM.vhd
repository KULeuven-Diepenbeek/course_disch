    PSTIM: process
    begin
        operand1 <= x"0000000C";
        operand2 <= x"00000003";
        ALUOp <= "100";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        -- check outputs
        if result /= x"0000000F" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;

        if equal /= '0' then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;

        if x_lt_y_u /= '0' then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;

        if x_lt_y_s /= '0' then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        
        wait for 2 ns;

        wait;
    end process;