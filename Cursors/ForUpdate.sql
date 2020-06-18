-- FOR UPDATE

DECLARE

CURSOR empleados IS
select e.*
from employees e
where e.commission_pct is null 
and e.hire_date <= date'2005-12-31'
FOR UPDATE;

v_porcentaje_comision number;


BEGIN

    FOR emp IN empleados LOOP
    
    v_porcentaje_comision := 0;

    IF emp.salary between 1000 and 5000 THEN
        v_porcentaje_comision := 0.1;
    ELSIF emp.salary between 5001 and 10000 THEN
        v_porcentaje_comision := 0.2;
    ELSIF emp.salary >= 10001 THEN
        v_porcentaje_comision := 0.3;
    END IF; 
    
    DBMS_OUTPUT.PUT_LINE('Empleado:' ||emp.last_name||', '||emp.first_name||'. Con ID: '||emp.employee_id||'. Califica para recibir porcentaje de comision');
    DBMS_OUTPUT.PUT_LINE('Porcentaje asignado: '||v_porcentaje_comision|| ' %');
    
    UPDATE employees SET commission_pct = v_porcentaje_comision
    WHERE current of empleados;

    END LOOP;

END;