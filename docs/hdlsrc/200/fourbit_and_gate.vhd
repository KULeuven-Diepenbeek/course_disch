--------------------------------
-- KU Leuven - ESAT/COSIC - ES&S
--------------------------------
-- Module Name:     4-bit and_gate - Behavioural
-- Project Name:    Digitale elektronische schakelingen 
-- Description:     Een voorbeeld van een 4-bit and-gate.
--                  X geeft een bits-gewijze AND van A en B
--                  Z geeft een 4-bit and van A
-- Revision     Date       Author     Comments
-- v0.1         20240118   VlJo       Initial version
--
--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fourbit_and_gate is
    port(
        A: IN STD_LOGIC_VECTOR(3 downto 0);
        B: IN STD_LOGIC_VECTOR(3 downto 0);
        X: OUT STD_LOGIC_VECTOR(3 downto 0);
        Z: OUT STD_LOGIC
    );
end entity fourbit_and_gate;

architecture Behavioural of fourbit_and_gate is

    -- (DE-)LOCALISING IN/OUTPUTS
    signal A_i : STD_LOGIC_VECTOR(3 downto 0);
    signal B_i : STD_LOGIC_VECTOR(3 downto 0);
    signal X_i : STD_LOGIC_VECTOR(3 downto 0);
    signal Z_i : STD_LOGIC;

begin

    --------------------------------
    -- (DE-)LOCALISING IN/OUTPUTS
    --------------------------------
    A_i <= A;
    B_i <= B;
    X <= X_i;
    Z <= Z_i;

    --------------------------------
    -- COMBINATORIAL
    --------------------------------
    Z <= A_i(0) AND A_i(1) AND A_i(2) AND A_i(3);

    X_i(0) <= A_i(0) AND B_i(0);
    X_i(1) <= A_i(1) AND B_i(1);
    X_i(2) <= A_i(2) AND B_i(2);
    X_i(3) <= A_i(3) AND B_i(3);

    -- wat ook mag is:
    --X_i <= A_i AND B_i;


end Behavioural;