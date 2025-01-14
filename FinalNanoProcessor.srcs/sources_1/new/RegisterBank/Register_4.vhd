LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Register_4 IS
    PORT (
        D : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        En : IN STD_LOGIC;
        Clk : IN STD_LOGIC;
        Res : IN STD_LOGIC;
        Q : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END Register_4;

ARCHITECTURE Behavioral OF Register_4 IS

BEGIN

    PROCESS (Clk, Res) BEGIN
        IF (Res = '1') THEN
            Q <= "0000";
        ELSIF (rising_edge(Clk)) THEN
            IF (En = '1') THEN
                Q <= D;
            END IF;
        END IF;
    END PROCESS;

END Behavioral;