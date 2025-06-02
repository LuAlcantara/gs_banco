-- Trigger Valida��o de Ocupa��o M�xima

CREATE OR REPLACE TRIGGER trg_valida_ocupacao
BEFORE INSERT OR UPDATE ON GS_ABRIGO
FOR EACH ROW
BEGIN
  IF :NEW.ocupacao > :NEW.capacidade THEN
    RAISE_APPLICATION_ERROR(-20001, 'Ocupa��o n�o pode exceder a capacidade total do abrigo.');
  END IF;
END;

-- Teste
UPDATE GS_ABRIGO
SET ocupacao = 200
WHERE id = 1;