library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;

-- NOTE: de entity van de testbench heeft géén poorten
entity program_counter_tb is
end program_counter_tb;

architecture Behavioral of tb_counter is

    -- COMPONENT DECLARATIE
    component program_counter is
        port (
            clock: in std_logic;
            reset: in std_logic;
            load: in std_logic;
            inc: in std_logic;
            data_in : in std_logic_vector(31 downto 0);
            data_out : out std_logic_vector(31 downto 0)
        );
    end component;

    signal clock: std_logic;
    signal reset: std_logic;
    signal load: std_logic;
    signal inc: std_logic;
    signal data_in : std_logic_vector(31 downto 0);
    signal data_out : std_logic_vector(31 downto 0);
    
    constant clock_period : time := 10 ns;

begin

    DUT: component program_counter port map(   
        clock => clock,
        reset => reset,
        load => load,
        inc => inc,
        data_in => data_in,
        data_out => data_out);


    PCLK: process begin
        clock <= '0';
        wait for clock_period/2;
        clock <= '1';
        wait for clock_period/2; 
    end process;                


    PSTIM: process begin
        data_in <= x"00000000";
        reset <= '0';
        load <= '0';
        inc <= '0';
        
        wait for clock_period*8;
        
        data_in <= x"00000000";
        reset <= '1';
        load <= '0';
        inc <= '0';
        wait for clock_period*2;
        assert (data_out = x"00000000") report "reset werkt niet" severity failure;
        
        data_in <= x"00000000";
        reset <= '0';
        load <= '0';
        inc <= '1';
        wait for clock_period;
        
        assert (data_out = x"00000001") report "increment werkt niet" severity failure;
        
        wait for clock_period*10;
        
        assert (data_out = x"0000000B") report "increment werkt niet" severity failure;
        
        data_in <= x"00000E00";
        reset <= '0';
        load <= '1';
        inc <= '0';    
        
        wait for clock_period;    
        
        assert (data_out = x"00000E00") report "load werkt niet" severity failure;
        
        
        data_in <= x"00000E00";
        reset <= '0';
        load <= '0';
        inc <= '1';      
        
        wait for clock_period;    
        
        assert (data_out = x"00000E01") report "inc na load werkt niet" severity failure;
        
        data_in <= x"FFFFFFFF";
        reset <= '0';
        load <= '1';
        inc <= '0';  
        
        wait for clock_period;    
        
        assert (data_out = x"FFFFFFFF") report "load werkt niet" severity failure;      
    
        data_in <= x"FFFFFCFF";
        reset <= '0';
        load <= '1';
        inc <= '1';  
        
        wait for clock_period;
        
        assert (data_out = x"FFFFFCFF") report "load before increment werkt niet" severity failure;
        
        data_in <= x"FFFFFFFF";
        reset <= '0';
        load <= '1';
        inc <= '0';  
        
        wait for clock_period;    
        
        assert (data_out = x"FFFFFFFF") report "load werkt niet" severity failure;      
    
        data_in <= x"FFFFFFFF";
        reset <= '0';
        load <= '0';
        inc <= '1';  
        
        wait for clock_period;

        assert (data_out = x"00000000") report "overflow werkt niet" severity failure;

        data_in <= x"FEDCBA98";
        reset <= '1';
        load <= '1';
        inc <= '1';  
        
        wait for clock_period;
        
        assert (data_out = x"00000000") report "reset werkt niet" severity failure;   
        
        data_in <= x"FEDCBA98";
        reset <= 'H';
        load <= 'L';
        inc <= 'L';  
        
        wait for clock_period;
        
        assert (data_out = x"00000000") report "reset werkt niet" severity failure;         
        
        data_in <= x"FEDCBA98";
        reset <= 'L';
        load <= '0';
        inc <= '1';  
        
        wait for clock_period;
        
        assert (data_out = "0000000000000001") report "iets werkt niet" severity failure;                
        
        data_in <= x"FEDCBA98";
        reset <= 'X';
        load <= 'L';
        inc <= 'H';  
        
        wait for clock_period;
        
        data_in <= x"FEDCBA98";
        reset <= '1';
        load <= 'W';
        inc <= 'Z';  
        
        wait for clock_period;
        
        assert (data_out = x"00000000") report "reset werkt niet" severity failure;              
        
        wait;        
        
    end process;                

end Behavioral;
