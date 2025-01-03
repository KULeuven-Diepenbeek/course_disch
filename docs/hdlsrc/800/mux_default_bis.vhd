-- entity
-- architecture
signal getal : STD_LOGIC_VECTOR(3 downto 0);
signal getal_is_even, getal_is_oneven : STD_LOGIC;
-- begin

PMUX: process(getal)
begin
    if getal(0) = '1' then 
        getal_is_oneven <= '1'; getal_is_even <= '0';
    elsif getal(0) = '0' then 
        getal_is_oneven <= '0'; getal_is_even <= '1';
    end if;
end process;

-- end architecture