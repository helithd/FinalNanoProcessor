----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2023 01:08:11 AM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY Mux_8_to_1 IS
    PORT (
        S : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        D : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        EN : IN STD_LOGIC;
        Y : OUT STD_LOGIC);
END Mux_8_to_1;

ARCHITECTURE Behavioral OF Mux_8_to_1 IS

    COMPONENT Decoder_3_to_8
        PORT (
            I : IN STD_LOGIC_VECTOR;
            EN : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR);
    END COMPONENT;

    SIGNAL Y0 : STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN

    Decoder_3_to_8_0 : Decoder_3_to_8
    PORT MAP(
        I => S,
        EN => EN,
        Y => Y0
    );

    Y <= (Y0(0) AND D(0))
        OR (Y0(1) AND D(1))
        OR (Y0(2) AND D(2))
        OR (Y0(3) AND D(3))
        OR (Y0(4) AND D(4))
        OR (Y0(5) AND D(5))
        OR (Y0(6) AND D(6))
        OR (Y0(7) AND D(7));

END Behavioral;