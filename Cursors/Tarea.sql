/*
1.- Obtener e imprimir  todas las opciones para la pelicula con el ID 5

DECLARE

CURSOR opiniones IS
SELECT  o.idusuario, o.opinion
FROM opinion o
WHERE o.idpelicula = 5;

v_id_usuario opinion.idusuario%TYPE;
v_opinion opinion.opinion%TYPE;

BEGIN

    OPEN opiniones;
    LOOP
        FETCH opiniones into v_id_usuario, v_opinion;
        EXIT WHEN opiniones%NOTFOUND;
        dbms_output.put_line('ID USUARIO: '||v_id_usuario||' Opinion: '||v_opinion);
    END LOOP;
    
    CLOSE opiniones;

END;

2.- Obtener e imprimir todas las opiniones de un usuario (enviar id de usuario por parámetro al cursor), 
imprimiendo primero el nombre de la película en mayúsculas y luego la opinión.

declare
 
cursor cur_opiniones(p_id_usuario number) is
select o.opinion, p.titulo
from opinion o
inner join pelicula p on o.idpelicula = p.idpelicula
where o.idusuario = p_id_usuario;
 
begin
 
    for op in cur_opiniones(1) loop
        
        dbms_output.put_line(upper(op.titulo));
        dbms_output.put_line(op.opinion);
    
    end loop;
 
end;

3.- Cambiar todos los textos de opiniones para la película con ID 4. Modificar concatenando el nombre del usuario delante del texto. 
Ej: "Juan: Aquí iría la opinión del usuario". Imprimir cuantas filas fueron afectadas utilizando cursor implícito.

declare
 
cursor cur_opiniones(p_id_pelicula number) is
select o.*, u.apodo
from opinion o
inner join usuario u on o.idusuario = u.idusuario
where o.idpelicula = p_id_pelicula;
 
v_afectadas number;
v_nueva_opinion varchar(140);
 
begin
 
    for op in cur_opiniones(4) loop
        
      v_nueva_opinion:= op.apodo||': '||op.opinion;
      
      update opinion set opinion = v_nueva_opinion
      where idopinion = op.idopinion;
      
      v_afectadas:= sql%rowcount;
      
      dbms_output.put_line('Afectadas: '||v_Afectadas);
    
    end loop;
 
end;
*/




