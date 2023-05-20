SELECT COUNT(*) AS musicas_no_historico
FROM SpotifyClone.historic h
JOIN SpotifyClone.users u ON h.id_user = u.id_user
WHERE u.full_name = 'Barbara Liskov';