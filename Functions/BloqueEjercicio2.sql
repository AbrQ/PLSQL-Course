declare
 
v_apodo_parametro varchar2(20);
v_password_parametro varchar2(100);
 
v_mensaje varchar2(255);
v_id_usuario number(10);
v_apodo varchar2(20);
v_email varchar2(320);
 
begin
 
    v_apodo_parametro := 'Maria789';
    v_password_parametro := 'ghi789';
 
    login_usuario(v_apodo_parametro,v_password_parametro,v_mensaje,v_id_usuario,v_apodo,v_email);
    
    dbms_output.put_line('Mensaje: '||v_mensaje);
    dbms_output.put_line('Id Usuario: '||v_id_usuario);
    dbms_output.put_line('Apodo: '||v_apodo);
    dbms_output.put_line('Email: '||v_email);
    
end;