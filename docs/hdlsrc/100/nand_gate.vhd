--------------------------------
-- Revision     Date       Author     Comments
-- v0.2         20240118   VlJo       Initial version
--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nand_gate is
    Port (
        A : in std_logic; 
        B : in std_logic;
        Z : out std_logic
    );
end nand_gate;

architecture Behavioral of nand_gate is

    -- (DE-)LOCALISING IN/OUTPUTS
    signal A_i : STD_LOGIC;
    signal B_i : STD_LOGIC;
    signal Z_i : STD_LOGIC;

begin

    --------------------------------
    -- (DE-)LOCALISING IN/OUTPUTS
    --------------------------------
    A_i <= A;
    B_i <= B;
    Z <= Z_i;

    --------------------------------
    -- COMBINATORIAL
    --------------------------------
    Z_i <= A_i nand B_i;

end Behavioral;