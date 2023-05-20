SELECT 
  ROUND(MIN(p.value_plan), 2) AS faturamento_minimo,
  ROUND(MAX(p.value_plan), 2) AS faturamento_maximo,
  ROUND(AVG(p.value_plan), 2) AS faturamento_medio,
  ROUND(SUM(p.value_plan), 2) AS faturamento_total
FROM SpotifyClone.users u
JOIN SpotifyClone.plan_user p ON u.id_plan = p.id_plan;