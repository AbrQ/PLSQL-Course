--Colecciones

declare

type l_empleados is table of varchar2(50);
v_tamano number;

v_empleados l_empleados := l_empleados('Juan','Pedro','Carlos');

begin

v_empleados.extend; --agregar nuevo slot de memoria
v_empleados(4)  := 'Marcelo';
v_empleados.extend;
v_empleados(5) := 'Fernando';

dbms_output.put_line('El tamaño de la coleccion es: '||v_empleados.count());
v_tamano := v_empleados.count();

for i in 1..v_tamano loop
dbms_output.put_line(v_empleados(i));
end loop;

end;