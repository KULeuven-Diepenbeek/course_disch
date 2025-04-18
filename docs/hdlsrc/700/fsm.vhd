entity muziek_speler_controle is
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
end entity muziek_speler_controle;
