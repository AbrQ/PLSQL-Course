-- While

DECLARE

v_contador number := 0;

BEGIN

WHILE v_contador < 7 LOOP
    
    v_contador := v_contador + 1;
    
    dbms_output.put_line('El valor del contador es: '||v_contador);
END LOOP;
    

END;