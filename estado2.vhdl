LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY sensa_boton IS
    PORT (
        boton : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        reloj : OUT STD_LOGIC;
        epresente : BUFFER STD_LOGIC);
END sensa_boton;
ARCHITECTURE Behavioral OF sensa_boton IS
    SIGNAL esiguiente : STD_LOGIC;
BEGIN
    PROCESS (esiguiente, boton)BEGIN
        IF rising_edge (clk) THEN
            CASE esiguiente IS
                WHEN '0' =>
                    reloj <= '0';
                    IF boton = '0' THEN
                        esiguiente <= '0';
                    ELSE
                        esiguiente <= '1';
                    END IF;
                WHEN '1' =>
                    IF boton = '1' THEN
                        esiguiente <= '1';
                        reloj <= '0';
                    ELSE
                        esiguiente <= '0';
                        reloj <= '1';
                    END IF;
                WHEN OTHERS => NULL;
            END CASE;
        END IF;
        epresente <= esiguiente;
    END PROCESS;
END Behavioral;