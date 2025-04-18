--------------------------------------------------------------------------------
-- KU Leuven - ESAT/COSIC - Emerging technologies, Systems & Security
--------------------------------------------------------------------------------
-- Module Name:     muziek_speler_controle_tb - Behavioural
-- Project Name:    Testbench for muziek_speler_controle
-- Description:     
--
-- Revision     Date       Author     Comments
-- v0.1         20240418   VlJo       Initial version
--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.NUMERIC_STD.ALL;

entity muziek_speler_controle_tb is
end entity muziek_speler_controle_tb;

architecture Behavioural of muziek_speler_controle_tb is

    component muziek_speler_controle is
        port(
            clock : in STD_LOGIC;
            reset : in STD_LOGIC;
            btn_stop : in STD_LOGIC;
            btn_play : in STD_LOGIC;
            inReset : out STD_LOGIC;
            inStop : out STD_LOGIC;
            inPlay : out STD_LOGIC;
            inPause : out STD_LOGIC
        );
    end component muziek_speler_controle;

    signal clock_i : STD_LOGIC;
    signal reset_i : STD_LOGIC;

    signal btn_stop : STD_LOGIC;
    signal btn_play : STD_LOGIC;
    signal inReset : STD_LOGIC;
    signal inStop : STD_LOGIC;
    signal inPlay : STD_LOGIC;
    signal inPause : STD_LOGIC;

    signal status : STD_LOGIC_VECTOR(3 downto 0);

    constant clock_period : time := 10 ns;

begin

    -------------------------------------------------------------------------------
    -- STIMULI
    -------------------------------------------------------------------------------
    PSTIM: process
    begin
        -------------------------------------------------------------------------------
        -- TEST RESET
        -------------------------------------------------------------------------------
        btn_stop <= '0';            btn_play <= '0';
        wait until reset_i = '0';
        wait for 1 ns;
        assert status = "1000" report ("Error in sReset") severity error;
        wait until clock_i = '1';
        wait until clock_i = '0';
        assert status = "0100" report ("Error in sStop") severity error;
        
        wait for clock_period*5;
        assert status = "0100" report ("Error in sStop") severity error;
        wait for clock_period;
        wait for clock_period*20;

        
        -------------------------------------------------------------------------------
        -- TEST HAPPY PATH
        -------------------------------------------------------------------------------
        btn_play <= '1';
        wait for clock_period;
        assert status = "0010" report ("Error in sPlay") severity error;
        btn_play <= '0';
        wait for clock_period;

        btn_play <= '1';
        wait for clock_period;
        assert status = "0001" report ("Error in sPause") severity error;
        btn_play <= '0';
        wait for clock_period;

        btn_play <= '1';
        wait for clock_period;
        assert status = "0010" report ("Error in sPlay") severity error;
        btn_play <= '0';
        wait for clock_period;

        btn_stop <= '1';
        wait for clock_period;
        assert status = "0100" report ("Error in sStop") severity error;
        btn_stop <= '0';
        wait for clock_period;
        wait for clock_period*20;

        -------------------------------------------------------------------------------
        -- TEST STOP FROM PAUSE
        -------------------------------------------------------------------------------
        btn_play <= '1';
        wait for clock_period;
        assert status = "0010" report ("Error in sPlay") severity error;
        btn_play <= '0';
        wait for clock_period;

        btn_play <= '1';
        wait for clock_period;
        assert status = "0001" report ("Error in sPause") severity error;
        btn_play <= '0';
        wait for clock_period;

        btn_stop <= '1';
        wait for clock_period;
        assert status = "0100" report ("Error in sStop") severity error;
        btn_stop <= '0';
        wait for clock_period;
        wait for clock_period*20;

        -------------------------------------------------------------------------------
        -- TEST STOP FROM STOP
        -------------------------------------------------------------------------------
        btn_stop <= '1';
        wait for clock_period;
        assert status = "0100" report ("Error in sStop") severity error;
        btn_stop <= '0';
        wait for clock_period;
        wait for clock_period*20;

        -------------------------------------------------------------------------------
        -- TEST LOOOONG PLAY
        -------------------------------------------------------------------------------
        btn_play <= '1';
        wait for clock_period*20;
        assert status = "0010" report ("Error in sPlay") severity error;
        btn_play <= '0';
        wait for clock_period;

        btn_play <= '1';
        wait for clock_period*20;
        assert status = "0001" report ("Error in sPause") severity error;
        btn_play <= '0';
        wait for clock_period;

        btn_stop <= '1';
        wait for clock_period*20;
        assert status = "0100" report ("Error in sStop") severity error;
        btn_stop <= '0';
        wait for clock_period;
        wait for clock_period*20;


        -------------------------------------------------------------------------------
        -- SIMULTANEOUS BUTTON PRESSES
        -------------------------------------------------------------------------------
        btn_play <= '1';            btn_stop <= '1';
        wait for clock_period;
        assert status = "0100" report ("Error in sStop") severity error;
        btn_play <= '0';            btn_stop <= '0';
        wait for clock_period;
        wait for clock_period*20;

        btn_play <= '1';
        wait for clock_period;
        btn_play <= '0';
        wait for clock_period;
        btn_play <= '1';            btn_stop <= '1';
        wait for clock_period;
        assert status = "0100" report ("Error in sStop") severity error;
        btn_play <= '0';            btn_stop <= '0';
        wait for clock_period;
        wait for clock_period*20;

        btn_play <= '1';
        wait for clock_period;
        btn_play <= '0';
        wait for clock_period;
        btn_play <= '1';
        wait for clock_period;
        btn_play <= '0';
        wait for clock_period;
        btn_play <= '1';            btn_stop <= '1';
        wait for clock_period;
        assert status = "0100" report ("Error in sStop") severity error;
        btn_play <= '0';            btn_stop <= '0';
        wait for clock_period;
        wait for clock_period*20;




        report("If you saw no errors before this point, you're in a good state ;-)") severity note;
        
        wait;
    end process;

    status <= inReset & inStop & inPlay & inPause;

    -------------------------------------------------------------------------------
    -- DUT
    -------------------------------------------------------------------------------
    DUT: component muziek_speler_controle port map(
        clock => clock_i,
        reset => reset_i,
        btn_stop => btn_stop,
        btn_play => btn_play,
        inReset => inReset,
        inStop => inStop,
        inPlay => inPlay,
        inPause => inPause
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
        wait for clock_period*5;
        wait for clock_period/2;
        reset_i <= '0';
        wait;
    end process PRST;

end Behavioural;