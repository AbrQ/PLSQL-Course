-- Variables

DECLARE

nombre           varchar(20);
edad             number;
fecha_nacimiento date;
color_favorito   varchar(20);
acepta_termino   boolean;

BEGIN

nombre := 'Abraham';
edad   := 25;
fecha_nacimiento := date'1994-11-26';
color_favorito := '&color';
acepta_termino := true;

dbms_output.put_line('Nombre: '||nombre);
dbms_output.put_line('Edad: '||edad);
dbms_output.put_line('Fecha de nacimiento: '||fecha_nacimiento);
dbms_output.put_line('Color favorito: '||color_favorito);


END;

/*

Notas adicionales:

Es posible colocar una variable como constante, sin embargo, esta debe inicializarse:

            fecha constant date := date'1999-01-01';
            
Es posible colocar como not null una variable, sin embargo, debe inicializarse:

            mi_numero number not null := 10;
*/