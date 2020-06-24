--EXCEPTIONS

DECLARE

v_busqueda employees.first_name%TYPE;
v_telefono employees.phone_number%TYPE;
v_cantidad number;

BEGIN

v_busqueda := 'Carlos';

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

END;