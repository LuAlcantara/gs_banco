-- Bloco Anônimo: Verificar se Abrigo está Ativo
DECLARE
  v_id      NUMBER := 1; -- ID do abrigo a ser testado
  v_status  CHAR(1);
BEGIN
  SELECT ativo INTO v_status
  FROM GS_ABRIGO
  WHERE id = v_id;

  IF v_status = 'S' THEN
    DBMS_OUTPUT.PUT_LINE('Abrigo ID ' || v_id || ' está ATIVO e pode receber pessoas.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Abrigo ID ' || v_id || ' está INATIVO no sistema.');
  END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Abrigo ID ' || v_id || ' não encontrado.');
END;

