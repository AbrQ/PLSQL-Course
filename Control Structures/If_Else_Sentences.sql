-- IF - ELSE

DECLARE

v_salary number;

BEGIN

SELECT e.salary
INTO v_salary
FROM employees e
WHERE e.employee_id = 201;

IF v_salary between 1000 AND  5000 THEN
    dbms_output.put_line('Empleado de categoria C');

elsif v_salary between 5000 AND 10000 THEN
    dbms_output.put_line('Empleado de categoria B');

elsif v_salary >= 10000 THEN
    dbms_output.put_line('Empleado de categoria A');
    
END IF;

END;

