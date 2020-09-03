-- Trigger - for each row

CREATE OR REPLACE TRIGGER art_audit
AFTER INSERT OR DELETE OR UPDATE ON ARTICULOS_C
FOR EACH ROW

DECLARE

v_mensaje varchar2(250);

BEGIN

    if inserting then
    v_mensaje := 'Se ha realizardo una insercion sobre articulos_c';
    elsif deleting then
    v_mensaje := 'Se ha realizardo una eliminacion sobre articulos_c';
    elsif updating('precio') then
    v_mensaje := 'Se ha realizardo una actualizacion en la columna precio sobre articulos_c';
    elsif updating then
    v_mensaje := 'Se ha realizardo una actualizacion sobre articulos_c';
    end if;
    INSERT INTO LOG_AUDITORIA(USUARIO, MENSAJE, FECHA)
    VALUES(USER,V_MENSAJE,SYSDATE);

END;

