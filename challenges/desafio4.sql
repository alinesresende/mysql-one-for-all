SELECT u.full_name AS pessoa_usuaria,
  CASE WHEN MAX(h.date_reproductions) >= '2021-01-01' THEN 'Ativa'
    ELSE 'Inativa' END AS status_pessoa_usuaria
FROM SpotifyClone.users u
JOIN SpotifyClone.historic h ON u.id_user = h.id_user
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria ASC;
