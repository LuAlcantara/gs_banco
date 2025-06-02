-- PACKAGE USUARIO - ESPECIFICAÇÃO
CREATE OR REPLACE PACKAGE PKG_USUARIO AS

  -- PROCEDURE: INSERIR USUÁRIO
  PROCEDURE INSERIR_USUARIO(
    p_nome IN VARCHAR2,
    p_cpf IN VARCHAR2,
    p_email IN VARCHAR2,
    p_senha IN VARCHAR2,
    p_tipo_usuario IN VARCHAR2
  );

  -- PROCEDURE: ALTERAR USUÁRIO
  PROCEDURE ALTERAR_USUARIO(
    p_id_usuario IN NUMBER,
    p_nome IN VARCHAR2,
    p_cpf IN VARCHAR2,
    p_email IN VARCHAR2,
    p_senha IN VARCHAR2,
    p_tipo_usuario IN VARCHAR2
  );

  -- PROCEDURE: EXCLUIR USUÁRIO
  PROCEDURE EXCLUIR_USUARIO(
    p_id_usuario IN NUMBER
  );

END PKG_USUARIO;

-- PACKAGE USUARIO - IMPLEMENTAÇÃO
CREATE OR REPLACE PACKAGE BODY PKG_USUARIO AS

  -- PROCEDURE INSERIR_USUARIO
  PROCEDURE INSERIR_USUARIO(
    p_nome IN VARCHAR2,
    p_cpf IN VARCHAR2,
    p_email IN VARCHAR2,
    p_senha IN VARCHAR2,
    p_tipo_usuario IN VARCHAR2
  ) IS
  BEGIN
    INSERT INTO GS_USUARIO (nome, cpf, email, senha, tipo_usuario)
    VALUES (p_nome, p_cpf, p_email, p_senha, p_tipo_usuario);
  END INSERIR_USUARIO;

  -- PROCEDURE ALTERAR_USUARIO
  PROCEDURE ALTERAR_USUARIO(
    p_id_usuario IN NUMBER,
    p_nome IN VARCHAR2,
    p_cpf IN VARCHAR2,
    p_email IN VARCHAR2,
    p_senha IN VARCHAR2,
    p_tipo_usuario IN VARCHAR2
  ) IS
  BEGIN
    UPDATE GS_USUARIO
    SET nome = p_nome,
        cpf = p_cpf,
        email = p_email,
        senha = p_senha,
        tipo_usuario = p_tipo_usuario
    WHERE id_usuario = p_id_usuario;
  END ALTERAR_USUARIO;

  -- PROCEDURE EXCLUIR_USUARIO
  PROCEDURE EXCLUIR_USUARIO(
    p_id_usuario IN NUMBER
  ) IS
  BEGIN
    DELETE FROM GS_USUARIO
    WHERE id_usuario = p_id_usuario;
  END EXCLUIR_USUARIO;

END PKG_USUARIO;