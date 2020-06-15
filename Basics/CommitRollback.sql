-- Commit y Rollback

Select * from employees
where employee_id = 100;

UPDATE employees SET first_name = 'Abraham'
WHERE employee_id = 100;

commit;
------------------------------------------------
INSERT INTO regions (region_id, region_name)
VALUES (5, 'Oceania');

SELECT * FROM regions;

commit;

DELETE FROM regions
WHERE region_id = 5;

rollback;