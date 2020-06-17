--CURSORES IMPLICITOS

DECLARE

v_cantidad number;
v_afecto boolean;
v_afecto_txt varchar(25);
v_salario employees.salary%TYPE;

BEGIN

UPDATE employees e 
SET e.salary = e.salary * 1.5
WHERE e.department_id = 20; 

v_cantidad := SQL%ROWCOUNT;
v_afecto := SQL%FOUND;

CASE v_afecto
    WHEN true THEN 
        v_afecto_txt := 'Si afecto';
    WHEN false THEN
        v_afecto_txt := 'No afecto';
END CASE;

dbms_output.put_line('¿Se afectaron filas?: '||v_afecto_txt);
dbms_output.put_line('Cantidad de filas afectadas: '||v_cantidad);

SELECT e.salary
INTO v_salario
FROM employees e
WHERE e.employee_id = 201;

v_cantidad := SQL%ROWCOUNT;
v_afecto := SQL%FOUND;

CASE v_afecto
    WHEN true THEN 
        v_afecto_txt := 'Si encontró';
    WHEN false THEN
        v_afecto_txt := 'No encontró';
END CASE;

dbms_output.put_line('¿Se encontraron filas?: '||v_afecto_txt);
dbms_output.put_line('Cantidad de filas encontradas: '||v_cantidad);
dbms_output.put_line('Salario: '||v_salario);

END;