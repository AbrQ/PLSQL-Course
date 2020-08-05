-- PROCEDURE

CREATE OR REPLACE PROCEDURE ordenar_fabrica IS

CURSOR articulos IS
select a.idarticulo, a.stock, a.idsucursal
from articulos_sucursales a;

v_mejor_precio number;
v_idfabricante number;
v_siguiente_id number;

BEGIN
    
    FOR art in articulos LOOP
        if art.stock = 0 then
        select min(precio)
        into v_mejor_precio
        from articulos_fabricantes af
        where af.idarticulo = art.idarticulo
        group by idarticulo;
        
        select idfabricante
        into v_idfabricante
        from articulos_fabricantes af
        where af.idarticulo = art.idarticulo
        and af.precio = v_mejor_precio;
        
        select max(idpedidofabrica) + 1
        into v_siguiente_id
        from pedido_fabrica;
        
        insert into pedido_fabrica(idpedidofabrica,idsucursal,idarticulo,idfabricante,fechapedido,cantidad)
        values(v_siguiente_id, art.idsucursal, art.idarticulo, v_idfabricante, sysdate, 10);
        end if;
    END LOOP;

END;