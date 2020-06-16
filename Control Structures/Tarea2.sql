-- Tarea 2

/*
1.- Dada una determinada opinion, si esta fué de 1 o 2 puntos llenar una variable con el valor "Mala".
    Si fué de 5 puntos "Excelente". Luego imprimir el resultado junto al título de la pelicula


DECLARE

v_puntuacion opinion.puntuacion%TYPE;
v_id_pelicula opinion.idpelicula%TYPE;
v_pelicula pelicula.titulo%TYPE;
v_critica varchar(20);

BEGIN

SELECT o.puntuacion, o.idpelicula  
INTO v_puntuacion, v_id_pelicula
FROM opinion o
WHERE o.idopinion = 15;

SELECT p.titulo
INTO v_pelicula
FROM pelicula p
WHERE p.idpelicula = v_id_pelicula;


IF (v_puntuacion = 1 OR v_puntuacion = 2) THEN

        v_critica := 'Mala';
        dbms_output.put_line('Resultado: '||v_critica|| ' Título: '||v_pelicula);
        
ELSIF v_puntuacion = 5 THEN

        v_critica := 'Excelente';
        dbms_output.put_line('Resultado: '||v_critica|| ' Título: '||v_pelicula);
        
ELSE
        v_critica := 'En el promedio'; 
        dbms_output.put_line('Resultado: '||v_critica|| ' Título: '||v_pelicula);
        
END IF;

END;

*/

/*
2.- Calcular la potencia de un numero cualquiera e imprimir el resultado: Ejemplo 2^4 = 16


DECLARE

v_base number := 3;
v_potencia number := 3;
v_calculo number := 1;
v_contador number := 0;

BEGIN

--dbms_output.put_line('El numero base: '||&v_base);
--dbms_output.put_line('El numero base: '||&v_potencia);

WHILE v_contador <= v_potencia LOOP

    v_calculo := v_calculo * v_base;
    v_contador := v_contador + 1;
    
    IF v_contador = v_potencia THEN
        dbms_output.put_line('El numero base a la potencia es: '||v_calculo);  
    END IF;

END LOOP;

END;

*/