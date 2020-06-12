-- Ejercicios

select * from PELICULA;

/*
1.- Traer e imprimir el año de estreno más alto

DECLARE

v_año_estreno_max pelicula.año%TYPE;

BEGIN

SELECT MAX(p.AÑO)
INTO v_año_estreno_max
FROM PELICULA p;

DBMS_OUTPUT.PUT_LINE('El año más alto de estreno es: '||v_año_estreno_max);

END;



2.- Traer la descripcion de la pelicula Coco. Si es nula, reemplazarlo por "Sin descripción"


DECLARE

v_descripcion PELICULA.DESCRIPCION%TYPE;

BEGIN

SELECT nvl(p.descripcion,'Sin descripcion')
INTO v_descripcion
FROM PELICULA p
WHERE p.titulo = 'Coco';

DBMS_OUTPUT.PUT_LINE('Coco: '||v_descripcion);

END;




3.- Armar e imprimir una descripcion corta de cualquier película con el siguiente formato (año de estreno) - Primeros 40 caracteres de la descripción.

Ejemplo:

    (2019) - Los vengadores restantes deben encontrar...
*/

DECLARE

v_año pelicula.año%type;
v_descripcion pelicula.descripcion%type;



v_descripcion_formato varchar(40);

BEGIN

SELECT p.año, p.descripcion
INTO v_año, v_descripcion
FROM PELICULA p
WHERE idpelicula = 1;


v_descripcion_formato := substr(v_descripcion,1,40);

dbms_output.put_line('('||v_año||') - ' ||v_descripcion_formato);

END;










