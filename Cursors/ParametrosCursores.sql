-- PARAMETROS EN CURSORES


DECLARE

CURSOR empleados(p_desde date, p_hasta date) IS
select e.first_name, e.last_name, e.hire_date
from employees e
where e.hire_date between p_desde and p_hasta;

v_desde date;
v_hasta date;

BEGIN

    v_desde:=  date'2003-01-01';
    select max(hire_date)
    into v_hasta
    from employees
    where department_id = 100;

    FOR reg IN empleados(v_desde, v_hasta) LOOP
        dbms_output.put_line('Nombre: '||reg.first_name|| ' Apellido: '||reg.last_name|| ' Fecha contratacion: '||reg.hire_date);
    END LOOP;

END;