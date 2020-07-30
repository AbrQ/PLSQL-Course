--Utilizando el email, buscar e imprimir ID y apodo de un usuario. Lanzar una exception e imprimir un mensaje si no se encuentra ningún usuario con ese email.

declare
     
v_id_usuario number;
v_apodo varchar2(100);
v_email varchar2(100) := 'pedro@mailejemplo.com';
 
begin
 
    select u.idusuario, u.apodo
    into v_id_usuario, v_apodo
    from usuario u
    where u.email = v_email;
    
    dbms_output.put_line('Id: '||v_id_usuario||' - Apodo: '||v_apodo);
    
exception when NO_DATA_FOUND then
 
    dbms_output.put_line('No hay ningun usuario con el email '||v_email);
     
end;