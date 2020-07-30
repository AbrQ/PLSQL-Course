-- EXCEPCIONES EXPLICITAS

DECLARE

v_job_id varchar(25);
v_afectadas number;
job_no_encontrado exception;

BEGIN

v_job_id := 'AAAA';

UPDATE EMPLOYEES
SET SALARY = SALARY*1.5
WHERE JOB_ID = v_job_id;

v_afectadas := sql%rowcount;

IF v_afectadas = 0 THEN
    raise job_no_encontrado;
END IF;

dbms_output.put_line('Afectadas: '||v_afectadas);

EXCEPTION
WHEN job_no_encontrado THEN
    dbms_output.put_line('No se encontro el trabajo');

END;