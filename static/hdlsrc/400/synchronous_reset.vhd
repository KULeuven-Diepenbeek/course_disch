library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity asynchronous_reset is
    Port (
        clock: in std_logic;
        reset: in std_logic;
        data_in: in std_logic;
        data_out: out std_logic
    );
end asynchronous_reset;

architecture Behavioral of asynchronous_reset is

    signal clock_i: std_logic;
    signal reset_i: std_logic;
    signal data_in_i: std_logic;
    signal data_out_i: std_logic;

begin

    clock_i <= clock;
    reset_i <= reset;
    data_in_i <= data_in;
    data_out <= data_out_i;

    PREG: process(clock_i)
    begin
        if clock_i'event and clock_i = '1' then
            if reset_i =  '1' then
                data_out_i <= '0';
            else
                data_out_i <= data_in_i;    
            end if;
        end if;
    end process;

end Behavioral;
