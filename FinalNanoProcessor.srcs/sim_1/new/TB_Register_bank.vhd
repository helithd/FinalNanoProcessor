LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY TB_Reg_Bank IS
END TB_Reg_Bank;

ARCHITECTURE Behavioral OF TB_Reg_Bank IS
    COMPONENT Register_Bank PORT (
        Reg_En : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        Clk : IN STD_LOGIC;
        A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        Reg_Bank_En : IN STD_LOGIC;
        Reset_Register_bank : IN STD_LOGIC;
        B0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        B1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        B2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        B3 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        B4 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        B5 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        B6 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        B7 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL Reg_En : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL Clk : STD_LOGIC := '0';
    SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL Reset_Register_bank : STD_LOGIC;
    SIGNAL B0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL B1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL B2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL B3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL B4 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL B5 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL B6 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL B7 : STD_LOGIC_VECTOR(3 DOWNTO 0);

    CONSTANT CLK_CYCLE : TIME := 10ns;

BEGIN
    UUT : Register_Bank PORT MAP(
        Reg_En => Reg_En,
        Clk => Clk,
        A => A,
        Reset_Register_bank => Reset_Register_bank,
        B0 => B0,
        B1 => B1,
        B2 => B2,
        B3 => B3,
        B4 => B4,
        B5 => B5,
        B6 => B6,
        B7 => B7
    );
    Clk <= NOT Clk AFTER CLK_CYCLE / 2;

    PROCESS
        --INDEX NO => 11 0011 0101 1011 1010
    BEGIN
        Reg_En <= "001";
        A <= "1010";
        Reset_Register_bank <= '0';
        WAIT FOR CLK_CYCLE;

        Reg_En <= "001";
        A <= "1011";
        Reset_Register_bank <= '1';
        WAIT FOR CLK_CYCLE;

        Reg_En <= "010";
        A <= "0101";
        Reset_Register_bank <= '0';
        WAIT FOR CLK_CYCLE;

        Reg_En <= "011";
        A <= "0011";
        Reset_Register_bank <= '0';
        WAIT FOR CLK_CYCLE;

        Reg_En <= "100";
        A <= "1010";
        Reset_Register_bank <= '0';
        WAIT FOR CLK_CYCLE;

        Reg_En <= "110";
        A <= "1010";
        Reset_Register_bank <= '0';
        WAIT FOR CLK_CYCLE;
        
        Reg_En <= "111";
        A <= "1010";
        Reset_Register_bank <= '0';
        WAIT FOR CLK_CYCLE;

        Reset_Register_bank <= '1';
        WAIT FOR CLK_CYCLE;
    END PROCESS;
END Behavioral;