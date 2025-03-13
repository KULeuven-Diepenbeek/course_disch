library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SISO_shift_register is
  Port (clock: in std_logic;
        D: in std_logic;
        Y: out std_logic);
end SISO_shift_register;

architecture Behavioral of SISO_shift_register is
    signal clock_i : STD_LOGIC;
    signal D_i : STD_LOGIC;
    signal buffer_input, buffer_output: std_logic_vector(0 to 3);
begin

    clock_i <= clock;
    D_i <= D;
    Y <= buffer_output(3);

    buffer_input <= D_i & buf(0 to 2);

    SEQ: process(clock_i) begin
        if rising_edge(clock_i) then
            buffer_output <= buffer_input;
        end if;    
    end process;
    
end Behavioral;