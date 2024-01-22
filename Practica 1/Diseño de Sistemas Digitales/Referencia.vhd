
-- Librerias
library IEEE;
use IEEE.std_logic_1164.all;

-- Entidad
entity prac1 is
    -- Se declaran salidas y entradas
    port (
        a, b, c, d, e, f, g : out std_logic;    -- Salidas para el display
        x1, x0 : in std_logic                   -- Entradas (Referencia)
    );
end entity;

-- Arquitectura
architecture A_prac1 of prac1 is
begin

    -- Process para que sea secuencial
    -- Lleva su propio begin y al final un end process
    process (x1, x0)
        -- Las variables deben ir entre process y begin
        variable auxVectOut : std_logic_vector (6 downto 0);
        variable auxVectIn : std_logic_vector (1 downto 0);
    begin

        -- Asignar los valores de referencia al vector auxVectIn
        auxVectIn(1) := x1;
        auxVectIn(0) := x0;

        -- Se hace un if-elsif y en cada caso dependiendo la entrada es la salida en bcd
        -- Se usa auxVectOut como un auxiliar y guardar temporalmente la salida
        if auxVectIn = "00" then auxVectOut := "1111110";       -- 0
        elsif auxVectIn = "01" then auxVectOut := "0110000";    -- 1
        elsif auxVectIn = "10" then auxVectOut := "1101101";    -- 2
        elsif auxVectIn = "11" then auxVectOut := "1111001";    -- 3
        else auxVectOut := "0000000";                           -- 8 (error)
        end if;

        -- Asignación del valor en bcd a las salidas
        a <= auxVectOut(6);
        b <= auxVectOut(5);
        c <= auxVectOut(4);
        d <= auxVectOut(3);
        e <= auxVectOut(2);
        f <= auxVectOut(1);
        g <= auxVectOut(0);

    end process;

end architecture;
