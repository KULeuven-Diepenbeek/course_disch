    type T_bus_if_o is record
        data : STD_LOGIC_VECTOR(C_DATAWIDTH-1 downto 0);
        address : STD_LOGIC_VECTOR(C_DATAWIDTH-1 downto 0);
        we : STD_LOGIC_VECTOR(C_DATAWIDTH/8-1 downto 0);
    end record;