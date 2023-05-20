SELECT s.name_songs AS cancao, COUNT(h.id_user) AS reproducoes
FROM SpotifyClone.songs s
JOIN SpotifyClone.historic h ON s.id_songs = h.id_songs
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;