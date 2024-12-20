library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity generate_example is
  Port (A_vector: in std_logic_vector(7 downto 0);
        Y_vector: out std_logic_vector(7 downto 0));
end generate_example;

architecture Behavioral of generate_example is

begin

  GEN : for i in 0 to 6 generate
    Y_vector(i) <= A_vector(i) AND A_vector(i+1);
  end generate;

  Y_vector(7) => '0';
    
end Behavioral;