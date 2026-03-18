entity microcontroller is
    port(
        clock : in STD_LOGIC;
        resetn : in STD_LOGIC;

        GPIO_LEDS : out STD_LOGIC_VECTOR(15 downto 0)
    );
end entity microcontroller;