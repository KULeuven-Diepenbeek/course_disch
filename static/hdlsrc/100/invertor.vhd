library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity invertor is
    Port (
        A: in std_logic;
        Z: out std_logic
    );
end invertor;

architecture Behavioral of invertor is
begin

    Z <= NOT A;

end Behavioral;