library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu_tb is
end entity alu_tb;

architecture Behavioural of alu_tb is
    component alu is
        port(
            operator1 : in std_logic_vector(32-1 downto 0);
            operator2 : in std_logic_vector(32-1 downto 0);
            ALUOp : in std_logic_vector(2 downto 0);
            arith_logic_b : in STD_LOGIC;
            signed_unsigned_b : in STD_LOGIC;
            result : out std_logic_vector(32-1 downto 0);
            zero : out STD_LOGIC;
            equal : out STD_LOGIC;
            carryOut : out STD_LOGIC;
            x_lt_y_u : out STD_LOGIC;
            x_lt_y_s : out STD_LOGIC
        );
    end component alu;

    signal operator1 : std_logic_vector(32-1 downto 0);
    signal operator2 : std_logic_vector(32-1 downto 0);
    signal ALUOp : std_logic_vector(2 downto 0);
    signal arith_logic_b : STD_LOGIC;
    signal signed_unsigned_b : STD_LOGIC;
    signal result : std_logic_vector(32-1 downto 0);
    signal zero : STD_LOGIC;
    signal equal : STD_LOGIC;
    signal carryOut : STD_LOGIC;
    signal x_lt_y_u : STD_LOGIC;
    signal x_lt_y_s : STD_LOGIC;

begin

    PSTIM: process
        variable good_checks : natural;
        variable bad_checks : natural;
    begin
        operator1 <= (others => '0');
        operator2 <= (others => '0');
        ALUOp <= (others => '0');
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        good_checks := 0;
        bad_checks := 0;
        wait for 4 ns;

        operator1 <= x"788fdea8"; -- 2022694568
        operator2 <= x"87dc611d"; -- 2279366941
        ALUOp <= "000";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"008c4008" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"bdf934bc"; -- 3187225788
        operator2 <= x"ebe33c1d"; -- 3957537821
        ALUOp <= "000";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"a9e1341c" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"3a06a8ea"; -- 973514986
        operator2 <= x"e0cc488f"; -- 3771484303
        ALUOp <= "000";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"2004088a" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"b5820f27"; -- 3045199655
        operator2 <= x"ff66f1a6"; -- 4284936614
        ALUOp <= "000";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"b5020126" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"9e9b4862"; -- 2660976738
        operator2 <= x"e8059bde"; -- 3892681694
        ALUOp <= "000";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"88010842" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"917d55d3"; -- 2440910291
        operator2 <= x"ee7f812d"; -- 4001333549
        ALUOp <= "001";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"ff7fd5ff" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"c1593b88"; -- 3243850632
        operator2 <= x"ab21afe8"; -- 2871111656
        ALUOp <= "001";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"eb79bfe8" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"5fc47af1"; -- 1606712049
        operator2 <= x"007efb5f"; -- 8321887
        ALUOp <= "001";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"5ffefbff" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"99e80094"; -- 2582118548
        operator2 <= x"87556b04"; -- 2270522116
        ALUOp <= "001";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"9ffd6b94" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"d207a90b"; -- 3523717387
        operator2 <= x"2a5cab45"; -- 710716229
        ALUOp <= "001";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"fa5fab4f" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"ab930b61"; -- 2878540641
        operator2 <= x"bbe8ea1c"; -- 3152603676
        ALUOp <= "010";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"107be17d" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"80aefb9f"; -- 2158951327
        operator2 <= x"15ef582e"; -- 368007214
        ALUOp <= "010";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"9541a3b1" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"5f16c121"; -- 1595326753
        operator2 <= x"b74b8047"; -- 3075178567
        ALUOp <= "010";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"e85d4166" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"62a31ca0"; -- 1654856864
        operator2 <= x"8eb5a896"; -- 2394269846
        ALUOp <= "010";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"ec16b436" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"d5dbfaa5"; -- 3587963557
        operator2 <= x"70566c8f"; -- 1884712079
        ALUOp <= "010";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"a58d962a" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"f6abce57"; -- 4138454615
        operator2 <= x"1fdfd7fa"; -- 534763514
        ALUOp <= "011";
        arith_logic_b <= '0';
        signed_unsigned_b <= '1';
        wait for 2 ns;
        if result /= x"00000001" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"f6abce57"; -- 4138454615
        operator2 <= x"1fdfd7fa"; -- 534763514
        ALUOp <= "011";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"4813fbfd"; -- 1209269245
        operator2 <= x"d1880b0d"; -- 3515353869
        ALUOp <= "011";
        arith_logic_b <= '0';
        signed_unsigned_b <= '1';
        wait for 2 ns;
        if result /= x"00000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"4813fbfd"; -- 1209269245
        operator2 <= x"d1880b0d"; -- 3515353869
        ALUOp <= "011";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000001" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"a2b41984"; -- 2729712004
        operator2 <= x"b8a7d061"; -- 3098005601
        ALUOp <= "011";
        arith_logic_b <= '0';
        signed_unsigned_b <= '1';
        wait for 2 ns;
        if result /= x"00000001" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"a2b41984"; -- 2729712004
        operator2 <= x"b8a7d061"; -- 3098005601
        ALUOp <= "011";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000001" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"bc03de51"; -- 3154370129
        operator2 <= x"e10e8379"; -- 3775824761
        ALUOp <= "011";
        arith_logic_b <= '0';
        signed_unsigned_b <= '1';
        wait for 2 ns;
        if result /= x"00000001" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"bc03de51"; -- 3154370129
        operator2 <= x"e10e8379"; -- 3775824761
        ALUOp <= "011";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000001" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"97861623"; -- 2542147107
        operator2 <= x"f5f1d39a"; -- 4126266266
        ALUOp <= "011";
        arith_logic_b <= '0';
        signed_unsigned_b <= '1';
        wait for 2 ns;
        if result /= x"00000001" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"97861623"; -- 2542147107
        operator2 <= x"f5f1d39a"; -- 4126266266
        ALUOp <= "011";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000001" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"3e5bf70d"; -- 1046214413
        operator2 <= x"60d64271"; -- 1624654449
        ALUOp <= "100";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"9f32397e" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"bbcfba70"; -- 3150953072
        operator2 <= x"a12ee8c1"; -- 2704206017
        ALUOp <= "100";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"5cfea331" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"c89a5208"; -- 3365556744
        operator2 <= x"fcd26ff2"; -- 4241649650
        ALUOp <= "100";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"c56cc1fa" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"82c8058e"; -- 2194146702
        operator2 <= x"1ba49f5a"; -- 463773530
        ALUOp <= "100";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"9e6ca4e8" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"88983705"; -- 2291676933
        operator2 <= x"69bc92e2"; -- 1773966050
        ALUOp <= "100";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"f254c9e7" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"af1992ef"; -- 2937688815
        operator2 <= x"b5e15e25"; -- 3051445797
        ALUOp <= "101";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"f93834ca" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"c8af294e"; -- 3366922574
        operator2 <= x"3be2b7b6"; -- 1004713910
        ALUOp <= "101";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"8ccc7198" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"7c4766e1"; -- 2085054177
        operator2 <= x"f34a55ec"; -- 4081735148
        ALUOp <= "101";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"88fd10f5" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"ca11df32"; -- 3390168882
        operator2 <= x"701f5645"; -- 1881101893
        ALUOp <= "101";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"59f288ed" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"0f06de5f"; -- 252108383
        operator2 <= x"c86d71ba"; -- 3362615738
        ALUOp <= "101";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"46996ca5" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"4e802dbe"; -- 1317023166
        operator2 <= x"8322fd50"; -- 2200108368
        ALUOp <= "110";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"2dbe0000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"dc0928e8"; -- 3691587816
        operator2 <= x"5604281a"; -- 1443112986
        ALUOp <= "110";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"a0000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"3e3e58e4"; -- 1044273380
        operator2 <= x"c2015096"; -- 3254866070
        ALUOp <= "110";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"39000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"170889ce"; -- 386435534
        operator2 <= x"792dca48"; -- 2033044040
        ALUOp <= "110";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0889ce00" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"783dfe6d"; -- 2017328749
        operator2 <= x"74f40aa0"; -- 1962150560
        ALUOp <= "110";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"783dfe6d" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"a7e89403"; -- 2817037315
        operator2 <= x"b527eafb"; -- 3039292155
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000014" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"a7e89403"; -- 2817037315
        operator2 <= x"b527eafb"; -- 3039292155
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"fffffff4" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"74fef415"; -- 1962865685
        operator2 <= x"4f5ba531"; -- 1331406129
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00003a7f" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"74fef415"; -- 1962865685
        operator2 <= x"4f5ba531"; -- 1331406129
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00003a7f" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"5e4bcc67"; -- 1582025831
        operator2 <= x"3ea3c333"; -- 1050919731
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000bc9" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"5e4bcc67"; -- 1582025831
        operator2 <= x"3ea3c333"; -- 1050919731
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000bc9" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"24d6ec50"; -- 618064976
        operator2 <= x"b89e8945"; -- 3097397573
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0126b762" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"24d6ec50"; -- 618064976
        operator2 <= x"b89e8945"; -- 3097397573
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0126b762" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"8c600d79"; -- 2355105145
        operator2 <= x"060d45ed"; -- 101533165
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00046300" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"8c600d79"; -- 2355105145
        operator2 <= x"060d45ed"; -- 101533165
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"fffc6300" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"9c59370e"; -- 2623092494
        operator2 <= x"be93e3fc"; -- 3197363196
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000009" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"9c59370e"; -- 2623092494
        operator2 <= x"be93e3fc"; -- 3197363196
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"fffffff9" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"9e0d2495"; -- 2651661461
        operator2 <= x"e659e29d"; -- 3864650397
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000004" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"9e0d2495"; -- 2651661461
        operator2 <= x"e659e29d"; -- 3864650397
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"fffffffc" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"d6f51ee8"; -- 3606388456
        operator2 <= x"f76ba0e1"; -- 4151025889
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"6b7a8f74" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"d6f51ee8"; -- 3606388456
        operator2 <= x"f76ba0e1"; -- 4151025889
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"eb7a8f74" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"44c85b0a"; -- 1153981194
        operator2 <= x"0aca7859"; -- 181041241
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000022" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"44c85b0a"; -- 1153981194
        operator2 <= x"0aca7859"; -- 181041241
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000022" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"0d5e6550"; -- 224290128
        operator2 <= x"57f402c7"; -- 1475609287
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"001abcca" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"0d5e6550"; -- 224290128
        operator2 <= x"57f402c7"; -- 1475609287
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"001abcca" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"5f49397f"; -- 1598634367
        operator2 <= x"09c3de0b"; -- 163831307
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"000be927" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"5f49397f"; -- 1598634367
        operator2 <= x"09c3de0b"; -- 163831307
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"000be927" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"706a4d96"; -- 1886014870
        operator2 <= x"2b8e86fb"; -- 730760955
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0000000e" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"706a4d96"; -- 1886014870
        operator2 <= x"2b8e86fb"; -- 730760955
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0000000e" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"c8394d0f"; -- 3359198479
        operator2 <= x"aa951051"; -- 2861895761
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0000641c" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"c8394d0f"; -- 3359198479
        operator2 <= x"aa951051"; -- 2861895761
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"ffffe41c" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"96a25054"; -- 2527219796
        operator2 <= x"8073bd1c"; -- 2155068700
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000009" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"96a25054"; -- 2527219796
        operator2 <= x"8073bd1c"; -- 2155068700
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"fffffff9" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"ab323f54"; -- 2872196948
        operator2 <= x"604cc1fb"; -- 1615643131
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000015" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"ab323f54"; -- 2872196948
        operator2 <= x"604cc1fb"; -- 1615643131
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"fffffff5" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"e78bd3b2"; -- 3884700594
        operator2 <= x"092f8a5a"; -- 154110554
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000039" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"e78bd3b2"; -- 3884700594
        operator2 <= x"092f8a5a"; -- 154110554
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"fffffff9" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"120882f7"; -- 302547703
        operator2 <= x"2680fc6c"; -- 645987436
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00012088" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"120882f7"; -- 302547703
        operator2 <= x"2680fc6c"; -- 645987436
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00012088" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"07634e97"; -- 123948695
        operator2 <= x"5ca0bddd"; -- 1554038237
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"07634e97"; -- 123948695
        operator2 <= x"5ca0bddd"; -- 1554038237
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"ee145b6b"; -- 3994311531
        operator2 <= x"9db650f3"; -- 2645971187
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00001dc2" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"ee145b6b"; -- 3994311531
        operator2 <= x"9db650f3"; -- 2645971187
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"fffffdc2" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"09fe77fc"; -- 167671804
        operator2 <= x"7445de60"; -- 1950735968
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"09fe77fc" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"09fe77fc"; -- 167671804
        operator2 <= x"7445de60"; -- 1950735968
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"09fe77fc" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"02698fe3"; -- 40472547
        operator2 <= x"bbc9b83c"; -- 3150559292
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"02698fe3"; -- 40472547
        operator2 <= x"bbc9b83c"; -- 3150559292
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"8e87fad4"; -- 2391276244
        operator2 <= x"0533928c"; -- 87265932
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0008e87f" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"8e87fad4"; -- 2391276244
        operator2 <= x"0533928c"; -- 87265932
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"fff8e87f" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"aeea424b"; -- 2934587979
        operator2 <= x"c646db73"; -- 3326532467
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"000015dd" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"aeea424b"; -- 2934587979
        operator2 <= x"c646db73"; -- 3326532467
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"fffff5dd" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"100912e1"; -- 269030113
        operator2 <= x"88ae0eb8"; -- 2293108408
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000010" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"100912e1"; -- 269030113
        operator2 <= x"88ae0eb8"; -- 2293108408
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000010" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"3f83ea18"; -- 1065609752
        operator2 <= x"42dc02c1"; -- 1121714881
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"1fc1f50c" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"3f83ea18"; -- 1065609752
        operator2 <= x"42dc02c1"; -- 1121714881
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"1fc1f50c" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"a57c58c9"; -- 2776389833
        operator2 <= x"977e933d"; -- 2541654845
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000005" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"a57c58c9"; -- 2776389833
        operator2 <= x"977e933d"; -- 2541654845
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"fffffffd" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"d3594f99"; -- 3545845657
        operator2 <= x"07230e35"; -- 119737909
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0000069a" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"d3594f99"; -- 3545845657
        operator2 <= x"07230e35"; -- 119737909
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"fffffe9a" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"14b4236c"; -- 347349868
        operator2 <= x"b6d9eb3b"; -- 3067734843
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000002" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"14b4236c"; -- 347349868
        operator2 <= x"b6d9eb3b"; -- 3067734843
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000002" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"21f49458"; -- 569676888
        operator2 <= x"6740a079"; -- 1732288633
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000010" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"21f49458"; -- 569676888
        operator2 <= x"6740a079"; -- 1732288633
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000010" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"348ddb9d"; -- 881712029
        operator2 <= x"acf5f871"; -- 2901801073
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00001a46" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"348ddb9d"; -- 881712029
        operator2 <= x"acf5f871"; -- 2901801073
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00001a46" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"22687074"; -- 577269876
        operator2 <= x"90676604"; -- 2422695428
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"02268707" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"22687074"; -- 577269876
        operator2 <= x"90676604"; -- 2422695428
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"02268707" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"00639c7f"; -- 6528127
        operator2 <= x"9bf144db"; -- 2616280283
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"00639c7f"; -- 6528127
        operator2 <= x"9bf144db"; -- 2616280283
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"ad4a4ae5"; -- 2907327205
        operator2 <= x"7c00d901"; -- 2080430337
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"56a52572" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"ad4a4ae5"; -- 2907327205
        operator2 <= x"7c00d901"; -- 2080430337
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"d6a52572" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"0cdbf881"; -- 215742593
        operator2 <= x"9658eb9e"; -- 2522409886
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"0cdbf881"; -- 215742593
        operator2 <= x"9658eb9e"; -- 2522409886
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"5eaad44f"; -- 1588253775
        operator2 <= x"33382663"; -- 859317859
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0bd55a89" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"5eaad44f"; -- 1588253775
        operator2 <= x"33382663"; -- 859317859
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0bd55a89" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"0acefd11"; -- 181337361
        operator2 <= x"f8b00e9e"; -- 4172287646
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"0acefd11"; -- 181337361
        operator2 <= x"f8b00e9e"; -- 4172287646
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"f7a0acf6"; -- 4154502390
        operator2 <= x"764396a0"; -- 1984140960
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"f7a0acf6" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"f7a0acf6"; -- 4154502390
        operator2 <= x"764396a0"; -- 1984140960
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"f7a0acf6" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"70a1dc0f"; -- 1889655823
        operator2 <= x"bc70fd92"; -- 3161521554
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00001c28" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"70a1dc0f"; -- 1889655823
        operator2 <= x"bc70fd92"; -- 3161521554
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00001c28" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"55a61a6f"; -- 1436949103
        operator2 <= x"8f9994b2"; -- 2409206962
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00001569" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"55a61a6f"; -- 1436949103
        operator2 <= x"8f9994b2"; -- 2409206962
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00001569" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"821ea580"; -- 2183046528
        operator2 <= x"33b73d07"; -- 867646727
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"01043d4b" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"821ea580"; -- 2183046528
        operator2 <= x"33b73d07"; -- 867646727
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"ff043d4b" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"8d229099"; -- 2367852697
        operator2 <= x"6ba8d670"; -- 1806227056
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00008d22" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"8d229099"; -- 2367852697
        operator2 <= x"6ba8d670"; -- 1806227056
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"ffff8d22" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"4acddbe6"; -- 1255005158
        operator2 <= x"4a81c2c5"; -- 1250017989
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"02566edf" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"4acddbe6"; -- 1255005158
        operator2 <= x"4a81c2c5"; -- 1250017989
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"02566edf" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"887e030d"; -- 2289959693
        operator2 <= x"f6779e1c"; -- 4135034396
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000008" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"887e030d"; -- 2289959693
        operator2 <= x"f6779e1c"; -- 4135034396
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"fffffff8" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"15e8bf5b"; -- 367574875
        operator2 <= x"62ee8b05"; -- 1659800325
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00af45fa" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"15e8bf5b"; -- 367574875
        operator2 <= x"62ee8b05"; -- 1659800325
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00af45fa" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"6c5dd943"; -- 1818089795
        operator2 <= x"7fdc9243"; -- 2145161795
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0d8bbb28" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"6c5dd943"; -- 1818089795
        operator2 <= x"7fdc9243"; -- 2145161795
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0d8bbb28" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"70eeadf0"; -- 1894690288
        operator2 <= x"0c41c68d"; -- 205637261
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00038775" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"70eeadf0"; -- 1894690288
        operator2 <= x"0c41c68d"; -- 205637261
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00038775" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"bbcee663"; -- 3150898787
        operator2 <= x"564ab0ff"; -- 1447735551
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000001" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"bbcee663"; -- 3150898787
        operator2 <= x"564ab0ff"; -- 1447735551
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"ffffffff" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"5de0909d"; -- 1574998173
        operator2 <= x"055d3e43"; -- 89996867
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0bbc1213" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"5de0909d"; -- 1574998173
        operator2 <= x"055d3e43"; -- 89996867
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0bbc1213" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"117c6a67"; -- 293366375
        operator2 <= x"ee23f735"; -- 3995334453
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0000008b" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"117c6a67"; -- 293366375
        operator2 <= x"ee23f735"; -- 3995334453
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0000008b" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"b634923c"; -- 3056898620
        operator2 <= x"7a84be7a"; -- 2055519866
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0000002d" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"b634923c"; -- 3056898620
        operator2 <= x"7a84be7a"; -- 2055519866
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"ffffffed" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"bab3c7ca"; -- 3132344266
        operator2 <= x"d2bafd7d"; -- 3535469949
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000005" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"bab3c7ca"; -- 3132344266
        operator2 <= x"d2bafd7d"; -- 3535469949
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"fffffffd" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"38029d3a"; -- 939695418
        operator2 <= x"5ade933c"; -- 1524536124
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000003" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"38029d3a"; -- 939695418
        operator2 <= x"5ade933c"; -- 1524536124
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000003" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"c7b38f2b"; -- 3350433579
        operator2 <= x"4b772e81"; -- 1266101889
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"63d9c795" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"c7b38f2b"; -- 3350433579
        operator2 <= x"4b772e81"; -- 1266101889
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"e3d9c795" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"88298d05"; -- 2284424453
        operator2 <= x"141eeb27"; -- 337570599
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0110531a" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"88298d05"; -- 2284424453
        operator2 <= x"141eeb27"; -- 337570599
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"ff10531a" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"e813a60d"; -- 3893601805
        operator2 <= x"dd49ee2b"; -- 3712609835
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"001d0274" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"e813a60d"; -- 3893601805
        operator2 <= x"dd49ee2b"; -- 3712609835
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"fffd0274" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"06fa3858"; -- 117061720
        operator2 <= x"4a2b3cd5"; -- 1244347605
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000037" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"06fa3858"; -- 117061720
        operator2 <= x"4a2b3cd5"; -- 1244347605
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000037" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"fe0514e5"; -- 4261745893
        operator2 <= x"db1b7f1e"; -- 3676012318
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000003" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"fe0514e5"; -- 4261745893
        operator2 <= x"db1b7f1e"; -- 3676012318
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"ffffffff" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"31fc9dce"; -- 838639054
        operator2 <= x"f4ec5a1d"; -- 4109130269
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000001" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"31fc9dce"; -- 838639054
        operator2 <= x"f4ec5a1d"; -- 4109130269
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000001" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"c7d13ae2"; -- 3352378082
        operator2 <= x"2dd37899"; -- 768833689
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000063" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"c7d13ae2"; -- 3352378082
        operator2 <= x"2dd37899"; -- 768833689
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"ffffffe3" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"81c9ecfc"; -- 2177494268
        operator2 <= x"43ae1847"; -- 1135482951
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"010393d9" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"81c9ecfc"; -- 2177494268
        operator2 <= x"43ae1847"; -- 1135482951
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"ff0393d9" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"6efe2e54"; -- 1862151764
        operator2 <= x"82cc5e55"; -- 2194431573
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000377" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"6efe2e54"; -- 1862151764
        operator2 <= x"82cc5e55"; -- 2194431573
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000377" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"43e8e18a"; -- 1139335562
        operator2 <= x"8b744caf"; -- 2339654831
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"000087d1" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"43e8e18a"; -- 1139335562
        operator2 <= x"8b744caf"; -- 2339654831
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"000087d1" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"43706f56"; -- 1131442006
        operator2 <= x"0b7b607d"; -- 192635005
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000002" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"43706f56"; -- 1131442006
        operator2 <= x"0b7b607d"; -- 192635005
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000002" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"b8283b32"; -- 3089644338
        operator2 <= x"43f8d670"; -- 1140381296
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0000b828" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"b8283b32"; -- 3089644338
        operator2 <= x"43f8d670"; -- 1140381296
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"ffffb828" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"822384d4"; -- 2183365844
        operator2 <= x"a47bd430"; -- 2759578672
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00008223" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"822384d4"; -- 2183365844
        operator2 <= x"a47bd430"; -- 2759578672
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"ffff8223" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"d21a374c"; -- 3524933452
        operator2 <= x"41b2fea9"; -- 1102249641
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00690d1b" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"d21a374c"; -- 3524933452
        operator2 <= x"41b2fea9"; -- 1102249641
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"ffe90d1b" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"540132ab"; -- 1409364651
        operator2 <= x"3a32c50f"; -- 976405775
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0000a802" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"540132ab"; -- 1409364651
        operator2 <= x"3a32c50f"; -- 976405775
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0000a802" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"4dff6fe8"; -- 1308585960
        operator2 <= x"2e2fd263"; -- 774885987
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"09bfedfd" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"4dff6fe8"; -- 1308585960
        operator2 <= x"2e2fd263"; -- 774885987
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"09bfedfd" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"455a1e1d"; -- 1163533853
        operator2 <= x"ab830862"; -- 2877491298
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"11568787" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"455a1e1d"; -- 1163533853
        operator2 <= x"ab830862"; -- 2877491298
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"11568787" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"268449de"; -- 646203870
        operator2 <= x"a1f2e2eb"; -- 2717049579
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0004d089" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"268449de"; -- 646203870
        operator2 <= x"a1f2e2eb"; -- 2717049579
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0004d089" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"3185fde2"; -- 830864866
        operator2 <= x"37ae2218"; -- 934158872
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000031" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"3185fde2"; -- 830864866
        operator2 <= x"37ae2218"; -- 934158872
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000031" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"33972779"; -- 865544057
        operator2 <= x"f4b613eb"; -- 4105573355
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"000672e4" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"33972779"; -- 865544057
        operator2 <= x"f4b613eb"; -- 4105573355
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"000672e4" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"04b40309"; -- 78906121
        operator2 <= x"0f456118"; -- 256205080
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000004" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"04b40309"; -- 78906121
        operator2 <= x"0f456118"; -- 256205080
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000004" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"2a5fb270"; -- 710914672
        operator2 <= x"d11516eb"; -- 3507820267
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00054bf6" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"2a5fb270"; -- 710914672
        operator2 <= x"d11516eb"; -- 3507820267
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00054bf6" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"b65a6123"; -- 3059376419
        operator2 <= x"05a9abf8"; -- 95005688
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"000000b6" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"b65a6123"; -- 3059376419
        operator2 <= x"05a9abf8"; -- 95005688
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"ffffffb6" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"0d3334e3"; -- 221459683
        operator2 <= x"c583f956"; -- 3313760598
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000034" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"0d3334e3"; -- 221459683
        operator2 <= x"c583f956"; -- 3313760598
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000034" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"30e39116"; -- 820220182
        operator2 <= x"cdd1a4cf"; -- 3453068495
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"000061c7" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"30e39116"; -- 820220182
        operator2 <= x"cdd1a4cf"; -- 3453068495
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"000061c7" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"6c05a77d"; -- 1812309885
        operator2 <= x"3eba6451"; -- 1052402769
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00003602" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"6c05a77d"; -- 1812309885
        operator2 <= x"3eba6451"; -- 1052402769
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00003602" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"65ff4276"; -- 1711227510
        operator2 <= x"bb6fb3ea"; -- 3144659946
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00197fd0" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"65ff4276"; -- 1711227510
        operator2 <= x"bb6fb3ea"; -- 3144659946
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00197fd0" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"3e3c9b8a"; -- 1044159370
        operator2 <= x"1ac04a49"; -- 448809545
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"001f1e4d" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"3e3c9b8a"; -- 1044159370
        operator2 <= x"1ac04a49"; -- 448809545
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"001f1e4d" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"e324ee81"; -- 3810848385
        operator2 <= x"a4bf9542"; -- 2764019010
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"38c93ba0" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"e324ee81"; -- 3810848385
        operator2 <= x"a4bf9542"; -- 2764019010
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"f8c93ba0" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"0b851744"; -- 193271620
        operator2 <= x"582ccc4a"; -- 1479330890
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0002e145" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"0b851744"; -- 193271620
        operator2 <= x"582ccc4a"; -- 1479330890
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0002e145" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"a383e180"; -- 2743329152
        operator2 <= x"1e1f4195"; -- 505364885
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0000051c" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"a383e180"; -- 2743329152
        operator2 <= x"1e1f4195"; -- 505364885
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"fffffd1c" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"3fcea797"; -- 1070507927
        operator2 <= x"d2781e28"; -- 3531087400
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"003fcea7" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"3fcea797"; -- 1070507927
        operator2 <= x"d2781e28"; -- 3531087400
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"003fcea7" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"ce9481a7"; -- 3465839015
        operator2 <= x"56c4ef59"; -- 1455746905
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000067" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"ce9481a7"; -- 3465839015
        operator2 <= x"56c4ef59"; -- 1455746905
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"ffffffe7" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"204d7942"; -- 541948226
        operator2 <= x"b6c1569b"; -- 3066123931
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000004" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"204d7942"; -- 541948226
        operator2 <= x"b6c1569b"; -- 3066123931
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000004" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"7bb59caf"; -- 2075499695
        operator2 <= x"0b7d13fa"; -- 192746490
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0000001e" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"7bb59caf"; -- 2075499695
        operator2 <= x"0b7d13fa"; -- 192746490
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0000001e" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"794d487a"; -- 2035107962
        operator2 <= x"ee076856"; -- 3993462870
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"000001e5" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"794d487a"; -- 2035107962
        operator2 <= x"ee076856"; -- 3993462870
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"000001e5" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"232088a7"; -- 589334695
        operator2 <= x"88206283"; -- 2283823747
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"04641114" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"232088a7"; -- 589334695
        operator2 <= x"88206283"; -- 2283823747
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"04641114" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"590790e7"; -- 1493668071
        operator2 <= x"22706816"; -- 577792022
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000164" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"590790e7"; -- 1493668071
        operator2 <= x"22706816"; -- 577792022
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000164" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"bd50e618"; -- 3176195608
        operator2 <= x"e299828d"; -- 3801711245
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0005ea87" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"bd50e618"; -- 3176195608
        operator2 <= x"e299828d"; -- 3801711245
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"fffdea87" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"55905a79"; -- 1435523705
        operator2 <= x"cae33088"; -- 3403886728
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0055905a" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"55905a79"; -- 1435523705
        operator2 <= x"cae33088"; -- 3403886728
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0055905a" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"93462083"; -- 2470846595
        operator2 <= x"3fdd5a4f"; -- 1071471183
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0001268c" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"93462083"; -- 2470846595
        operator2 <= x"3fdd5a4f"; -- 1071471183
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"ffff268c" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"5e12aff4"; -- 1578282996
        operator2 <= x"f23a9c7c"; -- 4063927420
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000005" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"5e12aff4"; -- 1578282996
        operator2 <= x"f23a9c7c"; -- 4063927420
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000005" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"29ab78e3"; -- 699103459
        operator2 <= x"5f048b98"; -- 1594133400
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000029" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"29ab78e3"; -- 699103459
        operator2 <= x"5f048b98"; -- 1594133400
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000029" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"2f05115b"; -- 788861275
        operator2 <= x"9c53e8ef"; -- 2622744815
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00005e0a" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"2f05115b"; -- 788861275
        operator2 <= x"9c53e8ef"; -- 2622744815
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00005e0a" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"da5b3e06"; -- 3663412742
        operator2 <= x"4604fe39"; -- 1174732345
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0000006d" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"da5b3e06"; -- 3663412742
        operator2 <= x"4604fe39"; -- 1174732345
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"ffffffed" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"aba458b8"; -- 2879674552
        operator2 <= x"8ec55524"; -- 2395297060
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0aba458b" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"aba458b8"; -- 2879674552
        operator2 <= x"8ec55524"; -- 2395297060
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"faba458b" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"1f4b922e"; -- 525046318
        operator2 <= x"5dcfe13f"; -- 1573904703
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"1f4b922e"; -- 525046318
        operator2 <= x"5dcfe13f"; -- 1573904703
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"00000000" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"70c983b7"; -- 1892254647
        operator2 <= x"775723ae"; -- 2002199470
        ALUOp <= "111";
        arith_logic_b <= '0';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0001c326" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        operator1 <= x"70c983b7"; -- 1892254647
        operator2 <= x"775723ae"; -- 2002199470
        ALUOp <= "111";
        arith_logic_b <= '1';
        signed_unsigned_b <= '0';
        wait for 2 ns;
        if result /= x"0001c326" then
            bad_checks := bad_checks + 1;
        else
            good_checks := good_checks + 1;
        end if;
        wait for 2 ns;

        report "DISCH_GRADING (good, bad, total): " & integer'image(good_checks) & " " & integer'image(bad_checks) & " " & integer'image(good_checks + bad_checks) & "" severity note;

        wait;
    end process;

    DUT: component alu port map(
        operator1 => operator1,
        operator2 => operator2,
        ALUOp => ALUOp,
        arith_logic_b => arith_logic_b,
        signed_unsigned_b => signed_unsigned_b,
        result => result,
        zero => zero,
        equal => equal,
        carryOut => carryOut,
        x_lt_y_u => x_lt_y_u,
        x_lt_y_s => x_lt_y_s
    );

end Behavioural;
