-- Relatório: Quantidade de Check-ins por Abrigo com Percentual de Ocupação
SELECT
  a.nome AS nome_abrigo,
  a.capacidade,
  a.ocupacao,
  COUNT(c.id) AS total_checkins,
  ROUND((a.ocupacao / a.capacidade) * 100, 1) AS percentual_ocupado
FROM
  GS_ABRIGO a
LEFT JOIN
  GS_CHECKIN c ON c.abrigo_id = a.id
GROUP BY
  a.nome, a.capacidade, a.ocupacao
ORDER BY
  percentual_ocupado DESC;