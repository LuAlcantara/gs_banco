-- Abrigos com Total de Check-ins, Sensores e Último Alerta
SELECT
  a.nome AS nome_abrigo,
  COUNT(DISTINCT c.id) AS total_checkins,
  COUNT(DISTINCT s.id_sensor) AS total_sensores,
  MAX(al.data_alerta) AS ultimo_alerta
FROM
  GS_ABRIGO a
LEFT JOIN
  GS_CHECKIN c ON c.abrigo_id = a.id
LEFT JOIN
  GS_SENSOR s ON s.id_abrigo = a.id
LEFT JOIN
  GS_ALERTA al ON al.id_abrigo = a.id
GROUP BY
  a.nome
ORDER BY
  total_checkins DESC;

-- Últimas Leituras por Sensor com Nome e Região do Abrigo
SELECT
  ab.nome AS nome_abrigo,
  ab.regiao,
  se.tipo_sensor,
  ls.valor,
  ls.data_leitura
FROM
  GS_LEITURA_SENSOR ls
JOIN
  GS_SENSOR se ON ls.id_sensor = se.id_sensor
JOIN
  GS_ABRIGO ab ON se.id_abrigo = ab.id
WHERE
  ls.data_leitura >= SYSDATE - 7 -- últimos 7 dias
ORDER BY
  ls.data_leitura DESC;
  
-- Agrupamento de Usuários por Tipo (Gestor x Cidadão)

SELECT
  tipo_usuario,
  COUNT(*) AS total_usuarios
FROM
  GS_USUARIO
GROUP BY
  tipo_usuario
ORDER BY
  total_usuarios DESC;
  
-- Comparação: Quantidade de Check-ins vs. Ocupação Registrada
SELECT
  a.nome AS nome_abrigo,
  COUNT(c.id) AS checkins_realizados,
  a.ocupacao AS ocupacao_registrada,
  (a.ocupacao - COUNT(c.id)) AS diferenca
FROM
  GS_ABRIGO a
LEFT JOIN
  GS_CHECKIN c ON c.abrigo_id = a.id
GROUP BY
  a.nome, a.ocupacao
ORDER BY
  diferenca DESC;

