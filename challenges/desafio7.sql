SELECT a.artist_name AS artista, 
  al.album_name AS album, 
  COUNT(DISTINCT f.id_user) AS pessoas_seguidoras
FROM SpotifyClone.artist a
JOIN SpotifyClone.album al ON al.id_artist = a.id_artist
LEFT JOIN SpotifyClone.follow_artist f ON f.id_artist = a.id_artist
GROUP BY a.id_artist, al.id_album
ORDER BY pessoas_seguidoras DESC, artista ASC, album ASC;