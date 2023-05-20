SELECT u.full_name AS pessoa_usuaria, 
COUNT(h.id_songs) AS musicas_ouvidas, 
FORMAT(SUM(s.duration_seconds)/60, 2) AS total_minutos 
FROM SpotifyClone.users u 
JOIN SpotifyClone.historic h ON u.id_user = h.id_user 
JOIN SpotifyClone.songs s ON h.id_songs = s.id_songs 
GROUP BY pessoa_usuaria 
ORDER BY pessoa_usuaria ASC;