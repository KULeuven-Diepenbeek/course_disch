--------------------------------
-- KU Leuven - ESAT/COSIC - ES&S
--------------------------------
-- Module Name:     nand_tb - Behavioural
-- Project Name:    Digitale eletronische schakelingen
-- Description:     Testbench for nand
--
-- Revision     Date       Author     Comments
-- v1.0         20240118   VlJo       Initial version
--
--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.NUMERIC_STD.ALL;

entity nand_tb is
end entity nand_tb;

architecture Behavioural of nand_tb is

    component nand_gate is
        port(
            A: IN STD_LOGIC;
            B: IN STD_LOGIC;
            Z: OUT STD_LOGIC
        );
    end component nand_gate;

    signal input_a, input_b : STD_LOGIC;
    signal output_z : STD_LOGIC;

begin
    --------------------------------
    -- STIMULI
    --------------------------------
    PSTIM: process
    begin
        input_a <= '0';
        input_b <= '0';
        wait for 10 ns;

        input_a <= '1';
        input_b <= '0';
        wait for 10 ns;

        input_a <= '0';
        input_b <= '1';
        wait for 10 ns;

        input_a <= '1';
        input_b <= '1';
        wait for 10 ns;
        
        wait;
    end process;

    --------------------------------
    -- DUT
    --------------------------------
    DUT: component nand_gate port map(
        A => input_a,
        B => input_b,
        Z => output_z
    );

end Behavioural;
