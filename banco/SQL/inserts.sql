-- INSERÇÃO DE DADOS REALISTAS PARA O SISTEMA DE GESTÃO DE ABRIGOS

-- ABRIGOS
INSERT INTO GS_ABRIGO (nome, endereco, regiao, temperatura, recursos, capacidade, ocupacao, ativo, responsavel, telefone) VALUES 
('Abrigo Esperan�a', 'Rua das Palmeiras, 120', 'Zona Sul', 25.3, '�gua, Alimentos, Atendimento M�dico', 100, 72, 'S', 'Mariana Silva', '(11) 99887-1234');

INSERT INTO GS_ABRIGO (nome, endereco, regiao, temperatura, recursos, capacidade, ocupacao, ativo, responsavel, telefone) VALUES 
('Centro Comunit�rio Vida', 'Av. Central, 850', 'Zona Norte', 22.8, '�gua, Roupas, Atendimento M�dico', 80, 65, 'S', 'Carlos Nunes', '(11) 98845-6789');

INSERT INTO GS_ABRIGO (nome, endereco, regiao, temperatura, recursos, capacidade, ocupacao, ativo, responsavel, telefone) VALUES 
('Ref�gio da Paz', 'Travessa Alegre, 45', 'Zona Leste', 24.1, 'Alimentos, Roupas', 60, 30, 'S', 'Ana Rocha', '(11) 91234-5678');

INSERT INTO GS_ABRIGO (nome, endereco, regiao, temperatura, recursos, capacidade, ocupacao, ativo, responsavel, telefone) VALUES 
('Abrigo S�o Jos�', 'Rua da Esperan�a, 200', 'Zona Oeste', 26.4, '�gua, Alimentos, Roupas, Atendimento M�dico', 120, 110, 'S', 'Jo�o Pedro', '(11) 97890-1230');

INSERT INTO GS_ABRIGO (nome, endereco, regiao, temperatura, recursos, capacidade, ocupacao, ativo, responsavel, telefone) VALUES 
('Ponto de Apoio Nova Vida', 'Rua dos L�rios, 322', 'Centro', 23.5, '�gua, Alimentos', 90, 87, 'S', 'Patr�cia Lima', '(11) 99999-8888');

-- USU�RIOS
INSERT INTO GS_USUARIO (nome, cpf, email, senha, tipo_usuario) VALUES 
('Lucas Andrade', '12345678901', 'lucas.andrade@email.com', 'senha123', 'cidad�o');

INSERT INTO GS_USUARIO (nome, cpf, email, senha, tipo_usuario) VALUES 
('Fernanda Costa', '23456789012', 'fernanda.costa@email.com', 'segura456', 'gestor');

INSERT INTO GS_USUARIO (nome, cpf, email, senha, tipo_usuario) VALUES 
('Rafael Gomes', '34567890123', 'rafael.gomes@email.com', 'pass789', 'cidad�o');

INSERT INTO GS_USUARIO (nome, cpf, email, senha, tipo_usuario) VALUES 
('Juliana Silva', '45678901234', 'juliana.silva@email.com', 'juliana2024', 'cidad�o');

INSERT INTO GS_USUARIO (nome, cpf, email, senha, tipo_usuario) VALUES 
('Eduardo Lima', '56789012345', 'eduardo.lima@email.com', 'eduL!ma12', 'gestor');

-- CHECK-INS
INSERT INTO GS_CHECKIN (nome, documento, abrigo_id, data_checkin) VALUES 
('Paula Oliveira', '98765432100', 1, TO_DATE('2025-05-28', 'YYYY-MM-DD'));

INSERT INTO GS_CHECKIN (nome, documento, abrigo_id, data_checkin) VALUES 
('Marcos Paulo', '87654321099', 2, TO_DATE('2025-05-29', 'YYYY-MM-DD'));

INSERT INTO GS_CHECKIN (nome, documento, abrigo_id, data_checkin) VALUES 
('Let�cia Santos', '76543210988', 3, TO_DATE('2025-05-30', 'YYYY-MM-DD'));

INSERT INTO GS_CHECKIN (nome, documento, abrigo_id, data_checkin) VALUES 
('Joana Duarte', '65432109877', 4, TO_DATE('2025-06-01', 'YYYY-MM-DD'));

INSERT INTO GS_CHECKIN (nome, documento, abrigo_id, data_checkin) VALUES 
('Thiago Martins', '54321098766', 5, TO_DATE('2025-06-01', 'YYYY-MM-DD'));

-- SENSORES
INSERT INTO GS_SENSOR (tipo_sensor, id_abrigo) VALUES 
('Sensor de Temperatura', 1);

INSERT INTO GS_SENSOR (tipo_sensor, id_abrigo) VALUES 
('Sensor de Umidade', 2);

INSERT INTO GS_SENSOR (tipo_sensor, id_abrigo) VALUES 
('Sensor de Fuma�a', 3);

INSERT INTO GS_SENSOR (tipo_sensor, id_abrigo) VALUES 
('Sensor de Qualidade do Ar', 4);

INSERT INTO GS_SENSOR (tipo_sensor, id_abrigo) VALUES 
('Sensor de Movimento', 5);

-- LEITURAS DE SENSOR
INSERT INTO GS_LEITURA_SENSOR (id_sensor, valor, data_leitura) VALUES 
(1, '27.4', TO_DATE('2025-06-01 14:30', 'YYYY-MM-DD HH24:MI'));

INSERT INTO GS_LEITURA_SENSOR (id_sensor, valor, data_leitura) VALUES 
(2, '58%', TO_DATE('2025-06-01 14:35', 'YYYY-MM-DD HH24:MI'));

INSERT INTO GS_LEITURA_SENSOR (id_sensor, valor, data_leitura) VALUES 
(3, '0.02 ppm', TO_DATE('2025-06-01 14:40', 'YYYY-MM-DD HH24:MI'));

INSERT INTO GS_LEITURA_SENSOR (id_sensor, valor, data_leitura) VALUES 
(4, 'Boa', TO_DATE('2025-06-01 14:45', 'YYYY-MM-DD HH24:MI'));

INSERT INTO GS_LEITURA_SENSOR (id_sensor, valor, data_leitura) VALUES 
(5, 'Detectado', TO_DATE('2025-06-01 14:50', 'YYYY-MM-DD HH24:MI'));

-- ALERTAS
INSERT INTO GS_ALERTA (id_abrigo, tipo_alerta, mensagem, data_alerta) VALUES 
(1, 'Temperatura Alta', 'A temperatura no abrigo ultrapassou 27�C', TO_DATE('2025-06-01 15:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO GS_ALERTA (id_abrigo, tipo_alerta, mensagem, data_alerta) VALUES 
(2, 'Umidade Elevada', 'Umidade acima de 55% detectada', TO_DATE('2025-06-01 15:05', 'YYYY-MM-DD HH24:MI'));

INSERT INTO GS_ALERTA (id_abrigo, tipo_alerta, mensagem, data_alerta) VALUES 
(3, 'Fuma�a Detectada', 'Poss�vel foco de inc�ndio identificado', TO_DATE('2025-06-01 15:10', 'YYYY-MM-DD HH24:MI'));

INSERT INTO GS_ALERTA (id_abrigo, tipo_alerta, mensagem, data_alerta) VALUES 
(4, 'Ar Ruim', 'Qualidade do ar abaixo do ideal', TO_DATE('2025-06-01 15:15', 'YYYY-MM-DD HH24:MI'));

INSERT INTO GS_ALERTA (id_abrigo, tipo_alerta, mensagem, data_alerta) VALUES 
(5, 'Movimento Suspeito', 'Movimento detectado fora do hor�rio previsto', TO_DATE('2025-06-01 15:20', 'YYYY-MM-DD HH24:MI'));