-- Bloco An�nimo: Verificar se Abrigo est� Ativo
DECLARE
  v_id      NUMBER := 1; -- ID do abrigo a ser testado
  v_status  CHAR(1);
BEGIN
  SELECT ativo INTO v_status
  FROM GS_ABRIGO
  WHERE id = v_id;

  IF v_status = 'S' THEN
    DBMS_OUTPUT.PUT_LINE('Abrigo ID ' || v_id || ' est� ATIVO e pode receber pessoas.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Abrigo ID ' || v_id || ' est� INATIVO no sistema.');
  END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Abrigo ID ' || v_id || ' n�o encontrado.');
END;

