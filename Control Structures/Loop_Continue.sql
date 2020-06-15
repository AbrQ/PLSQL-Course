-- Loop

DECLARE

v_contador number;

BEGIN

v_contador := 0;

LOOP

    v_contador := v_contador + 1;
    
    IF v_contador = 3 THEN
        CONTINUE;
    END IF;
    
    dbms_output.put_line('El contador vale: '||v_contador);
    
    EXIT WHEN v_contador = 11;
    
END LOOP;

END;