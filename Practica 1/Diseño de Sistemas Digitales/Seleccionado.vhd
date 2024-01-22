-- Librerias
library ieee;
use ieee.std_logic_1164.all;

-- Entidad
entity prac1 is
	-- Se declaran salidas y entradas
	port(A1,B1,C1,D1,sel: in std_logic_vector(1 downto 0);	-- Entradas (Selector y A, B, C, D)
	 	a, b, c, d, e, f, g : out std_logic					-- Salidas para el display
	 );
end prac1;

-- Arquitectura
architecture A_prac1 of prac1 is
begin 
	-- Process para que sea secuencial
	-- Lleva su propio begin y al final un end process
	process (A1, B1, C1, D1, sel)
		--Variable auxiliar, debe ir entre process y begin
		variable auxVectOut : std_logic_vector (6 downto 0);
	begin

		-- If-elsif anidado donde por cada opción del selector se toma el valor seleccionado
		-- y se manda a auxVectOut
		if sel = "00" then
			if A1 = "00" then
			    auxVectOut := "1111110";
			elsif A1 = "01" then
				auxVectOut := "0110000";
			elsif A1 = "10" then
				auxVectOut := "1101101";
			else
				auxVectOut := "1111001";
			end if;
		elsif sel = "01" then
			if B1 = "00" then
				auxVectOut := "1111110";
			elsif B1 = "01" then
				auxVectOut := "0110000";
			elsif B1 = "10" then
				auxVectOut := "1101101";
			else
				auxVectOut := "1111001";
			end if;
		elsif sel = "10" then
			if C1 = "00" then
				auxVectOut := "1111110";
			elsif C1 = "01" then
				auxVectOut := "0110000";
			elsif C1 = "10" then
				auxVectOut := "1101101";
			else
				auxVectOut := "1111001";
			end if;
		else
			if D1 = "00" then
				auxVectOut := "1111110";
			elsif D1 = "01" then
				auxVectOut := "0110000";
			elsif D1 = "10" then
				auxVectOut := "1101101";
			else
				auxVectOut := "1111001";
			end if;
		end if;

		-- Se asigna auxVectOut en las salidas al display
		a <= auxVectOut(6);
        b <= auxVectOut(5);
        c <= auxVectOut(4);
        d <= auxVectOut(3);
        e <= auxVectOut(2);
        f <= auxVectOut(1);
        g <= auxVectOut(0);

	end process;

end A_prac1;

