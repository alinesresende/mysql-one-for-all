SELECT a.artist_name AS artista, al.album_name AS album
FROM SpotifyClone.album AS al
INNER JOIN SpotifyClone.artist AS a ON a.id_artist = al.id_artist
WHERE a.artist_name = 'Elis Regina'
ORDER BY al.album_name ASC;