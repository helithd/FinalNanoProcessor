LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Master_nano_processor IS
    PORT (
        Clk : IN STD_LOGIC;
        Res : IN STD_LOGIC;
        Halt : IN STD_LOGIC;
        Zero : OUT STD_LOGIC;
        Overflow : OUT STD_LOGIC;
        S_LED : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        S_7Seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
        Anode : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
    );

END Master_nano_processor;

ARCHITECTURE Behavioral OF Master_nano_processor IS
    COMPONENT Nano_processor
        PORT (
            Clk : IN STD_LOGIC;
            Res : IN STD_LOGIC;
            Zero : OUT STD_LOGIC;
            Overflow : OUT STD_LOGIC;
            OUT_REG : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT Slow_Clk IS
        PORT (
            Clk_in : IN STD_LOGIC;
            Clk_out : OUT STD_LOGIC
        );
    END COMPONENT;
    
    component LUT_16_7
        Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
        

    SIGNAL slowClk : STD_LOGIC;
    SIGNAL address : STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN

    Clock_0 : Slow_Clk
    PORT MAP(
        Clk_in => Clk,
        Clk_out => slowClk
    );

    Nano_processor_0 : Nano_processor
    PORT MAP(
        Clk => slowClk,
        Res => Res,
        Zero => Zero,
        Overflow => Overflow,
        OUT_REG => address
    );
    
    Anode <= "1110";
    S_LED <= address;
END Behavioral;