-- CASE

DECLARE

v_departamento departments.department_name%TYPE;

BEGIN

SELECT d.department_name
INTO v_departamento
FROM departments d
WHERE d.department_id = 250;

CASE v_departamento

    WHEN 'Operations' THEN
        dbms_output.put_line('Departamento de operaciones');
        
    WHEN 'IT Support' THEN
        dbms_output.put_line('Departamento de TI');

    WHEN 'NOC' THEN
        dbms_output.put_line('Departamento de NOC');

    WHEN 'IT Helpdesk' THEN
        dbms_output.put_line('Departamento de TI Helpdesk');
        
    ELSE
        dbms_output.put_line('No existe el departamento');

END CASE;

END;