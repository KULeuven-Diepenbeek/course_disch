entity alu is
    port(
        operator1 : in std_logic_vector(C_WIDTH-1 downto 0);
        operator2 : in std_logic_vector(C_WIDTH-1 downto 0);
        ALUOp : in std_logic_vector(2 downto 0);
        arith_logic_b : in STD_LOGIC;
        signed_unsigned_b : in STD_LOGIC;
        result : out std_logic_vector(C_WIDTH-1 downto 0);
        zero : out std_logic;
        equal : out std_logic;
        carryOut : out std_logic;
        x_lt_y_u : out std_logic;
        x_lt_y_s : out std_logic
    );
end entity alu;