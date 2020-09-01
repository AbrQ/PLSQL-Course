-- Trigger basico

CREATE OR REPLACE TRIGGER art_audit
AFTER DELETE ON ARTICULOS_C

DECLARE

v_mensaje varchar2(50);

BEGIN

    v_mensaje := 'Se ha realizardo un delete sobre articulos_c';
    INSERT INTO LOG_AUDITORIA(USUARIO, MENSAJE, FECHA)
    VALUES(USER,V_MENSAJE,SYSDATE);

END;

