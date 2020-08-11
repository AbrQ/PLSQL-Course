-- Variables "Record" Personalizadas

/*declare 

empleado employees%rowtype;

begin

select e.*
into empleado
from employees e
where e.employee_id = 100;

dbms_output.put_line('Nombre: '||empleado.first_name||' Apellido: '||empleado.last_name);

end;*/


declare

type datos_empleado is record
(apellido varchar(50),
nombre varchar(50),
pais varchar(50));

empleado datos_empleado;

begin

    select e.last_name, e.first_name, c.country_name
    into empleado
    from employees e
    inner join departments d on e.department_id = d.department_id
    inner join locations l on d.location_id = l.location_id
    inner join countries c on l.country_id = c.country_id
    where employee_id = 100;
    
    dbms_output.put_line(empleado.apellido);
    dbms_output.put_line(empleado.nombre);
    dbms_output.put_line(empleado.pais);

end;