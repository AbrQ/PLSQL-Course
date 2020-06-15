-- Variable Rowtype

DECLARE

/*
v_job jobs%ROWTYPE;
v_desc jobs.job_title%TYPE;
v_min_salary jobs.min_salary%TYPE; 
*/

v_new_job jobs%ROWTYPE;

BEGIN

/*
select j.*
into v_job
from jobs j
where j.job_id = 'IT_PROG';

v_desc := v_job.job_title;
v_min_salary := v_job.min_salary;

dbms_output.put_line('Para el trabajo con titulo: '||v_desc|| ' el salario minimo es: '||v_min_salary);
*/

v_new_job.job_id := 'DBA';
v_new_job.job_title := 'DB Admin';
v_new_job.min_salary := 5000;
v_new_job.max_salary := 12000;

UPDATE jobs SET ROW = v_new_job
WHERE job_id = 'DBA';

END;