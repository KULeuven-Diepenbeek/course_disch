--------------------------------------------------------------------------------
-- KU Leuven - ESAT/COSIC - Emerging technologies, Systems & Security
--------------------------------------------------------------------------------
-- Module Name:     control - Behavioural
-- Project Name:    control
-- Description:     
--
-- Revision     Date       Author     Comments
-- v0.1         20250804   VlJo       Initial version
--
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.NUMERIC_STD.ALL;

entity control is
    port(
        inst : in STD_LOGIC_VECTOR(31 downto 0);
        alu_equal : in STD_LOGIC;
        alu_x_lt_y_s : in STD_LOGIC;
        alu_x_lt_y_u : in STD_LOGIC;

        abs_rel_b: out std_logic;
        immediate_four_b: out std_logic;
        immediate : out std_logic_vector(31 downto 0);

        regfile_we : out STD_LOGIC;
        alu_op : out STD_LOGIC_VECTOR(2 downto 0);
        alu_arith_logic_b : out STD_LOGIC;
        alu_signed_unsigned_b : out STD_LOGIC;
        second_operand_selector : out STD_LOGIC
    );
end entity control;

architecture Behavioural of control is

    -- (DE-)LOCALISING IN/OUTPUTS
    signal inst_i : STD_LOGIC_VECTOR(31 downto 0);

    signal alu_equal_i : STD_LOGIC;
    signal alu_x_lt_y_s_i : STD_LOGIC;
    signal alu_x_lt_y_u_i : STD_LOGIC;


    signal abs_rel_b_o : std_logic;
    signal immediate_four_b_o : std_logic;
    signal rs1_o : std_logic_vector(31 downto 0);
    signal immediate_o : std_logic_vector(31 downto 0);

    signal regfile_we_o : STD_LOGIC;
    signal alu_op_o : STD_LOGIC_VECTOR(2 downto 0);
    signal alu_arith_logic_b_o : STD_LOGIC;
    signal alu_signed_unsigned_b_o : STD_LOGIC;
    signal second_operand_selector_o : STD_LOGIC;
    
    -- Instruction decoding
    signal funct7 : STD_LOGIC_VECTOR(6 downto 0);
    signal imm : STD_LOGIC_VECTOR(11 downto 0);
    signal funct3 : STD_LOGIC_VECTOR(2 downto 0);
    signal rs1, rs2, rd : STD_LOGIC_VECTOR(4 downto 0);
    signal opcode : STD_LOGIC_VECTOR(6 downto 0);

    -- Classification
    signal r_instr : STD_LOGIC;
    signal b_instr : STD_LOGIC;
    signal i_instr_alu : STD_LOGIC;
    signal i_instr_jump : STD_LOGIC;
    signal j_instr : STD_LOGIC;


    signal prepadding_Itype : STD_LOGIC_VECTOR(19 downto 0);
    signal immediate_Itype : STD_LOGIC_VECTOR(31 downto 0);
    signal prepadding_Btype : STD_LOGIC_VECTOR(19 downto 0);
    signal immediate_Btype : STD_LOGIC_VECTOR(31 downto 0);
    
    signal conditional_jump : STD_LOGIC;


begin

    -------------------------------------------------------------------------------
    -- (DE-)LOCALISING IN/OUTPUTS
    -------------------------------------------------------------------------------
    inst_i <= inst;
    alu_equal_i <= alu_equal;
    alu_x_lt_y_s_i <= alu_x_lt_y_s;
    alu_x_lt_y_u_i <= alu_x_lt_y_u;

    abs_rel_b <= abs_rel_b_o;
    immediate_four_b <= immediate_four_b_o;
    immediate <= immediate_o;

    regfile_we <= regfile_we_o;
    alu_op <= alu_op_o;
    alu_arith_logic_b <= alu_arith_logic_b_o;
    alu_signed_unsigned_b <= alu_signed_unsigned_b_o;
    second_operand_selector <= second_operand_selector_o;
    

    -------------------------------------------------------------------------------
    -- Instruction decoding
    -------------------------------------------------------------------------------
    funct7 <= inst_i(31 downto 25);
    rs2 <= inst_i(24 downto 20);
    imm <= inst_i(31 downto 20);
    rs1 <= inst_i(19 downto 15);
    funct3 <= inst_i(14 downto 12);
    rd <= inst_i(11 downto 7);
    opcode <= inst_i(6 downto 0);


    -------------------------------------------------------------------------------
    -- Classification
    -------------------------------------------------------------------------------
    r_instr <= '1' when opcode = "0110011" else '0';
    i_instr_alu <= '1' when opcode = "0010011" else '0';
    b_instr <= '1' when opcode = "1100011" else '0';
    j_instr <= '1' when opcode = "1101111" else '0';
    i_instr_jump <= '1' when opcode = "1100111" else '0';


    second_operand_selector_o <= i_instr_alu;


    -------------------------------------------------------------------------------
    -- Next PC
    -------------------------------------------------------------------------------
    abs_rel_b_o <= i_instr_jump;
    immediate_four_b_o <= (b_instr and conditional_jump) or j_instr or i_instr_jump;

    prepadding_Itype <= (others => inst_i(inst_i'high));
    immediate_Itype <= prepadding_Itype & imm;

    prepadding_Btype <= (others => inst_i(inst_i'high));
    immediate_Btype <= prepadding_Btype & inst_i(7) & inst_i(30 downto 25) & inst_i(11 downto 8) & '0';

    PMUX_immediate: process(b_instr, immediate_Btype, i_instr_alu, immediate_Itype)
    begin
        if b_instr = '1' then 
            immediate_o <= immediate_Btype;
        elsif i_instr_alu = '1' then
            immediate_o <= immediate_Itype;
        else
            immediate_o <= (others => '0');
        end if;
    end process;


    PMUX_B: process(funct3, alu_equal_i, alu_x_lt_y_s_i, alu_x_lt_y_u_i)
    begin
        case funct3 is 
            when "000" =>  conditional_jump <= alu_equal_i;
            when "001" =>  conditional_jump <= not(alu_equal_i);
            when "100" =>  conditional_jump <= alu_x_lt_y_s_i;
            when "101" =>  conditional_jump <= not(alu_x_lt_y_s_i);
            when "110" =>  conditional_jump <= alu_x_lt_y_u_i;
            when "111" =>  conditional_jump <= not(alu_x_lt_y_u_i);
            when others => conditional_jump <= '0';
        end case;
    end process;


    regfile_we_o <= (r_instr or i_instr_alu) and not(b_instr);

    PMUX_R_I: process(funct3, funct7)
    begin
        alu_arith_logic_b_o <= '0';
        alu_signed_unsigned_b_o <= '1';
        case funct3 is
            when "000" => 
                if funct7 = "0100000" then 
                    alu_op_o <= "101";  -- sub R-type and I-alu-type
                else
                    alu_op_o <= "100";  -- add R-type and I-alu-type
                end if;
            when "100" => 
                alu_op_o <= "010";      -- xor R-type and I-alu-type
            when "110" => 
                alu_op_o <= "001";      -- or R-type and I-alu-type
            when "111" => 
                alu_op_o <= "000";      -- and R-type and I-alu-type
            when "001" => 
                alu_op_o <= "110";      -- sll R-type and I-alu-type
            when "101" => 
                alu_op_o <= "111";      -- srx R-type and I-alu-type
                if funct7 = "0100000" then 
                    alu_arith_logic_b_o <= '1';
                end if;
            when "010" => 
                alu_op_o <= "011";      -- slt R-type and I-alu-type
            when "011" => 
                alu_op_o <= "011";      -- sltu R-type and I-alu-type
                alu_signed_unsigned_b_o <= '0';
            when others =>
                alu_op_o <= "100";      -- add, as default
        end case;
    end process PMUX_R_I;

end Behavioural;
