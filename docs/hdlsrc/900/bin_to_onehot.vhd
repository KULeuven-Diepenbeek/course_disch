library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bin_to_onehot is
    port(
        binair: in std_logic_vector(2 downto 0);
        decimaal: out std_logic_vector(0 to 7)
    );
end bin_to_onehot;

architecture arch of bin_to_onehot is

    signal binair_i: std_logic_vector(2 downto 0);
    signal decimaal_i: std_logic_vector(0 to 7);

begin
    binair_i <= binair;
    decimaal <= decimaal_i;

    p: process(binair_i)
    begin
        case binair_i is
            when "000"  => decimaal_i <= "10000000" ;
            when "001"  => decimaal_i <= "01000000" ;
            when "010"  => decimaal_i <= "00100000" ;
            when "011"  => decimaal_i <= "00010000" ;
            when "100"  => decimaal_i <= "00001000" ;
            when "101"  => decimaal_i <= "00000100" ;
            when "110"  => decimaal_i <= "00000010" ;
            when others => decimaal_i <= "00000001" ;
        end case;
    end process;
end arch;