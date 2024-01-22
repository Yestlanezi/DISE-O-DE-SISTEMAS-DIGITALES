-- Librerias
library ieee;
use ieee.std_logic_1164.all;

-- Entidad
entity prac1 is
port(A,B,C,D,sel,ref: in std_logic_vector(1 downto 0);  -- Entradas (Referencia, Opciones y Selección)
     Dis: out std_logic_vector(6 downto 0));            -- Vector para display
end prac1;

-- Arquitectura
architecture A_prac1 of prac1 is
    -- Signals que van a ser usadas
    -- Entre architecture y begin
    signal z: std_logic_vector(1 downto 0);     -- Para guardar el valor de la seleccionada
    signal comp: std_logic_vector(2 downto 0);  -- Para comparar los 3 casos (<, >, =)

    begin 
        
        -- With select when para una condicional con casos
        with sel select
            z<= A when "00",    -- Cuando sel es 0, z vale lo que tiene A
                B when "01",    -- Cuando sel es 1, z vale lo que tiene B
                C when "10",    -- Cuando sel es 2, z vale lo que tiene C
                D when others;  -- Cuando sel es cualquier otro (4), z vale lo que tiene D

        -- Ahora asigna un valor a comp dependiendo del caso
        comp <= "100" when (z=ref) else -- 100 si el valor que hay en z es igual a la referencia
               "010" when (z>ref) else  -- 010 si el valor que hay en z es mayor a la referencia
               "001" when (z<ref);      -- 001 si el valor que hay en z es menor a la referencia

        -- Dependiendo del valor anterior es la salida al display
        Dis <= "1001000" when (comp = "100") else   -- 100 da un =
             "1001100" when (comp = "010") else     -- 010 muestra >
             "1011000" when (comp = "001");         -- 001 es <
end A_prac1;
