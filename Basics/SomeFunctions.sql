-- Algunas funciones

DECLARE

v_mi_cadena varchar(20);
v_cadena_mayusculas varchar(20);
v_cadena_minusculas varchar(20);
v_sub_cadena varchar(4);
v_reemplazo varchar(20);

BEGIN

v_mi_cadena := 'Esto es una prueba';
v_cadena_mayusculas := UPPER(v_mi_cadena);
v_cadena_minusculas := LOWER(v_mi_cadena);
v_sub_cadena := SUBSTR(v_mi_cadena,1,4);
v_reemplazo := REPLACE(v_mi_cadena,'Esto','Esta');


dbms_output.put_line('La cadena original es: '||v_mi_cadena);
dbms_output.put_line('La cadena con mayusculas es: '||v_cadena_mayusculas);
dbms_output.put_line('La cadena con minusculas es: '||v_cadena_minusculas);
dbms_output.put_line('La sub cadena es: '||v_sub_cadena);
dbms_output.put_line('El reemplazo es: '||v_reemplazo);

END;

