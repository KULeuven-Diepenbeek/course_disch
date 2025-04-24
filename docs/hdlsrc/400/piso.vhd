library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PISO_shift_register is
  Port (clock: in std_logic;
        load: in std_logic;
        data_in: in std_logic_vector(3 downto 0);
        Y: out std_logic);
end PISO_shift_register;

architecture Behavioral of PISO_shift_register is
    signal clock_i : STD_LOGIC;
    signal load_i : STD_LOGIC;
    signal data_in_i : std_logic_vector(3 downto 0);
    signal buf: std_logic_vector(3 downto 0);
    signal buf_shifted: std_logic_vector(3 downto 0);

begin
    clock_i <= clock;
    load_i <= load;
    data_in_i <= data_in;
    Y <= buf(3);

    buf_shifted <= buf(2 downto 0) & '-';
    -- of
    -- buf_shifted(3) <= buf(2);
    -- buf_shifted(2) <= buf(1);
    -- buf_shifted(1) <= buf(0);
    -- buf_shifted(0) <= '-';

    SEQ: process(clock_i) begin
        if rising_edge(clock_i) then
            if load_i = '1' then
                buf <= data_in_i;
            else
                buf <= buf_shifted;
            end if;
        end if;    
    end process;

end Behavioral;