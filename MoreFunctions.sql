DECLARE

v_fecha date;
v_last_day date;
v_rango1 date;
v_rango2 date;
v_fecha_texto varchar(25);
v_fecha_convertida date;
v_fecha_recortada varchar(25);

v_numero_decimal number;
v_numero_redondeado number;

v_comision varchar(25);

BEGIN

v_fecha := sysdate;
v_last_day := last_day(v_fecha);
v_rango1 := date'2000-01-01';
v_rango2 := date'2001-12-31';
v_fecha_texto := '10/10/2020';
v_fecha_convertida := TO_DATE(v_fecha_texto,'dd/mm/yyyy');
v_fecha_recortada := TO_CHAR(v_fecha,'dd-mm');

v_numero_decimal := 10.5432;
v_numero_redondeado := ROUND(v_numero_decimal);

select nvl(to_char(e.commission_pct),'No tiene porcentaje')
into v_comision
from employees e
where e.employee_id = 129;

dbms_output.put_line(v_fecha);
dbms_output.put_line(v_last_day);
dbms_output.put_line(months_between(v_rango2, v_rango1));
dbms_output.put_line(v_fecha_texto);
dbms_output.put_line(v_fecha_convertida + 1);
dbms_output.put_line(v_fecha_recortada);
dbms_output.put_line(trunc(v_numero_decimal));
dbms_output.put_line(v_numero_redondeado);
dbms_output.put_line(v_comision);

END;