/*Ejercicio 2) Crear un procedure para el login de usuario.

Se deben recibir 2 parámetros: p_apodo y p_password. Se debe chequear que el nombre de usuario existe y que la password sea válida.
En caso de ser datos válidos, se deben devolver datos en 4 variables OUT: v_mensaje(con el mensaje "Login correcto"), v_id_usuario, v_apodo,v_email.



En caso de ser datos inválidos, se deben devolver las 4 mismas variables OUT: v_mensaje (con el mensaje "Usuario no existente" o "Password incorrecta", 
según corresponda). El resto de las variables deben ser "null".

Passwords de usuarios para probar:
-Usuario: JuanPerez123 - Password: abc123
-Usuario: Pedro456 - Password: def456
-Usuario: Maria789 - Password: ghi789
*/

create or replace procedure login_usuario(p_apodo IN varchar2, p_password IN varchar2, v_mensaje OUT varchar2, v_id_usuario OUT number, v_apodo OUT varchar2, v_email OUT varchar2) is
 
v_password_hasheado varchar2(255);
v_datos_validos number(10);
 
begin
 
    select u.idusuario
    into v_id_usuario
    from usuario u
    where u.apodo = p_apodo;
    
    select standard_hash(p_password, 'MD5')
    into  v_password_hasheado
    from dual;
    
    select count (*)
    into v_datos_validos
    from usuario u
    where u.idusuario = v_id_usuario and v_password_hasheado = u.password;
    
    if v_datos_validos > 0 then
    
        select u.idusuario,u.apodo,u.email
        into v_id_usuario, v_apodo, v_email
        from usuario u
        where u.idusuario = v_id_usuario;
        
        v_mensaje := 'Login correcto';
        
    else
 
        v_mensaje := 'Password incorrecta';
        v_id_usuario := null;
        v_apodo := null;
        v_email := null;
        
    end if;
  
exception when no_data_found then
 
    v_mensaje := 'Usuario no existente';
    v_id_usuario := null;
    v_apodo := null;
    v_email := null;
        
end;