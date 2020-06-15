-- Searched Case

DECLARE

v_departamento departments.department_name%TYPE;

BEGIN

SELECT d.department_name
INTO v_departamento
FROM departments d
WHERE d.department_id = 60;

CASE 

    WHEN v_departamento in ('Operations','IT Support') or v_departamento = 'IT' THEN
        dbms_output.put_line('Departamento en piso 1');

    WHEN v_departamento in ('NOC','IT Helpdesk') THEN
        dbms_output.put_line('Departamento en piso 2');
        
    ELSE
        dbms_output.put_line('No existe el departamento');

END CASE;

END;