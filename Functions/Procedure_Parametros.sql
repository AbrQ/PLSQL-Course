--PROCEDURES CON PARAMETROS

CREATE OR REPLACE PROCEDURE Agregar_Articulo(p_idarticulo IN NUMBER, p_idpedido IN NUMBER, p_cantidad IN NUMBER, p_mensaje OUT VARCHAR2, p_idpedidosarticulos OUT NUMBER) IS

v_idsucursal NUMBER;
v_stock NUMBER;
v_idpedidosarticulos NUMBER;

BEGIN

    SELECT p.idsucursal
    INTO v_idsucursal
    FROM pedidos p
    WHERE p.idpedido = p_idpedido;
    
    SELECT a.stock
    INTO v_stock
    FROM articulos_sucursales a
    WHERE a.idarticulo = p_idarticulo AND a.idsucursal = v_idsucursal;
    
    IF v_stock >= p_cantidad THEN
    
        SELECT MAX(idpedidosarticulos + 1)
        INTO v_idpedidosarticulos
        FROM pedidos_articulos;
        
        INSERT INTO pedidos_articulos (idpedido, idarticulo, cantidad, idpedidosarticulos)
        VALUES(p_idpedido, p_idarticulo, p_cantidad, v_idpedidosarticulos);
        
        p_mensaje := 'Articulo agregado al pedido';
        p_idpedidosarticulos := v_idpedidosarticulos;
        
    ELSE
        p_mensaje := 'No hay stock suficiente';
    END IF;

END;