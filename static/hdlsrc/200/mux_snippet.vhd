...
architecture Behavioral of ...
    ...
    signal rotate_left : STD_LOGIC_VECTOR(7 downto 0);
    signal rotate_right : STD_LOGIC_VECTOR(7 downto 0);
    signal MUX_select : STD_LOGIC;
    signal transformed : STD_LOGIC_VECTOR(7 downto 0);
    ...
begin
    ...
    -- optie 1
    transformed <= rotate_left when MUX_select = '0' else rotate_right;

    -- optie 2
    with MUX_select select
        transformed <= rotate_left when '0',
        rotate_right when others;

    -- optie 3
    PMUX: process(rotate_left, rotate_right, MUX_select)
    begin
        if MUX_select = '0' then 
            transformed <= rotate_left;
        else
            transformed <= rotate_right;
        end if;
    end process;
    ...
end Behavioral;