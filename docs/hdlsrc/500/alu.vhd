entity alu is
    port(
        operand1 : in std_logic_vector(31 downto 0);
        operand2 : in std_logic_vector(31 downto 0);
        ALUOp : in std_logic_vector(2 downto 0);
        arith_logic_b : in STD_LOGIC;
        signed_unsigned_b : in STD_LOGIC;
        result : out std_logic_vector(31 downto 0);
        equal : out std_logic;
        x_lt_y_u : out std_logic;
        x_lt_y_s : out std_logic
    );
end entity alu;