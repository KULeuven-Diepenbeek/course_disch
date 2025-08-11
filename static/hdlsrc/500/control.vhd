--------------------------------------------------------------------------------
-- KU Leuven - ESAT/COSIC - Emerging technologies, Systems & Security
--------------------------------------------------------------------------------
-- Module Name:     control - Behavioural
-- Project Name:    DISCH
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

        immediate : out STD_LOGIC_VECTOR(31 downto 0);
        pc_load : out STD_LOGIC;
        pc_inc : out STD_LOGIC;
        pc_in : out STD_LOGIC_VECTOR(31 downto 0);
        regfile_we : out STD_LOGIC;
        alu_op : out STD_LOGIC_VECTOR(2 downto 0);
        alu_arith_logic_b : out STD_LOGIC;
        alu_signed_unsigned_b : out STD_LOGIC;
        r_instr : out STD_LOGIC
    );
end entity control;

architecture Behavioural of control is

    -- (DE-)LOCALISING IN/OUTPUTS
    signal inst_i : STD_LOGIC_VECTOR(31 downto 0);
    signal immediate_o : STD_LOGIC_VECTOR(31 downto 0);
    signal pc_load_o : STD_LOGIC;
    signal pc_inc_o : STD_LOGIC;
    signal pc_in_o : STD_LOGIC_VECTOR(31 downto 0);
    signal regfile_we_o : STD_LOGIC;
    signal alu_op_o : STD_LOGIC_VECTOR(2 downto 0);
    signal alu_arith_logic_b_o : STD_LOGIC;
    signal alu_signed_unsigned_b_o : STD_LOGIC;
    signal r_instr_o : STD_LOGIC;
    
    signal prepadding_Itype : STD_LOGIC_VECTOR(19 downto 0);
    signal immediate_Itype : STD_LOGIC_VECTOR(31 downto 0);
    
    signal i_instr_alu : STD_LOGIC;

        --instruction decoding
    signal funct7 : STD_LOGIC_VECTOR(6 downto 0);
    signal imm : STD_LOGIC_VECTOR(11 downto 0);
    signal funct3 : STD_LOGIC_VECTOR(2 downto 0);
    signal rs1, rs2, rd : STD_LOGIC_VECTOR(4 downto 0);
    signal opcode : STD_LOGIC_VECTOR(6 downto 0);

begin

    -------------------------------------------------------------------------------
    -- (DE-)LOCALISING IN/OUTPUTS
    -------------------------------------------------------------------------------
    inst_i <= inst;
    immediate <= immediate_o;
    pc_load <= pc_load_o;
    pc_inc <= pc_inc_o;
    pc_in <= pc_in_o;
    regfile_we <= regfile_we_o;
    alu_op <= alu_op_o;
    alu_arith_logic_b <= alu_arith_logic_b_o;
    alu_signed_unsigned_b <= alu_signed_unsigned_b_o;
    r_instr <= r_instr_o;




    immediate_o <= immediate_Itype;
    pc_load_o <= '0';
    pc_inc_o <= '1';
    pc_in_o <= (others => '0');

    prepadding_Itype <= (others => inst_i(inst_i'high));
    immediate_Itype <= prepadding_Itype & imm;

    funct7 <= inst_i(31 downto 25);
    rs2 <= inst_i(24 downto 20);
    imm <= inst_i(31 downto 20);
    rs1 <= inst_i(19 downto 15);
    funct3 <= inst_i(14 downto 12);
    rd <= inst_i(11 downto 7);
    opcode <= inst_i(6 downto 0);

    r_instr_o <= '1' when opcode = "0110011" else '0';
    i_instr_alu <= '1' when opcode = "0010011" else '0';

    regfile_we_o <= r_instr_o or i_instr_alu;

    PMUX2: process(funct3, funct7)
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
                alu_op_o <= "110";      -- srx R-type and I-alu-type
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
    end process PMUX2;

end Behavioural;
