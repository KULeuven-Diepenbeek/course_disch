--------------------------------------------------------------------------------
-- KU Leuven - ESAT/COSIC - Emerging technologies, Systems & Security
--------------------------------------------------------------------------------
-- Module Name:     regfile_tb - Behavioural
-- Project Name:    Testbench for regfile
-- Description:     Testbench for the register file
--
-- Revision     Date       Author     Comments
-- v0.1         20250731   VlJo       Initial version
--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.NUMERIC_STD.ALL;

entity regfile_tb is
    generic (
        G_WIDTH : natural := 32; -- Width of the registers
        G_REGCOUNT_LOG2 : natural := 3 -- log2(C_REGCOUNT)
    );
end entity regfile_tb;

architecture Behavioural of regfile_tb is

    component regfile is
        generic (
            G_WIDTH : natural := 32; -- Width of the registers
            G_REGCOUNT_LOG2 : natural := 3 -- log2(C_REGCOUNT)
        );
        port(
            clock : in STD_LOGIC;
            reset : in STD_LOGIC;
            we : in std_logic;
            src1 : in std_logic_vector(G_REGCOUNT_LOG2-1 downto 0);
            src2 : in std_logic_vector(G_REGCOUNT_LOG2-1 downto 0);
            dest : in std_logic_vector(G_REGCOUNT_LOG2-1 downto 0);
            data : in std_logic_vector(G_WIDTH-1 downto 0);
            data1 : out std_logic_vector(G_WIDTH-1 downto 0);
            data2 : out std_logic_vector(G_WIDTH-1 downto 0)
        );
    end component regfile;

    signal clock_i : STD_LOGIC;
    signal reset_i : STD_LOGIC;
    signal we : STD_LOGIC;
    signal src1 : STD_LOGIC_VECTOR(G_REGCOUNT_LOG2-1 downto 0);
    signal src2 : STD_LOGIC_VECTOR(G_REGCOUNT_LOG2-1 downto 0);
    signal dest : STD_LOGIC_VECTOR(G_REGCOUNT_LOG2-1 downto 0);
    signal data : STD_LOGIC_VECTOR(G_WIDTH-1 downto 0);
    signal data1 : STD_LOGIC_VECTOR(G_WIDTH-1 downto 0);
    signal data2 : STD_LOGIC_VECTOR(G_WIDTH-1 downto 0);

    constant clock_period : time := 10 ns;

begin

    -------------------------------------------------------------------------------
    -- STIMULI
    -------------------------------------------------------------------------------
    PSTIM: process
        variable good_checks : natural;
        variable bad_checks : natural;
    begin
        we <= '0';
        src1 <= "000";
        src2 <= "000";
        dest <= "000";
        data <= (others => '0');
        good_checks := 0;
        bad_checks := 0;
        
        wait until clock_i = '1';
        wait until clock_i = '0';
        wait for clock_period * 10;
        
        -- do readback -----------------------------------------------------------------------------
        src1 <= "000";
        wait for clock_period;
        if data1 /= x"00000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        
        src1 <= "001";
        wait for clock_period;
        if data1 /= x"00000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;

        src1 <= "010";
        wait for clock_period;
        if data1 /= x"00000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;

        src1 <= "011";
        wait for clock_period;
        if data1 /= x"00000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;

        src1 <= "100";
        wait for clock_period;
        if data1 /= x"00000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        
        src1 <= "101";
        wait for clock_period;
        if data1 /= x"00000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;

        src1 <= "110";
        wait for clock_period;
        if data1 /= x"00000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;

        src1 <= "111";
        wait for clock_period;
        if data1 /= x"00000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;


        -- do write sweep -----------------------------------------------------------------------------
        data <= x"00000001";    dest <= "001";        we <= '1';        wait for clock_period;
        data <= x"00000002";    dest <= "010";        we <= '1';        wait for clock_period;
        data <= x"00000003";    dest <= "011";        we <= '1';        wait for clock_period;
        data <= x"00000004";    dest <= "100";        we <= '1';        wait for clock_period;
        data <= x"00000005";    dest <= "101";        we <= '1';        wait for clock_period;
        data <= x"00000006";    dest <= "110";        we <= '1';        wait for clock_period;
        data <= x"00000007";    dest <= "111";        we <= '1';        wait for clock_period;

        -- do readback -----------------------------------------------------------------------------
        src1 <= "000";        wait for clock_period;
        if data1 /= x"00000000" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;
        src1 <= "001";        wait for clock_period;
        if data1 /= x"00000001" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;
        src1 <= "010";        wait for clock_period;
        if data1 /= x"00000002" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;
        src1 <= "011";        wait for clock_period;
        if data1 /= x"00000003" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;
        src1 <= "100";        wait for clock_period;
        if data1 /= x"00000004" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;
        src1 <= "101";        wait for clock_period;
        if data1 /= x"00000005" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;
        src1 <= "110";        wait for clock_period;
        if data1 /= x"00000006" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;
        src1 <= "111";        wait for clock_period;
        if data1 /= x"00000007" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;

        -- do write sweep -----------------------------------------------------------------------------
        data <= x"FFFFFFFF";    dest <= "001";        we <= '0';        wait for clock_period;
        data <= x"FFFFFFFF";    dest <= "010";        we <= '0';        wait for clock_period;
        data <= x"FFFFFFFF";    dest <= "011";        we <= '0';        wait for clock_period;
        data <= x"FFFFFFFF";    dest <= "100";        we <= '0';        wait for clock_period;
        data <= x"FFFFFFFF";    dest <= "101";        we <= '0';        wait for clock_period;
        data <= x"FFFFFFFF";    dest <= "110";        we <= '0';        wait for clock_period;
        data <= x"FFFFFFFF";    dest <= "111";        we <= '0';        wait for clock_period;

        -- do readback -----------------------------------------------------------------------------
        src1 <= "000";        wait for clock_period;
        if data1 /= x"00000000" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;
        src1 <= "001";        wait for clock_period;
        if data1 /= x"00000001" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;
        src1 <= "010";        wait for clock_period;
        if data1 /= x"00000002" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;
        src1 <= "011";        wait for clock_period;
        if data1 /= x"00000003" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;
        src1 <= "100";        wait for clock_period;
        if data1 /= x"00000004" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;
        src1 <= "101";        wait for clock_period;
        if data1 /= x"00000005" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;
        src1 <= "110";        wait for clock_period;
        if data1 /= x"00000006" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;
        src1 <= "111";        wait for clock_period;
        if data1 /= x"00000007" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;

        -- do write sweep -----------------------------------------------------------------------------
        data <= x"FFFFFFFF";    dest <= "001";        we <= '1';        wait for clock_period;
        data <= x"FFFFFFFF";    dest <= "010";        we <= '1';        wait for clock_period;
        data <= x"FFFFFFFF";    dest <= "011";        we <= '1';        wait for clock_period;
        data <= x"FFFFFFFF";    dest <= "100";        we <= '1';        wait for clock_period;
        data <= x"FFFFFFFF";    dest <= "101";        we <= '1';        wait for clock_period;
        data <= x"FFFFFFFF";    dest <= "110";        we <= '1';        wait for clock_period;
        data <= x"FFFFFFFF";    dest <= "111";        we <= '1';        wait for clock_period;

        -- do readback -----------------------------------------------------------------------------
        src2 <= "000";        wait for clock_period;
        if data2 /= x"00000000" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;
        src2 <= "001";        wait for clock_period;
        if data2 /= x"FFFFFFFF" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;
        src2 <= "010";        wait for clock_period;
        if data2 /= x"FFFFFFFF" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;
        src2 <= "011";        wait for clock_period;
        if data2 /= x"FFFFFFFF" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;
        src2 <= "100";        wait for clock_period;
        if data2 /= x"FFFFFFFF" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;
        src2 <= "101";        wait for clock_period;
        if data2 /= x"FFFFFFFF" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;
        src2 <= "110";        wait for clock_period;
        if data2 /= x"FFFFFFFF" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;
        src2 <= "111";        wait for clock_period;
        if data2 /= x"FFFFFFFF" then bad_checks := bad_checks + 1; else good_checks := good_checks + 1; end if;



        report "DISCH_GRADING (good, bad, total): " & integer'image(good_checks) & " " & integer'image(bad_checks) & " " & integer'image(good_checks + bad_checks) & "" severity note;


        wait;
    end process;


    -------------------------------------------------------------------------------
    -- DUT
    -------------------------------------------------------------------------------
    DUT: component regfile generic map(
        G_WIDTH => G_WIDTH,
        G_REGCOUNT_LOG2 => G_REGCOUNT_LOG2
    ) port map(
        clock => clock_i,
        reset => reset_i,
        we => we,
        src1 => src1,
        src2 => src2,
        dest => dest,
        data => data,
        data1 => data1,
        data2 => data2
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
        wait;
    end process PRST;

end Behavioural;