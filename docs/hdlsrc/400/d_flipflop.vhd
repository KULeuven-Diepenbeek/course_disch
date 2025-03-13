--------------------------------
-- Revision     Date       Author     Comments
-- v0.1         20240122   VlJo       Initial version
--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_flipflop is
    Port (
        clock: in std_logic;
        D: in std_logic;
        Q: out std_logic);
end D_flipflop;

architecture Behavioral of D_flipflop is

    signal clock_i : std_logic;
    signal D_i : std_logic;
    signal Q_o : std_logic;

begin

    --------------------------------
    -- (DE-)LOCALISING IN/OUTPUTS
    --------------------------------
    clock_i <= clock;
    D_i <= D;
    Q <= Q_o;

    --------------------------------
    -- SEQUENTIAL
    --------------------------------
    SEQ: process(clock_i)
    begin
 
        if rising_edge(clock_i) = '1' then
            Q_o <= D_i;    
        end if;

    end process;

end Behavioral;