-- Ejercicios

select * from PELICULA;

/*
1.- Traer e imprimir el a�o de estreno m�s alto

DECLARE

v_a�o_estreno_max pelicula.a�o%TYPE;

BEGIN

SELECT MAX(p.A�O)
INTO v_a�o_estreno_max
FROM PELICULA p;

DBMS_OUTPUT.PUT_LINE('El a�o m�s alto de estreno es: '||v_a�o_estreno_max);

END;



2.- Traer la descripcion de la pelicula Coco. Si es nula, reemplazarlo por "Sin descripci�n"


DECLARE

v_descripcion PELICULA.DESCRIPCION%TYPE;

BEGIN

SELECT nvl(p.descripcion,'Sin descripcion')
INTO v_descripcion
FROM PELICULA p
WHERE p.titulo = 'Coco';

DBMS_OUTPUT.PUT_LINE('Coco: '||v_descripcion);

END;




3.- Armar e imprimir una descripcion corta de cualquier pel�cula con el siguiente formato (a�o de estreno) - Primeros 40 caracteres de la descripci�n.

Ejemplo:

    (2019) - Los vengadores restantes deben encontrar...
*/

DECLARE

v_a�o pelicula.a�o%type;
v_descripcion pelicula.descripcion%type;



v_descripcion_formato varchar(40);

BEGIN

SELECT p.a�o, p.descripcion
INTO v_a�o, v_descripcion
FROM PELICULA p
WHERE idpelicula = 1;


v_descripcion_formato := substr(v_descripcion,1,40);

dbms_output.put_line('('||v_a�o||') - ' ||v_descripcion_formato);

END;










