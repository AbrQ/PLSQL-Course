--Update, Insert, Delete

DECLARE

--v_salario_max number;
--v_region_id number;
--v_country_name varchar(20);
--v_country_id varchar(2);

BEGIN

/*
SENTENCIA UPDATE

SELECT MAX(salary)
INTO v_salario_max
FROM employees;

dbms_output.put_line(v_salario_max);

UPDATE employees 
SET salary = 23500
WHERE salary = v_salario_max;*/
/*

/*
SENTENCIA INSERT


SELECT region_id
INTO v_region_id
FROM REGIONS
WHERE region_name = 'Asia';

v_country_name := 'Korea';

INSERT INTO COUNTRIES (country_id, country_name, region_id)
VALUES ('KR',v_country_name,v_region_id);
*/

/*
SENTENCIA DELETE

SELECT country_id
INTO v_country_id
FROM COUNTRIES
WHERE country_name = 'Korea';

DELETE FROM COUNTRIES
WHERE country_id = v_country_id;
*/

END;