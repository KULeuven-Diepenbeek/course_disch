    ...
    GEN_AND: for i in 0 to 3 generate

        and_gate_inst: component and_gate port map(
                A => x(i*2),
                B => x(i*2+1),
                Z => y(i)
            );

    end generate GEN_AND;
    ...