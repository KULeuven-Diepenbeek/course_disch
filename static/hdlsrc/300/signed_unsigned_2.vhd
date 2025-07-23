library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity test
...
end entity test;

architecture Behavioural of  is
    signal data : STD_LOGIC(7 downto 0);
    signal data_u : unsigned(7 downto 0);
    signal data_s : signed(7 downto 0);
    signal data_new_u: STD_LOGIC(7 downto 0);
    signal data_new_s: STD_LOGIC(7 downto 0);
begin
    data_u <= unsigned(data);
    data_s <= signed(data);

    data_new_u <= std_logic_vector(data_u);
    data_new_s <= std_logic_vector(data_s); 
end Behavioural;