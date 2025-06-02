-- Função Avaliação de Risco por Ocupação
CREATE OR REPLACE FUNCTION fn_risco_abrigo(p_id IN NUMBER)
RETURN VARCHAR2 IS
  v_ocupacao   NUMBER;
  v_capacidade NUMBER;
  v_percentual NUMBER;
  v_risco      VARCHAR2(10);
BEGIN
  SELECT ocupacao, capacidade
  INTO v_ocupacao, v_capacidade
  FROM GS_ABRIGO
  WHERE id = p_id;

  v_percentual := (v_ocupacao / v_capacidade) * 100;

  IF v_percentual < 50 THEN
    v_risco := 'BAIXO';
  ELSIF v_percentual <= 80 THEN
    v_risco := 'MÉDIO';
  ELSE
    v_risco := 'ALTO';
  END IF;

  RETURN v_risco;
END;

-- Teste
SELECT fn_risco_abrigo(1) AS risco FROM dual;


-- Função Ranking do Abrigo por Ocupação
CREATE OR REPLACE FUNCTION fn_posicao_abrigo(p_id IN NUMBER)
RETURN NUMBER IS
  v_posicao NUMBER := 0;
BEGIN
  FOR r IN (
    SELECT id
    FROM GS_ABRIGO
    ORDER BY ocupacao DESC
  ) LOOP
    v_posicao := v_posicao + 1;
    IF r.id = p_id THEN
      RETURN v_posicao;
    END IF;
  END LOOP;
  RETURN NULL; -- Caso não encontre o abrigo
END;

-- Teste
SELECT fn_posicao_abrigo(1) AS ranking FROM dual;

