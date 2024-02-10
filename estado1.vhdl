LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY carta_asm_2 IS
    PORT (
        RELOJ : IN STD_LOGIC;
        RESET : IN STD_LOGIC;
        S : IN STD_LOGIC_VECTOR (1 DOWNTO 0); --DONDE EL BIT MAS SIGNIFICATIVO
        ES SI Y EL MENOS EL SD
        atras : OUT STD_LOGIC;
        adelante : OUT STD_LOGIC;
        giro_der : OUT STD_LOGIC;
        giro_izq : OUT STD_LOGIC;
        out_epresente : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END carta_asm_2;
ARCHITECTURE Behavioral OF carta_asm_2 IS
    SIGNAL esiguiente : STD_LOGIC_VECTOR (3 DOWNTO 0) := B"0000";
    CONSTANT s0 : STD_LOGIC_VECTOR(3 DOWNTO 0) := X"0";
    CONSTANT s1 : STD_LOGIC_VECTOR(3 DOWNTO 0) := X"1";
    CONSTANT s2 : STD_LOGIC_VECTOR(3 DOWNTO 0) := X"2";
    CONSTANT s3 : STD_LOGIC_VECTOR(3 DOWNTO 0) := X"3";
    CONSTANT s4 : STD_LOGIC_VECTOR(3 DOWNTO 0) := X"4";
    CONSTANT s5 : STD_LOGIC_VECTOR(3 DOWNTO 0) := X"5";
    CONSTANT s6 : STD_LOGIC_VECTOR(3 DOWNTO 0) := X"6";
    CONSTANT s7 : STD_LOGIC_VECTOR(3 DOWNTO 0) := X"7";
    CONSTANT s8 : STD_LOGIC_VECTOR(3 DOWNTO 0) := X"8";
    CONSTANT s9 : STD_LOGIC_VECTOR(3 DOWNTO 0) := X"9";
    CONSTANT s10 : STD_LOGIC_VECTOR(3 DOWNTO 0) := X"A";
    CONSTANT s11 : STD_LOGIC_VECTOR(3 DOWNTO 0) := X"B";
BEGIN
    PROCESS (RELOJ, reset, esiguiente, S)
    BEGIN
        IF reset = '0' THEN
            esiguiente <= s0;
        ELSIF rising_edge (RELOJ) THEN
            CASE esiguiente IS
                WHEN s0 => atras <= '0';
                    giro_izq <= '0';
                    giro_der <= '0';
                    IF S = X"0" THEN
                        adelante <= '1';
                        esiguiente <= s0;
                    ELSIF S = X"1" THEN
                        esiguiente <= s1;
                        adelante <= '0';
                    ELSIF S = X"2" THEN
                        esiguiente <= s3;
                        adelante <= '0';
                    ELSIF S = X"3" THEN
                        esiguiente <= s5;
                        adelante <= '0';
                    END IF;
                WHEN s1 =>
                    adelante <= '0';
                    atras <= '1';
                    giro_izq <= '0';
                    giro_der <= '0';
                    esiguiente <= s2;
                WHEN s2 =>
                    adelante <= '0';
                    atras <= '0';
                    giro_izq <= '1';
                    giro_der <= '0';
                    esiguiente <= s0;
                WHEN s3 =>
                    adelante <= '0';
                    atras <= '1';
                    giro_izq <= '0';
                    giro_der <= '0';
                    esiguiente <= s4;
                WHEN s4 =>
                    adelante <= '0';
                    atras <= '0';
                    giro_izq <= '0';
                    giro_der <= '1';
                    esiguiente <= s0;
                WHEN s5 =>
                    adelante <= '0';
                    atras <= '1';
                    giro_izq <= '0';
                    giro_der <= '0';
                    esiguiente <= s6;
                WHEN s6 =>
                    adelante <= '0';
                    atras <= '0';
                    giro_izq <= '1';
                    giro_der <= '0';
                    esiguiente <= s7;
                WHEN s7 =>
                    adelante <= '0';
                    atras <= '0';
                    giro_izq <= '1';
                    giro_der <= '0';
                    esiguiente <= s8;
                WHEN s8 =>
                    adelante <= '1';
                    atras <= '0';
                    giro_izq <= '0';
                    giro_der <= '0';
                    esiguiente <= s9;
                WHEN s9 =>
                    adelante <= '1';
                    atras <= '0';
                    giro_izq <= '0';
                    giro_der <= '0';
                    esiguiente <= s10;
                WHEN s10 =>
                    adelante <= '0';
                    atras <= '0';
                    giro_izq <= '0';
                    giro_der <= '1';
                    esiguiente <= s11;
                WHEN s11 =>
                    adelante <= '0';
                    atras <= '0';
                    giro_izq <= '0';
                    giro_der <= '1';
                    esiguiente <= s0;
                WHEN OTHERS => NULL;
            END CASE;
            out_epresente <= esiguiente;
        END IF;
    END PROCESS;
END Behavioral;