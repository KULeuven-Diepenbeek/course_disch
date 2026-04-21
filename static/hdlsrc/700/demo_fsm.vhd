--------------------------------------------------------------------------------
-- KU Leuven - ESAT/COSIC - Emerging technologies, Systems & Security
--------------------------------------------------------------------------------
-- Module Name:     demo_fsm - Behavioural
-- Project Name:    demo_fsm
-- Description:     
--
-- Revision     Date       Author     Comments
-- v0.1         20260421   VlJo       Initial version
--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.NUMERIC_STD.ALL;

entity demo_fsm is
    port(
        clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        halt : in STD_LOGIC;
        red : out STD_LOGIC;
        yellow : out STD_LOGIC;
        green : out STD_LOGIC
    );
end entity demo_fsm;

architecture Behavioural of demo_fsm is

    -- (DE-)LOCALISING IN/OUTPUTS
    signal clock_i : STD_LOGIC;
    signal reset_i : STD_LOGIC;
    signal halt_i : STD_LOGIC;
    signal red_o : STD_LOGIC;
    signal yellow_o : STD_LOGIC;
    signal green_o : STD_LOGIC;

    signal current_state : STD_LOGIC_VECTOR(2 downto 0);
    signal next_state : STD_LOGIC_VECTOR(2 downto 0);

begin

    -------------------------------------------------------------------------------
    -- (DE-)LOCALISING IN/OUTPUTS
    -------------------------------------------------------------------------------
    clock_i <= clock;
    reset_i <= reset;
    halt_i <= halt;
    red <= red_o;
    yellow <= yellow_o;
    green <= green_o;

    -- STATE REGISTER
    PREG: process(clock_i)
    begin
        if rising_edge(clock_i) then
            if reset_i = '1' then
                current_state <= "111";
            else
                current_state <= next_state;
            end if;
        end if;
    end process;

    -- OUTPUT FUNCTION
    red_o <= current_state(2);
    yellow_o <= current_state(1);
    green_o <= current_state(0);

    -- NEXT STATE LOGIC
    next_state(2) <= (halt and current_state(2)) or (not(current_state(2)) and current_state(1));
    next_state(1) <= (halt and current_state(2)) or (not(current_state(1)) and current_state(0));
    next_state(0) <= current_state(2);

end Behavioural;

architecture Behavioural2 of demo_fsm is

    -- (DE-)LOCALISING IN/OUTPUTS
    signal clock_i : STD_LOGIC;
    signal reset_i : STD_LOGIC;
    signal halt_i : STD_LOGIC;
    signal red_o : STD_LOGIC;
    signal yellow_o : STD_LOGIC;
    signal green_o : STD_LOGIC;

    signal current_state : STD_LOGIC_VECTOR(1 downto 0);
    signal next_state : STD_LOGIC_VECTOR(1 downto 0);

begin

    -------------------------------------------------------------------------------
    -- (DE-)LOCALISING IN/OUTPUTS
    -------------------------------------------------------------------------------
    clock_i <= clock;
    reset_i <= reset;
    halt_i <= halt;
    red <= red_o;
    yellow <= yellow_o;
    green <= green_o;

    -- STATE REGISTER
    PREG: process(clock_i)
    begin
        if rising_edge(clock_i) then
            if reset_i = '1' then
                current_state <= "00";
            else
                current_state <= next_state;
            end if;
        end if;
    end process;

    -- OUTPUT FUNCTION
    red_o <= not( current_state(1) xor current_state(0) );
    yellow_o <= not( current_state(0) );
    green_o <= not( current_state(1) );

    -- NEXT STATE LOGIC
    next_state(1) <= current_state(1) xor current_state(0);

    next_state(0) <= (not(halt_i) and current_state(1))
        OR (not(halt_i) and not(current_state(0)))
        OR (current_state(1) and not(current_state(0)));

end Behavioural2;
-- --    type Tstates is (sIdle, );
-- --    signal curState, nxtState : Tstates;

-- PFSM_NSF: process(curState)
-- begin
--     nxtState <= curState;
--     case curState is
--         when sIdle => nxtState <= ;
--         when others => nxtState <= sIdle;
--     end case;
-- end process;

-- PFSM_OF: process(curState)
-- begin
--     case curState is
--         when sIdle      =>
--         when others     =>
--     end case;
-- end process;

-- PFSM_REG: process(clock_i)
-- begin
--     if rising_edge(clock_i) then 
--         if reset_n_i = '0' then 
--             curState <= sIdle;
--         else
--             curState <= nxtState;
--         end if;
--     end if;
-- end process;


PFSM_NSF: process(curState, halt)
begin
    case curState is
        when sGroen =>
            nxtState <= sOranje;
        when sOranje =>
            nxtState <= sRood;
        when others => 
            if halt = '1' then 
                nxtState <= sReset; 
            else 
                nxtState <= sGroen; 
            end if;
    end case;
end process;

groen_o <= '1' when curState = sGroen else '0';
oranje_o <= '1' when curState = sOranje else '0';
rood_o <= '1' when curState = sRood else '0';


PFSM_OF: process(curState)
begin
    groen_o <= '0';
    oranje_o <= '0';
    rood_o <= '0';
    case curState is
        when sRood =>    rood_o <= '1';
        when sOranje =>  oranje_o <= '1';
        when sGroen =>   groen_o <= '1';
        when others =>   groen_o <= '1'; 
                         oranje_o <= '1'; 
                         rood_o <= '1';
    end case;
end process;