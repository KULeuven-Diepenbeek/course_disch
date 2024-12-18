--------------------------------
-- KU Leuven - ESAT/COSIC - ES&S
--------------------------------
-- Module Name:     and_gate - Behavioural
-- Project Name:    Digitale elektronische schakelingen 
-- Description:     Een voorbeeld van een and-gate, gebouwd 
--                  met een nand en een invertor.
--
-- Revision     Date       Author     Comments
-- v0.1         20240118   VlJo       Initial version
--
--------------------------------
library IEEE;
-- gebruik de package STD_LOGIC_1164 uit de library 
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate is
    port(
        A: IN STD_LOGIC;
        B: IN STD_LOGIC;
        Z: OUT STD_LOGIC
    );
end entity and_gate;

architecture Behavioural of and_gate is

    -- COMPONENT DECLARATIONS
    component inverter is
        port(
            A: IN STD_LOGIC;
            Z: OUT STD_LOGIC
        );
    end component inverter;

    component nand_gate is
        port(
            A: IN STD_LOGIC;
            B: IN STD_LOGIC;
            Z: OUT STD_LOGIC
        );
    end component nand_gate;

    -- (DE-)LOCALISING IN/OUTPUTS
    signal A_i : STD_LOGIC;
    signal B_i : STD_LOGIC;
    signal Z_o : STD_LOGIC;

    -- INTERNAL SIGNALS
    signal x : STD_LOGIC;

begin

    --------------------------------
    -- (DE-)LOCALISING IN/OUTPUTS
    --------------------------------
    A_i <= A;
    B_i <= B;
    Z <= Z_o;

    --------------------------------
    -- COMBINATORIAL
    --------------------------------
    nand_gate_inst00: component nand_gate port map(
        A => A_i,
        B => B_i,
        Z => X
    );
    
    inverter_inst00: component inverter port map(
        A => X,
        Z => Z_o     
    );

end Behavioural;