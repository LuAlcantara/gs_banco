-- Cursor: Exibir nome e risco de cada abrigo ativo
DECLARE
  CURSOR c_abrigos IS
    SELECT id, nome FROM GS_ABRIGO WHERE ativo = 'S';

  v_id   GS_ABRIGO.id%TYPE;
  v_nome GS_ABRIGO.nome%TYPE;
  v_risco VARCHAR2(10);
BEGIN
  OPEN c_abrigos;
  LOOP
    FETCH c_abrigos INTO v_id, v_nome;
    EXIT WHEN c_abrigos%NOTFOUND;

    v_risco := fn_risco_abrigo(v_id);

    DBMS_OUTPUT.PUT_LINE('Abrigo: ' || v_nome || ' | Risco: ' || v_risco);
  END LOOP;
  CLOSE c_abrigos;
END;