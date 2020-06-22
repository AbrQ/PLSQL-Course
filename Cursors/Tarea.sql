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
*/

DECLARE

v_titulo pelicula.titulo%TYPE;
v_id_pelicula pelicula.idpelicula%TYPE;
v_opinion opinion.opinion%TYPE;



CURSOR opiniones(p_usuario) IS
SELECT o.opinion
FROM opinion o
WHERE o.idpelicula = v_id_pelicula;

p_usuario opinion.idusuario%TYPE;

BEGIN

SELECT upper(p.titulo)
INTO v_titulo
FROM pelicula p
WHERE p.idpelicula = &v_id_pelicula;

FOR reg IN opiniones(&p_usuario) LOOP
    dbms_output.put_line('Titulo: '||v_titulo||' Opinion_: '||reg.opinion);
END LOOP;



END;

