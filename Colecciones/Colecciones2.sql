--Colecciones

declare

type l_empleados is table of varchar2(50);
v_tamano number;
v_primer_elemento number;
v_ultimo_elemento number;
v_empleados l_empleados := l_empleados();

begin

for i in 1..10 loop
    v_empleados.extend;
    select e.first_name
    into v_empleados(i)
    from employees e
    where e.employee_id = (100 + i);

end loop;

for i in 1..10 loop

    dbms_output.put_line(v_empleados(i));

end loop;

end;