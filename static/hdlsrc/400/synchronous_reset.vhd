library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity synchronous_reset is
    Port (
        clock: in std_logic;
        reset: in std_logic;
        data_in: in std_logic;
        data_out: out std_logic
    );
end synchronous_reset;

architecture Behavioral of synchronous_reset is

    signal clock_i: std_logic;
    signal reset_i: std_logic;
    signal data_in_i: std_logic;
    signal data_out_o: std_logic;

begin

    clock_i <= clock;
    reset_i <= reset;
    data_in_i <= data_in;
    data_out <= data_out_o;

    PREG: process(clock_i)
    begin
        if clock_i'event and clock_i = '1' then
            if reset_i =  '1' then
                data_out_o <= '0';
            else
                data_out_o <= data_in_i;    
            end if;
        end if;
    end process;

end Behavioral;
