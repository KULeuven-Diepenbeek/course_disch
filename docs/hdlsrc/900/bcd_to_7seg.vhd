library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd_to_7seg is
    port(   
        bcd: in std_logic_vector(3 downto 0);
        seg7: out std_logic_vector(1 to 7)
    );
end bcd_to_7seg;

architecture arch of bin_to_7seg is
    signal bcd_i: std_logic_vector(3 downto 0);
    signal seg7_i: std_logic_vector(1 to 7));
begin

    bcd_i <= bcd;
    seg7 <= seg7_i;

    p: process(bcd_i)
    begin
        case bcd_i is
            when "0000"  => seg7_i <= "1111110" ;
            when "0001"  => seg7_i <= "0110000" ;
            when "0010"  => seg7_i <= "1101101" ;
            when "0011"  => seg7_i <= "1111001" ;
            when "0100"  => seg7_i <= "0110011" ;
            when "0101"  => seg7_i <= "1011011" ;
            when "0110"  => seg7_i <= "1011111" ;
            when "0111"  => seg7_i <= "1110000" ;
            when "1000"  => seg7_i <= "1111111" ;
            when "1001"  => seg7_i <= "1111011" ;
            when others => seg7_i <= "-------" ;
        end case;
    end process;
end arch;