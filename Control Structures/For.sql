-- For


BEGIN

FOR v_numero in 1..10 LOOP

    dbms_output.put_line('El valor del número es: '||v_numero);
    
END LOOP;

END;