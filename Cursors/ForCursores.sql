-- FOR PARA CURSORES


DECLARE

CURSOR empleados IS
select e.first_name, e.last_name, e.hire_date
from employees e
where e.hire_date between date'2002-01-01' and date'2002-12-31';

BEGIN

    FOR reg IN empleados LOOP
        dbms_output.put_line('Nombre: '||reg.first_name|| ' Apellido: '||reg.last_name|| ' Fecha contratacion: '||reg.hire_date);
    END LOOP;

END;