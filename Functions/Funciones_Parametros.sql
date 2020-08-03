-- Funciones con parametros

CREATE OR REPLACE FUNCTION calcular_valor_pedido(p_idpedido number)
RETURN number IS

CURSOR articulos(v_idpedido number) is
select pa.cantidad, a.precio
from pedidos_articulos pa
inner join articulos a on a.idarticulo = pa.idarticulo
where pa.idpedido = v_idpedido;

v_total number := 0;
v_porcentaje_costo_entrega number;
v_costo_entrega number;

BEGIN

    select c.costoentrega
    into v_porcentaje_costo_entrega
    from canales_venta c
    inner join pedidos p on c.idcanalventa = p.idcanalventa
    where p.idpedido = p_idpedido;
    
    FOR art in articulos(p_idpedido) LOOP
        v_total := v_total + (art.precio * art.cantidad);
    END LOOP;
    
    v_costo_entrega := (v_porcentaje_costo_entrega * v_total) / 100;
    v_total := v_total + v_costo_entrega;
    
    return v_total;
    
EXCEPTION WHEN OTHERS THEN

DBMS_OUTPUT.PUT_LINE('Hubo un error');

END;

--select p.*, calcular_valor_pedido(p.idpedido)
--from pedidos p
