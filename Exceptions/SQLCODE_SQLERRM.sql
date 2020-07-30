--EXCEPTIONS sqlcode y sqlerrm
DECLARE

v_busqueda employees.first_name%TYPE;
v_telefono employees.phone_number%TYPE;
v_cantidad number;
v_resultado number;
v_codigo_exception number;
v_mensaje_exception varchar(50);

BEGIN

v_busqueda := 'Carlos';
v_resultado := 5/0;

select e.phone_number
into v_telefono
from employees e
where e.first_name = v_busqueda;

dbms_output.put_line('El número de telefono de '||v_busqueda|| ' es: '||v_telefono);

EXCEPTION
WHEN TOO_MANY_ROWS THEN
    select count(*)
    into v_cantidad
    from employees e
    where e.first_name = v_busqueda;
    dbms_output.put_line('Hay ' ||v_cantidad|| ' empleados con ese nombre');


WHEN NO_DATA_FOUND THEN
    dbms_output.put_line('No hay ningun empleado con ese nombre');
    
WHEN OTHERS THEN
    v_codigo_exception := SQLCODE;
    v_mensaje_exception := SQLERRM;
    dbms_output.put_line('Hubo un error');
    dbms_output.put_line('Código: ' ||v_codigo_exception);
    dbms_output.put_line('Mensaje error: '||v_mensaje_exception);
    


END;