-- Variables TYPE

DECLARE

v_job_id employees.job_id%TYPE;


BEGIN

SELECT e.job_id 
INTO v_job_id
FROM employees e
WHERE e.employee_id = 134;

dbms_output.put_line(v_job_id);

END;