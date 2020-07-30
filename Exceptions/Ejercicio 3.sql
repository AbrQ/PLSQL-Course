--crear una exception personalizada e imprimir un mensaje en caso de que el mail ingresado no tenga un "@" en alguna parte del texto.

declare

v_id_usuario number;
v_apodo varchar2(100);
v_email varchar2(100) := 'familiaperezmailejemplo.com';
job_exception exception;

begin

IF v_email LIKE '%@%' THEN

    Select u.idusuario, u.apodo
    into v_id_usuario, v_apodo
    from usuario u
    where u.email = v_email;
    
    dbms_output.put_line('Id: '||v_id_usuario||' - Apodo: '||v_apodo);
    
ELSIF v_email NOT LIKE '%@%' THEN
    raise job_exception;
END IF;
    
EXCEPTION
    
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('No hay ningun usuario con el email: '||v_email);
        
    WHEN TOO_MANY_ROWS THEN
        dbms_output.put_line('Hay mas de un usuario con el email: '||v_email);
        
    WHEN job_exception THEN
        dbms_output.put_line('El email no tiene @');        


end;