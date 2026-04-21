--------------------------------------------------------------------------------
-- KU Leuven - ESAT/COSIC - Emerging technologies, Systems & Security
--------------------------------------------------------------------------------
-- Module Name:     demo_fsm_tb - Behavioural
-- Project Name:    Testbench for demo_fsm
-- Description:     
--
-- Revision     Date       Author     Comments
-- v0.1         20260421   VlJo       Initial version
--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.NUMERIC_STD.ALL;

entity demo_fsm_tb is
end entity demo_fsm_tb;

architecture Behavioural of demo_fsm_tb is

    component demo_fsm is
        port(
            clock : in STD_LOGIC;
            reset : in STD_LOGIC;
            halt : in STD_LOGIC;
            red : out STD_LOGIC;
            yellow : out STD_LOGIC;
            green : out STD_LOGIC
        );
    end component demo_fsm;

    signal clock : STD_LOGIC;
    signal reset : STD_LOGIC;
    signal halt : STD_LOGIC;
    signal red : STD_LOGIC;
    signal yellow : STD_LOGIC;
    signal green : STD_LOGIC;
    constant clock_period : time := 10 ns;

begin

    -------------------------------------------------------------------------------
    -- STIMULI
    -------------------------------------------------------------------------------
    PSTIM: process
    begin
        halt <= '0';
        wait for clock_period * 100;
        
        halt <= '1';
        wait for clock_period * 20;
        
        halt <= '0';
        wait for clock_period * 100;
        
        wait;
    end process;


    -------------------------------------------------------------------------------
    -- DUT
    -------------------------------------------------------------------------------
    DUT: component demo_fsm port map(
        clock => clock,
        reset => reset,
        halt => halt,
        red => red,
        yellow => yellow,
        green => green
    );


    -------------------------------------------------------------------------------
    -- CLOCK
    -------------------------------------------------------------------------------
    PCLK: process
    begin
        clock <= '1';
        wait for clock_period/2;
        clock <= '0';
        wait for clock_period/2;
    end process PCLK;


    -------------------------------------------------------------------------------
    -- RESET
    -------------------------------------------------------------------------------
    PRST: process
    begin
        reset <= '1';
        wait for clock_period*9;
        wait for clock_period/2;
        reset <= '0';
        wait;
    end process PRST;

end Behavioural;

