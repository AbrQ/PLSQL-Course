-- FUNCIONES

CREATE OR REPLACE FUNCTION Pedidos_Pendientes RETURN varchar2
IS

v_cantidad number;

BEGIN

SELECT COUNT(*)
INTO v_cantidad
FROM pedidos
WHERE fechaentregado is null;

return v_cantidad;

END;

--INVOCACION DE FUNCIONES EN PLSQL
--select Pedidos_Pendientes()
--from dual