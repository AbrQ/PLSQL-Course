--lanzar una exception e imprimir un mensaje si hay más de un usuario con el mismo email.


declare

v_id_usuario number;
v_apodo varchar2(100);
v_email varchar2(100) := 'familiaperez@mailejemplo.com';

begin

    Select u.idusuario, u.apodo
    into v_id_usuario, v_apodo
    from usuario u
    where u.email = v_email;
    
    dbms_output.put_line('Id: '||v_id_usuario||' - Apodo: '||v_apodo);
    
EXCEPTION
    
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('No hay ningun usuario con el email: '||v_email);
        
    WHEN TOO_MANY_ROWS THEN
        dbms_output.put_line('Hay mas de un usuario con el email: '||v_email);

end;