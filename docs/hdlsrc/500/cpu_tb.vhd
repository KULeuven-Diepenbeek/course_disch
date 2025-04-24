--------------------------------------------------------------------------------
-- KU Leuven - ESAT/COSIC - Emerging technologies, Systems & Security
--------------------------------------------------------------------------------
-- Module Name:     cpu_tb - Behavioural
-- Project Name:    Testbench for cpu
-- Description:     
--
-- Revision     Date       Author     Comments
-- v0.1         20240314   VlJo       Initial version
--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.NUMERIC_STD.ALL;

entity cpu_tb is
end entity cpu_tb;

architecture Behavioural of cpu_tb is

    component cpu is
        port(
            clock : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            instruction : IN STD_LOGIC_VECTOR(15 downto 0);
            inM : IN STD_LOGIC_VECTOR(15 downto 0);
            outM : OUT STD_LOGIC_VECTOR(15 downto 0);
            PC : OUT STD_LOGIC_VECTOR(15 downto 0);
            addressM : OUT STD_LOGIC_VECTOR(15 downto 0);
            writeM : OUT STD_LOGIC
        );
    end component;

    component mem_model is
        generic (
            DATA_WIDTH : natural := 16;
            DATA_DEPTH_LOG2 : natural := 10;
            FNAME : string := "data.dat"
        );
        port (
            reset : IN STD_LOGIC;
            clock : IN STD_LOGIC;
            ADDR : IN STD_LOGIC_VECTOR(DATA_DEPTH_LOG2-1 downto 0);
            WE : IN STD_LOGIC;
            WDATA : IN STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
            RDATA : OUT STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0)
        );
    end component;


    signal clock : STD_LOGIC;
    signal reset : STD_LOGIC;

    signal instruction : STD_LOGIC_VECTOR(15 downto 0);
    signal inM : STD_LOGIC_VECTOR(15 downto 0);
    signal outM : STD_LOGIC_VECTOR(15 downto 0);
    signal PC : STD_LOGIC_VECTOR(15 downto 0);
    signal addressM : STD_LOGIC_VECTOR(15 downto 0);
    signal writeM : STD_LOGIC;

    constant zeroes : STD_LOGIC_VECTOR(15 downto 0) := x"0000";
    constant clock_period : time := 10 ns;

begin

    -------------------------------------------------------------------------------
    -- DUT
    -------------------------------------------------------------------------------
    DUT: component cpu port map(
        clock => clock,
        reset => reset,
        instruction => instruction,
        inM => inM,
        outM => outM,
        PC => PC,
        addressM => addressM,
        writeM => writeM
    );

    -------------------------------------------------------------------------------
    -- SIMULATION MODELS
    -------------------------------------------------------------------------------
    dmem: component mem_model generic map(
        FNAME => "/home/jvliegen/vc/github/KULeuven-Diepenbeek/course_disch_internal/cpu/firmware/empty.dat"
    ) port map(
        reset => reset,
        clock => clock,
        ADDR => addressM(9 downto 0),
        WE => writeM,
        WDATA => outM,
        RDATA => inM
    );

    imem: component mem_model generic map(
        FNAME => "/home/jvliegen/vc/github/KULeuven-Diepenbeek/course_disch_internal/cpu/firmware/firmware.dat"
    ) port map(
        reset => reset,
        clock => clock,
        ADDR => PC(9 downto 0),
        WE => zeroes(0),
        WDATA => zeroes,
        RDATA => instruction
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
    PRESET: process
    begin
        reset <= '1';
        wait for clock_period*9;
        wait for clock_period/2;
        reset <= '0';
        wait;
    end process PRESET;

end Behavioural;


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- MEM MODEL
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;
    use IEEE.NUMERIC_STD.ALL;
    use IEEE.STD_LOGIC_MISC.or_reduce;
    use STD.textio.all;
    use ieee.std_logic_textio.all;

entity mem_model is
    generic (
        DATA_WIDTH : natural := 16;
        DATA_DEPTH_LOG2 : natural := 10;
        FNAME : string := "data.dat"
    );
    port (
        reset : IN STD_LOGIC;
        clock : IN STD_LOGIC;
        ADDR : IN STD_LOGIC_VECTOR(DATA_DEPTH_LOG2-1 downto 0);
        WE : IN STD_LOGIC;
        WDATA : IN STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        RDATA : OUT STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0)
    );
end entity mem_model;

architecture Behavioural of mem_model is

    -- localised inputs
    signal reset_i : STD_LOGIC;
    signal clock_i : STD_LOGIC;
    signal ADDR_i : STD_LOGIC_VECTOR(DATA_DEPTH_LOG2-1 downto 0);
    signal WE_i : STD_LOGIC;
    signal WDATA_i : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal RDATA_i : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);

    file fh : text;

    type T_memory is array(0 to (2**DATA_DEPTH_LOG2)-1) of STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal mem : T_memory;

    signal outgoing_data : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal addr_int : integer range 0 to ((2**DATA_DEPTH_LOG2)-1);

begin

    -------------------------------------------------------------------------------
    -- (DE-)LOCALISING IN/OUTPUTS
    -------------------------------------------------------------------------------
    reset_i <= reset;
    clock_i <= clock;
    ADDR_i <= ADDR after 1 ns;
    WE_i <= WE after 1 ns;
    WDATA_i <= WDATA after 1 ns;
    RDATA <= RDATA_i;
    
    -------------------------------------------------------------------------------
    -- COMBINATORIAL
    -------------------------------------------------------------------------------
    -- RDATA_i <= outgoing_data;
    RDATA_i <= mem(addr_int);
    addr_int <= to_integer(unsigned(ADDR_i));

    -------------------------------------------------------------------------------
    -- MEMORY
    -------------------------------------------------------------------------------
    PMEM: process(reset_i, clock_i)
        variable v_line : line;
        variable v_temp : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        variable v_pointer : integer;
    begin
        if reset_i = '1' then 
            outgoing_data <= (others => '0');
            mem <= (others => (others => '0'));

            -- init the firmware
            v_pointer := 0;
            file_open(fh, FNAME, read_mode);

            while not endfile(fh) loop
                readline(fh, v_line);
                -- hread(v_line, v_temp);
                read(v_line, v_temp);
                mem(v_pointer) <= v_temp;
                v_pointer := v_pointer + 1;
            end loop;

            file_close(fh);
        elsif rising_edge(clock_i) then 
            -- write to memory
            if WE_i = '1' then 
                mem(addr_int) <= WDATA_i;
                outgoing_data <= (others => '0');
            else
                -- read from memory 
                outgoing_data <= mem(addr_int);
            end if;

        end if;
    end process;


end Behavioural;
