--------------------------------------------------------------------------------
-- KU Leuven - ESAT/COSIC - Emerging technologies, Systems & Security
--------------------------------------------------------------------------------
-- Module Name:     program_counter_tb - Behavioural
-- Project Name:    Testbench for program_counter
-- Description:     
--
-- Revision     Date       Author     Comments
-- v0.1         20250826   VlJo       Initial version
--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.NUMERIC_STD.ALL;

entity program_counter_tb is
end entity program_counter_tb;

architecture Behavioural of program_counter_tb is

    component program_counter is
        port (
            clock : in STD_LOGIC;
            reset : in STD_LOGIC;
            abs_rel_b: in std_logic;
            immediate_four_b: in std_logic;
            rs1 : in std_logic_vector(31 downto 0);
            immediate : in std_logic_vector(31 downto 0);
            data_out : out std_logic_vector(31 downto 0)
        );
    end component program_counter;

    signal clock_i : STD_LOGIC;
    signal reset_i : STD_LOGIC;
    signal abs_rel_b_i : STD_LOGIC;
    signal immediate_four_b_i : STD_LOGIC;
    signal rs1_i : STD_LOGIC_VECTOR(31 downto 0);
    signal immediate_i : STD_LOGIC_VECTOR(31 downto 0);
    signal data_out_o : STD_LOGIC_VECTOR(31 downto 0);

    constant clock_period : time := 10 ns;

begin

    -------------------------------------------------------------------------------
    -- STIMULI
    -------------------------------------------------------------------------------
    PSTIM: process
        variable good_checks : natural;
        variable bad_checks : natural;
    begin
        abs_rel_b_i <= '0';
        immediate_four_b_i <= '0';
        rs1_i <= (others => '0');
        immediate_i <= (others => '0');
        wait until clock_i = '1';
        wait until clock_i = '0';
        wait until reset_i = '0';
        if data_out_o /= x"00000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;

        wait for clock_period;
        if data_out_o /= x"00000004" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
    
        wait for clock_period;
        if data_out_o /= x"00000008" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;

        wait for clock_period*5;
        if data_out_o /= x"0000001C" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;

        immediate_four_b_i <= '1';
        immediate_i <= (4 => '1', others => '0');
        wait for clock_period;
        if data_out_o /= x"0000002C" then
            bad_checks := bad_checks + 1;
            report("DISCH_GRADING - Abnormal behavior detected");
        else
            good_checks := good_checks + 1;
        end if;

        immediate_four_b_i <= '0';
        wait for clock_period;
        if data_out_o /= x"00000030" then
            bad_checks := bad_checks + 1;
            report("DISCH_GRADING - Abnormal behavior detected");
        else
            good_checks := good_checks + 1;
        end if;

        wait for clock_period;
        if data_out_o /= x"00000034" then
            bad_checks := bad_checks + 1;
            report("DISCH_GRADING - Abnormal behavior detected");
        else
            good_checks := good_checks + 1;
        end if;

        immediate_four_b_i <= '1';
        immediate_i <= x"80000000";
        wait for clock_period;
        if data_out_o /= x"80000034" then
            bad_checks := bad_checks + 1;
            report("DISCH_GRADING - Abnormal behavior detected");
        else
            good_checks := good_checks + 1;
        end if;

        immediate_four_b_i <= '0';
        wait for clock_period;
        if data_out_o /= x"80000038" then
            bad_checks := bad_checks + 1;
            report("DISCH_GRADING - Abnormal behavior detected");
        else
            good_checks := good_checks + 1;
        end if;

        wait for clock_period;
        if data_out_o /= x"8000003C" then
            bad_checks := bad_checks + 1;
            report("DISCH_GRADING - Abnormal behavior detected");
        else
            good_checks := good_checks + 1;
        end if;

        abs_rel_b_i <= '1';
        immediate_i <= x"00000004";
        wait for clock_period;
        if data_out_o /= x"00000004" then
            bad_checks := bad_checks + 1;
            report("DISCH_GRADING - Abnormal behavior detected");
        else
            good_checks := good_checks + 1;
        end if;


        immediate_four_b_i <= '1';
        immediate_i <= x"80000000";
        wait for clock_period;
        if data_out_o /= x"80000000" then
            bad_checks := bad_checks + 1;
            report("DISCH_GRADING - Abnormal behavior detected");
        else
            good_checks := good_checks + 1;
        end if;

        immediate_four_b_i <= '0';
        wait for clock_period;
        if data_out_o /= x"80000000" then
            bad_checks := bad_checks + 1;
            report("DISCH_GRADING - Abnormal behavior detected");
        else
            good_checks := good_checks + 1;
        end if;

        wait for clock_period;
        if data_out_o /= x"80000000" then
            bad_checks := bad_checks + 1;
            report("DISCH_GRADING - Abnormal behavior detected");
        else
            good_checks := good_checks + 1;
        end if;

        rs1_i <= x"80000000";
        wait for clock_period;
        if data_out_o /= x"00000000" then
            bad_checks := bad_checks + 1;
            report("DISCH_GRADING - Abnormal behavior detected");
        else
            good_checks := good_checks + 1;
        end if;
        
        
        rs1_i <= x"5EADBEEF";
        wait for clock_period;
        if data_out_o /= x"DEADBEEF" then
            bad_checks := bad_checks + 1;
            report("DISCH_GRADING - Abnormal behavior detected");
        else
            good_checks := good_checks + 1;
        end if;

        rs1_i <= x"00000002";
        immediate_i <= x"00000002";
        wait for clock_period;
        if data_out_o /= x"00000004" then
            bad_checks := bad_checks + 1;
            report("DISCH_GRADING - Abnormal behavior detected");
        else
            good_checks := good_checks + 1;
        end if;

        wait until reset_i = '1';

        if data_out_o /= x"00000004" then
            bad_checks := bad_checks + 1;
            report("DISCH_GRADING - Abnormal behavior detected");
        else
            good_checks := good_checks + 1;
        end if;

        wait until clock_i = '1';
        if data_out_o /= x"00000004" then
            bad_checks := bad_checks + 1;
            report("DISCH_GRADING - Abnormal behavior detected");
        else
            good_checks := good_checks + 1;
        end if;
        
        wait for 1 ns;
        if data_out_o /= x"00000000" then
            bad_checks := bad_checks + 1;
            report("DISCH_GRADING - Abnormal behavior detected");
        else
            good_checks := good_checks + 1;
        end if;

        report "DISCH_GRADING (good, bad, total): " & integer'image(good_checks) & " " & integer'image(bad_checks) & " " & integer'image(good_checks + bad_checks) & "" severity note;
        
        wait;
    end process;


    -------------------------------------------------------------------------------
    -- DUT
    -------------------------------------------------------------------------------
    DUT: component program_counter port map(
        clock => clock_i,
        reset => reset_i,
        abs_rel_b => abs_rel_b_i,
        immediate_four_b => immediate_four_b_i,
        rs1 => rs1_i,
        immediate => immediate_i,
        data_out => data_out_o
    );


    -------------------------------------------------------------------------------
    -- CLOCK
    -------------------------------------------------------------------------------
    PCLK: process
    begin
        clock_i <= '1';
        wait for clock_period/2;
        clock_i <= '0';
        wait for clock_period/2;
    end process PCLK;


    -------------------------------------------------------------------------------
    -- RESET
    -------------------------------------------------------------------------------
    PRST: process
    begin
        reset_i <= '1';
        wait for clock_period*9;
        wait for clock_period/2;
        reset_i <= '0';
        wait for clock_period*25;
        reset_i <= '1';
        wait;
    end process PRST;

end Behavioural;