--------------------------------------------------------------------------------
-- KU Leuven - ESAT/COSIC - Emerging technologies, Systems & Security
--------------------------------------------------------------------------------
-- Module Name:     processor_tb - Behavioural
-- Project Name:    Testbench for processor DISCH
-- Description:     
--
-- Revision     Date       Author     Comments
-- v0.1         20250804   VlJo       Initial version
--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.NUMERIC_STD.ALL;

entity processor_tb is
end entity processor_tb;

architecture Behavioural of processor_tb is

    component processor is
        port(
            clock : in STD_LOGIC;
            reset : in STD_LOGIC;
            pc : out STD_LOGIC_VECTOR(31 downto 0);
            inst : in STD_LOGIC_VECTOR(31 downto 0)
        );
    end component processor;

    signal clock : STD_LOGIC;
    signal reset : STD_LOGIC;
    signal pc : STD_LOGIC_VECTOR(31 downto 0);
    signal inst : STD_LOGIC_VECTOR(31 downto 0);
    constant clock_period : time := 10 ns;

begin

    -------------------------------------------------------------------------------
    -- STIMULI
    -------------------------------------------------------------------------------
    PMUX: process(pc)
    begin
        case pc is
            when x"00000000" => inst <= x"00100093";    -- addi    ra, zero, 1
            when x"00000004" => inst <= x"00100113";    -- addi    sp, zero, 1
            when x"00000008" => inst <= x"001101b3";    -- add     gp, sp, ra
            when x"0000000c" => inst <= x"00218233";    -- add     tp, gp, sp
            when x"00000010" => inst <= x"003202b3";    -- add     t0, tp, gp
            when x"00000014" => inst <= x"00428333";    -- add     t1, t0, tp
            when x"00000018" => inst <= x"005303b3";    -- add     t2, t1, t0
            when x"0000001c" => inst <= x"006380b3";    -- add     ra, t2, t1
            when x"00000020" => inst <= x"00708133";    -- add     sp, ra, t2
            when x"00000024" => inst <= x"001101b3";    -- add     gp, sp, ra
            when x"00000028" => inst <= x"00218233";    -- add     tp, gp, sp
            when x"0000002c" => inst <= x"003202b3";    -- add     t0, tp, gp
            when x"00000030" => inst <= x"00428333";    -- add     t1, t0, tp
            when x"00000034" => inst <= x"005303b3";    -- add     t2, t1, t0
            when others =>      inst <= x"00000033";    -- add     x0, x0, x0
        end case;
    end process PMUX;


    -------------------------------------------------------------------------------
    -- DUT
    -------------------------------------------------------------------------------
    DUT: component processor port map(
        clock => clock,
        reset => reset,
        pc => pc,
        inst => inst
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
