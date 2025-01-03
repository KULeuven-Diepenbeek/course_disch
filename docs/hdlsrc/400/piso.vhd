library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PISO_shift_register is
  Port (clock: in std_logic;
        load: in std_logic;
        D_Vector: in std_logic_vector(3 downto 0);
        Y: out std_logic);
end PISO_shift_register;

architecture Behavioral of PISO_shift_register is
    signal clock_i : STD_LOGIC;
    signal load_i : STD_LOGIC;
    signal buf: std_logic_vector(3 downto 0);

begin
    clock_i <= clock;
    load_i <= load;

    SEQ: process(clock_i) begin
        if rising_edge(clock_i) then
            if load_i = '1' then
                buf <= D_vector;
            else
                buf(3 downto 1) <= buf(2 downto 0);
                buf(0) <= '-'; --in de meeste toepassingen maakt het niet uit welke bit er uit komt als de buffer leeg is
            end if;
        end if;    
    end process;

    Y <= buf(3);    

end Behavioral;