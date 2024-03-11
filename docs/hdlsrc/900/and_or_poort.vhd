library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_or_poort is
    port(
        A: IN STD_LOGIC;
        B: IN STD_LOGIC;
        D: IN STD_LOGIC;
        E: OUT STD_LOGIC
    );
end entity and_or_poort;

architecture Behavioural of and_gate is
    signal c: STD_LOGIC;
begin
    c <= a and b;
    e <= c or d;
end Behavioural;