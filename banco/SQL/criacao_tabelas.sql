
-- TABELA DE ABRIGOS (compatível com Abrigo.java)
CREATE TABLE GS_ABRIGO (
  id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nome VARCHAR2(100),
  endereco VARCHAR2(200),
  regiao VARCHAR2(100),
  temperatura NUMBER,
  recursos VARCHAR2(255),
  capacidade NUMBER,
  ocupacao NUMBER,
  ativo CHAR(1) CHECK (ativo IN ('S', 'N')),
  responsavel VARCHAR2(100),
  telefone VARCHAR2(20)
);

-- TABELA DE USUÁRIOS (para procedimentos e cursores)
CREATE TABLE GS_USUARIO (
  id_usuario NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nome VARCHAR2(100),
  cpf VARCHAR2(11) UNIQUE,
  email VARCHAR2(100) UNIQUE,
  senha VARCHAR2(100),
  tipo_usuario VARCHAR2(20)
);

-- TABELA DE CHECK-INS (compatível com CheckIn.java e banco)
CREATE TABLE GS_CHECKIN (
  id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nome VARCHAR2(100),
  documento VARCHAR2(20),
  abrigo_id NUMBER,
  data_checkin DATE,
  CONSTRAINT fk_checkin_abrigo FOREIGN KEY (abrigo_id) REFERENCES GS_ABRIGO(id)
);

-- TABELA DE SENSORES (ligada ao abrigo)
CREATE TABLE GS_SENSOR (
  id_sensor NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  tipo_sensor VARCHAR2(50),
  id_abrigo NUMBER,
  CONSTRAINT fk_sensor_abrigo FOREIGN KEY (id_abrigo) REFERENCES GS_ABRIGO(id)
);

-- TABELA DE LEITURAS DE SENSOR (ligada ao sensor)
CREATE TABLE GS_LEITURA_SENSOR (
  id_leitura NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  id_sensor NUMBER,
  valor VARCHAR2(50),
  data_leitura DATE,
  CONSTRAINT fk_leitura_sensor FOREIGN KEY (id_sensor) REFERENCES GS_SENSOR(id_sensor)
);

-- TABELA DE ALERTAS (ligada ao abrigo)
CREATE TABLE GS_ALERTA (
  id_alerta NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  id_abrigo NUMBER,
  tipo_alerta VARCHAR2(50),
  mensagem VARCHAR2(255),
  data_alerta DATE,
  CONSTRAINT fk_alerta_abrigo FOREIGN KEY (id_abrigo) REFERENCES GS_ABRIGO(id)
);