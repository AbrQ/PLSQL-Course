-- variables :old :new

CREATE OR REPLACE TRIGGER art_aud_precio
after update on articulos_c 
for each row

declare

v_idarticulosaud number;

begin

if updating('precio') then

    select nvl(max(idarticuloaud) + 1, 1)
    into v_idarticulosaud
    from articulos_auditoria;

    insert into articulos_auditoria(idarticuloaud, idarticulo, precioanterior, precionuevo, fecha, usuario)
    values(v_idarticulosaud, :old.idarticulo,:old.precio,:new.precio,sysdate,user);
    
end if;

end;