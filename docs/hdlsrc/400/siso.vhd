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
    signal buf: std_logic_vector(3 downto 0);
begin

    clock_i <= clock;
    D_i <= D;
    Y <= buf(3);

    SEQ: process(clock_i) begin
        if rising_edge(clock_i) then
            buf(0) <= D;
            buf(3 downto 1) <= buf(2 downto 0);         
        end if;    
    end process;
    
end Behavioral;