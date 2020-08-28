--COLECCIONES DE RECORDS PERSONALIZADAS

DECLARE

type datos_empleado is record
(apellido varchar(50),
nombre varchar(50),
pais varchar(50)
);

type e_list is table of datos_empleado;

v_empleado datos_empleado;

lista e_list := e_list();

BEGIN

for i in 1..4 loop

    select e.last_name, e.first_name, c.country_name
    into v_empleado
    from employees e
    inner join departments d on e.department_id = d.department_id
    inner join locations l on d.location_id = l.location_id
    inner join countries c on l.country_id = c.country_id
    where employee_id = (i + 100);
    
    lista.extend;
    lista(i) := v_empleado;

end loop;

dbms_output.put_line(lista(1).apellido||' '||lista(1).nombre||' '||lista(1).pais);
dbms_output.put_line(lista(2).apellido||' '||lista(2).nombre||' '||lista(2).pais);
dbms_output.put_line(lista(3).apellido||' '||lista(3).nombre||' '||lista(3).pais);
dbms_output.put_line(lista(4).apellido||' '||lista(4).nombre||' '||lista(4).pais);

lista.extend;
lista(5) := datos_empleado('Leonardo','Fernandez','Argentina');
dbms_output.put_line(lista(5).apellido||' '||lista(5).nombre||' '||lista(5).pais);

END;