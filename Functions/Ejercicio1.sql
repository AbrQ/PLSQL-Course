/*Ejercicio 1) Crear una function que reciba por parámetro un id de película.
Se debe retornar nombre de la película, la calificación promedio numérica y calificación en texto (Entre 1 y 2: Mala - entre 3 y 4: Buena - Mayor a 4: Excelente) 
y el número de calificaciones, todo en un mismo texto.
Ejemplo: "Power Rangers - Calificación: Buena (3,2) - Basada en 7 puntuaciónes".
*/

create or replace function puntuacion_pelicula(p_id_pelicula number) return varchar2 is
 
v_titulo_pelicula varchar2(50);
v_puntuacion_promedio number(10,2);
v_calificacion varchar2 (10);
v_cantidad_puntuaciones number(10);
v_texto_respuesta varchar2(255);
 
begin
 
    select p.titulo
    into v_titulo_pelicula
    from pelicula p
    where p.idpelicula = p_id_pelicula;
 
    select avg(o.puntuacion)
    into v_puntuacion_promedio
    from opinion o
    where o.idpelicula = p_id_pelicula;
 
    if v_puntuacion_promedio between 1 and 2 then
        v_calificacion := 'Mala';
    elsif v_puntuacion_promedio between 3 and 4 then
        v_calificacion := 'Buena';
    elsif v_puntuacion_promedio > 4 then
        v_calificacion := 'Excelente';
    end if;
    
    select count(*)
    into v_cantidad_puntuaciones
    from opinion o
    where o.idpelicula = p_id_pelicula;
    
    v_texto_respuesta := v_titulo_pelicula||' - Calificación: '||v_calificacion||' ('||v_puntuacion_promedio||') - Basada en '||v_cantidad_puntuaciones||' puntuaciónes';
        
    return v_texto_respuesta;
    
    exception when NO_DATA_FOUND then
        v_texto_respuesta := 'No existe la pelicula';
    return v_texto_respuesta;
 
end;