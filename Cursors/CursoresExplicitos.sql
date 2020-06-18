-- CURSOR EXPLICITO


DECLARE

CURSOR empleados IS
select e.first_name, e.last_name, e.hire_date
from employees e
where e.hire_date between date'2002-01-01' and date'2002-12-31';


v_nombre varchar(25);
v_apellido varchar(25);
v_contratacion date;

BEGIN

OPEN empleados;

LOOP

    FETCH empleados into v_nombre, v_apellido, v_contratacion;
    EXIT WHEN empleados%NOTFOUND;
    
    dbms_output.put_line('Nombre: '||v_nombre|| ' Apellido: '||v_apellido|| ' Fecha contratacion: '||v_contratacion);

END LOOP;

CLOSE empleados;


END;