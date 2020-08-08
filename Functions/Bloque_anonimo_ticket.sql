--BLOQUE ANONIMO DE IMPRESION DE TICKET

DECLARE

v_resumen CLOB;
v_id_pedido NUMBER;

BEGIN

    v_id_pedido := 2;
    imprimir_pedido(v_id_pedido, v_resumen);
    
    dbms_output.put_line(v_resumen);

END;
