-- Descomente e altere as linhas abaixo:
-- #

DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plan_user(
  id_plan INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
  type_plan VARCHAR(40) UNIQUE NOT NULL,
  value_plan DECIMAL(3,2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.users(
  id_user INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
  full_name VARCHAR(40) NOT NULL,
  age_user INT NOT NULL,
  id_plan INT NOT NULL,
  FOREIGN KEY (id_plan) REFERENCES plan_user (id_plan),
  date_signture DATE NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.artist(
  id_artist INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
  artist_name VARCHAR(40) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
  id_album INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
  album_name VARCHAR(40) NOT NULL,
  release_year YEAR NOT NULL,
  id_artist INT, 
  FOREIGN KEY (id_artist) REFERENCES artist (id_artist)
) engine = InnoDB;

CREATE TABLE SpotifyClone.follow_artist(
  id_user INT NOT NULL,
  id_artist INT NOT NULL,
  FOREIGN KEY (id_user) REFERENCES users (id_user),
  FOREIGN KEY (id_artist) REFERENCES artist (id_artist),
  CONSTRAINT PRIMARY KEY (id_user, id_artist)
) engine = InnoDB;


CREATE TABLE SpotifyClone.songs(
  id_songs INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
  name_songs VARCHAR(40) NOT NULL,
  duration_seconds DOUBLE NOT NULL,
  id_artist INTEGER,
  id_album INTEGER,
  FOREIGN KEY (id_artist) REFERENCES artist (id_artist),
  FOREIGN KEY (id_album) REFERENCES album (id_album)
) engine = InnoDB;

CREATE TABLE SpotifyClone.historic(
  id_user INTEGER,
  id_songs INTEGER,
  date_reproductions DATETIME NOT NULL,
  CONSTRAINT PRIMARY KEY (id_user, id_songs),
  FOREIGN KEY (id_user) REFERENCES users (id_user),
  FOREIGN KEY (id_songs) REFERENCES songs (id_songs)
) engine = InnoDB;


INSERT INTO SpotifyClone.plan_user (id_plan, type_plan, value_plan)
  VALUES
    (1, 'gratuito', 0.00),
    (3, 'universitario', 5.99),
    (4, 'pessoal', 6.99),
    (2, 'familiar', 7.99);

INSERT INTO SpotifyClone.users (id_user, full_name, age_user, id_plan, date_signture)
  VALUES
    (1, 'Barbara Liskov', 82, 1, '2019-10-20'),
    (2, 'Robert Cecil Martin', 58, 1, '2017-01-06'),
    (3, 'Ada Lovelace', 37, 2, '2017-12-30'),
    (4, 'Martin Fowler', 46, 2, '2017-01-17'),
    (5, 'Sandi Metz', 58, 2, '2018-04-29'),
    (6, 'Paulo Freire', 19, 3, '2018-02-14'),
    (7, 'Bell Hooks', 26, 3, '2018-01-05'),
    (8, 'Christopher Alexander', 85, 4, '2019-06-05'),
    (9,'Judith Butler', 45, 4, '2019-06-05'),
    (10, 'Jorge Amado', 58, 4, '2019-06-05');


INSERT INTO SpotifyClone.artist (id_artist, artist_name)
  VALUES
    (1, 'Beyoncé'),
    (2, 'Queen'),
    (3, 'Elis Regina'),
    (4, 'Baco Exu do Blues'),
    (5, 'Blind Guardian'),
    (6, 'Nina Simone');

INSERT INTO SpotifyClone.album (id_album, album_name, release_year, id_artist)
  VALUES
    (1, 'Renaissance', 2022, 1),
    (2, 'Jazz', 1978, 2),
    (3, 'Hot Space', 1982, 2),
    (4, 'Falso Brilhante', 1998, 3),
    (5, 'Vento de Maio', 2001, 3),
    (6, 'QVVJFA?', 2003, 4),
    (7, 'Somewhere Far Beyond', 2007, 5),
    (8, 'I Put A Spell On You', 2012, 6);

INSERT INTO SpotifyClone.follow_artist (id_user, id_artist)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);
    

INSERT INTO SpotifyClone.songs (id_songs, name_songs, duration_seconds, id_artist, id_album)
  VALUES
    (1, 'BREAK MY SOUL', 279, 1, 1),
    (2, 'VIRGOS GROOVE', 369, 1, 1),
    (3, 'ALIEN SUPERSTAR', 116, 1, 1),
    (4, 'Dont Stop Me Now', 203, 2, 2),
    (5, 'Under Pressure', 152, 2, 3),
    (6, 'Como Nossos Pais', 105, 3, 4),
    (7, 'O Medo de Amar é o Medo de Ser Livre', 207, 3, 5),
    (8, 'Samba em Paris', 267, 4, 6),
    (9, 'The Bards Song', 244, 5, 7),
    (10,'Feeling Good', 100, 6, 8);

INSERT INTO SpotifyClone.historic (id_user, id_songs, date_reproductions)
  VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'), 
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'), 
    (8, 4, '2012-03-17 14:56:41'), 
    (9, 9, '022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');
    

