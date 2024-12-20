--------------------------------------------------------------------------------
-- KU Leuven - ESAT/COSIC - Emerging technologies, Systems & Security
--------------------------------------------------------------------------------
-- Module Name:     nbit_and - Behavioural
-- Project Name:    Digitale eletronische schakelingen
-- Description:     n-bit AND poort ter illustratie van het gebruik van generics
--
-- Revision     Date       Author     Comments
-- v0.1         20240119   VlJo       Initial version
--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nbit_and is
    Generic(
        G_WIDTH : integer := 8
    );
    Port (
        A_vector: in std_logic_vector(G_WIDTH-1 downto 0);
        B_vector: in std_logic_vector(G_WIDTH-1 downto 0);
        Z_vector: out std_logic_vector(G_WIDTH-1 downto 0)
    );
end nbit_and;

architecture Behavioral of nbit_and is

    -- (DE-)LOCALISING IN/OUTPUTS
    signal A_vector_i : std_logic_vector(G_WIDTH-1 downto 0);
    signal B_vector_i : std_logic_vector(G_WIDTH-1 downto 0);
    signal Z_vector_o : std_logic_vector(G_WIDTH-1 downto 0);

begin
    --------------------------------
    -- (DE-)LOCALISING IN/OUTPUTS
    --------------------------------
    A_vector_i <= A_vector;
    B_vector_i <= B_vector;
    Z_vector <= Z_vector_o;

    --------------------------------
    -- COMBINATORIAL
    --------------------------------
    Z_vector_o <= A_vector_i AND B_vector_i;

end Behavioral;