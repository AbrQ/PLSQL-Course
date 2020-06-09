-- SELECT INTO

DECLARE

v_last_name  varchar(15);
v_first_name varchar(15);
v_salary     number;

BEGIN

SELECT e.last_name, e.first_name, e.salary
INTO v_last_name, v_first_name, v_salary
FROM employees e
WHERE e.employee_id = 100;

dbms_output.put_line(v_last_name);
dbms_output.put_line(v_first_name);
dbms_output.put_line(v_salary);

END;