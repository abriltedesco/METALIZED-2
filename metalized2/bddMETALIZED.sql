CREATE DATABASE Metalized;
USE Metalized;

CREATE TABLE Usuario (
    id int not null auto_increment,
    nombreUser varchar(30),
    email varchar(45),
    contraseña varchar(45),
    primary key (id)
);
 
CREATE TABLE Cancion (
    id int not null,
    titulo varchar(45) NOT NULL,
    genero varchar(45),
    duracion time,
    idAlbum int, 
    primary key (id),
    foreign key (idAlbum) references Album(id)
);

CREATE TABLE Usuario_escucha_Cancion(
	id int auto_increment primary key,
    idUsuario int,
    idCancion int,
    plays datetime,
    foreign key (idUsuario) references Usuario(id),
    foreign key (idCancion) references Cancion(id)
);

drop table Usuario_escucha_Cancion;

CREATE TABLE Album (
    id int not null,
    titulo varchar(45),
    imagen varchar(45),
    fecha date,
    genero varchar(45),
    idArtista int,
    primary key (id),
    foreign key (idArtista) references Artista(id)
);

CREATE TABLE Artista (
    id int not null,
    imagen varchar(45),
    nombre varchar(45),
    bio varchar(1000),
    genero varchar(45),
    primary key (id)
);

/*CREATE TABLE Playlist (
    id int not null,
    imagen varchar(45),
    nombre varchar(45),
    idUsuario int,
    primary key (id),
    foreign key (idUsuario) references Usuario(id)
);
 
CREATE TABLE Playlist_tiene_Cancion(
    idPlaylist int,
    idCancion int,
	diayhora_añadida datetime,
    primary key (idCancion, idPlaylist),
    foreign key (idPlaylist) references Playlist(id),
    foreign key (idCancion) references Cancion(id)
);*/

/*--------------- CONSULTAS ---------------------*/
/* --- artista mas escuchada --- */
SELECT Album.imagen, Cancion.titulo, Artista.nombre, plays FROM Usuario
JOIN Usuario_escucha_Cancion ON idUsuario = Usuario.id
JOIN Cancion ON idCancion = Cancion.id
JOIN Album ON idAlbum = Album.id
JOIN Artista ON idArtista = Artista.id 
WHERE nombreUser = "delfi"
ORDER BY plays ASC LIMIT 15;

/* ---- ALBUM POPULAR ---- */
SELECT Album.imagen, Album.titulo, Artista.nombre, count(*) FROM Usuario
JOIN Usuario_escucha_Cancion ON idUsuario = Usuario.id
JOIN Cancion ON idCancion = Cancion.id
JOIN Album ON idAlbum = Album.id
JOIN Artista ON idArtista = Artista.id 
GROUP BY idCancion ORDER BY count(*) DESC LIMIT 15;

/* ---- ARTISTA POPULAR --- */
SELECT Artista.nombre, count(*) FROM Usuario
JOIN Usuario_escucha_Cancion ON idUsuario = Usuario.id
JOIN Cancion ON idCancion = Cancion.id
JOIN Album ON idAlbum = Album.id
JOIN Artista ON idArtista = Artista.id 
GROUP BY idCancion ORDER BY count(*) DESC LIMIT 15;

/* ---- ALBUM MTSE ---- */
SELECT Album.imagen, Album.titulo, Artista.nombre, MAX(plays) 
AS ultEscucha FROM Usuario
JOIN Usuario_escucha_Cancion ON idUsuario = Usuario.id
JOIN Cancion ON idCancion = Cancion.id
JOIN Album ON idAlbum = Album.id
JOIN Artista ON idArtista = Artista.id 
WHERE nombreUser = "nombre"
GROUP BY Album.id, idUsuario ORDER BY ultEscucha ASC LIMIT 15;

SELECT Album.titulo, Album.imagen, Artista.nombre AS nombre FROM Usuario_escucha_Cancion
JOIN Cancion JOIN Usuario_escucha_Cancion ON Cancion.id = idCancion  
JOIN Album ON Album.id = Cancion.idAlbum
JOIN Artista ON Artista.id = Album.idArtista WHERE idUsuario = 1 
GROUP BY idCancion ORDER BY count(*) DESC, plays ASC;
/*".$_SESSION['idUsuario']." */

SELECT Artista.imagen, Artista.nombre, MIN(plays) 
AS ultEscucha FROM Usuario_escucha_Cancion
JOIN Cancion ON idCancion = Cancion.id
JOIN Album ON idAlbum = Album.id
JOIN Artista ON idArtista = Artista.id 
WHERE idUsuario = 1
GROUP BY Cancion.id, idUsuario ORDER BY ultEscucha ASC LIMIT 15;


/* ---- ARTISTAS PARA METALIZED.PHP ---- */
SELECT Artista.id, Artista.imagen, Artista.nombre FROM Album 
JOIN Artista ON Artista.id = Album.idArtista
JOIN Cancion ON Cancion.idAlbum = Album.id
JOIN Usuario_escucha_Cancion ON Cancion.id = Usuario_escucha_Cancion.idCancion 
JOIN Usuario ON idUsuario = Usuario.id
GROUP BY Artista.id, Usuario.nombreUser HAVING Usuario.nombreUser = "delfi"
ORDER BY count(plays) DESC LIMIT 5;

/* --- albumes mas escuchada --- */
SELECT Album.imagen, Artista.nombre, count(*) as cant FROM Artista 
JOIN Album ON idArtista = Artista.id
JOIN Cancion ON idAlbum = Album.id
JOIN Usuario_escucha_Cancion ON Cancion.id = Usuario_escucha_Cancion.idCancion  
JOIN Usuario ON idUsuario = Usuario.id
WHERE nombreUser = "aby" 
GROUP BY idAlbum ORDER BY cant DESC;
/* --- artistas populares --- */
SELECT Artista.nombre, Artista.imagen, COUNT(*) AS total FROM Usuario_escucha_Cancion
JOIN Cancion ON idCancion = Cancion.id
JOIN Album ON idAlbum = Album.id
JOIN Artista ON idArtista = Artista.id 
GROUP BY Artista.id 
ORDER BY total DESC LIMIT 15;

/*--------------------------------------*/

INSERT INTO Usuario VALUES (2, "user", "user@gmail.com", "user1234");
UPDATE Artista SET imagen = "thesmiths.jpg" WHERE nombre = "The Smiths";
INSERT INTO Usuario_escucha_Cancion (idUsuario, idCancion, plays) VALUES 
/*(1,4,"2024-09-27 15:46:45"), 
(1,5,"2024-09-27 15:45:45"), 
(1,3,"2024-09-26 18:45:35"), 
(1,6,"2024-09-27 13:56:45"), 
(1,2,"2024-09-25 16:25:15"),
(1,5,"2024-08-27 14:35:45"),
(1,5,"2024-09-27 15:59:49"),  
(1,5,"2024-09-25 13:45:45"),
(1,5,"2024-09-27 15:45:45"), 
(1,2,"2024-05-27 15:45:45"), 
(1,3,"2024-09-08 12:45:45"), 
(1,6,"2024-06-27 13:45:15"), 
(1,3,"2024-09-21 15:05:45"), 
(1,6,"2024-09-23 17:45:45"),
(1, 7, "2024-09-15 16:05:12"),
(1, 9, "2024-09-20 10:22:34"),
(1, 12, "2024-09-28 11:14:47"),
(1, 17, "2024-10-01 12:33:22"),
(1, 22, "2024-10-05 09:18:45"),
(1, 34, "2024-10-10 18:30:12"),
(1, 35, "2024-10-11 14:25:33"),
(1, 39, "2024-10-12 20:45:22"),
(1, 47, "2024-10-14 17:50:45"),
(1, 56, "2024-10-16 19:12:08"),
(1,4,"2024-09-20 15:46:45"), 
(1,5,"2023-09-28 15:45:45"), 
(1,40,"2024-05-26 18:47:35"), 
(1,6,"2023-06-27 13:56:45"), 
(1,2,"2023-06-15 16:26:15"),
(1,5,"2023-08-27 14:35:45"),
(1,5,"2024-09-27 15:52:49"),  
(1,6,"2024-09-25 13:45:45"),
(1,40,"2024-09-27 15:45:45"), 
(1,40,"2024-05-27 15:45:45"), 
(1,3,"2024-09-08 12:45:45"), 
(1,6,"2024-06-27 13:45:15"), 
(1,40,"2024-09-21 15:05:45"), 
(1,6,"2024-09-23 17:45:45"),
(1, 7, "2024-09-15 16:05:12"),
(1, 9, "2024-09-20 10:22:34"),
(1, 12, "2024-09-28 11:14:47"),
(1, 17, "2024-10-01 12:33:22"),
(1, 22, "2024-10-05 09:18:45"),
(1, 34, "2024-10-10 18:30:12"),
(1, 35, "2024-10-11 14:25:33"),
(1, 39, "2024-10-12 20:45:22"),
(1, 47, "2024-10-14 17:50:45"),
(1, 56, "2024-10-16 19:12:08"),
(1,24,"2024-09-20 15:46:45"), 
(1,25,"2023-09-28 15:45:45"), 
(1,40,"2024-05-26 18:47:35"), 
(1,6,"2023-06-27 13:56:45"), 
(1,2,"2023-06-15 16:26:15"),
(1,35,"2023-08-27 14:35:45"),
(1,35,"2024-09-27 15:52:49"),  
(1,36,"2024-09-25 13:45:45"),
(1,40,"2024-09-27 15:45:45"), 
(1,40,"2024-05-27 15:45:45"), 
(1,3,"2024-09-08 12:45:45"), 
(1,6,"2024-06-27 13:45:15"), 
(1,40,"2024-09-21 15:05:45"), 
(1,6,"2024-09-23 17:45:45"),
(1, 7, "2024-09-15 16:05:12"),
(1, 19, "2024-10-20 10:22:34"),
(1, 15, "2024-10-20 11:14:47"),
(1, 17, "2024-10-21 12:33:22"),
(1, 16, "2024-10-19 09:18:45"),
(1, 19, "2024-10-11 18:30:12"),
(1, 35, "2024-10-11 14:25:33"),
(1, 39, "2024-10-12 20:45:22"),
(1, 47, "2024-10-14 17:50:45"),
(1, 56, "2024-10-16 19:12:08");
(2, 8, "2024-09-10 15:30:22"),
(2, 14, "2024-09-18 11:25:40"),
(2, 19, "2024-09-25 09:34:21"),
(2, 23, "2024-09-30 14:47:09"),
(2, 29, "2024-10-03 16:18:54"),
(2, 30, "2024-10-06 18:35:12"),
(2, 37, "2024-10-08 10:12:34"),
(2, 41, "2024-10-11 12:45:20"),
(2, 50, "2024-10-13 17:52:45"),
(2, 61, "2024-10-17 20:20:18"),
(3, 11, "2024-09-05 14:12:30"),
(3, 15, "2024-09-17 16:42:18"),
(3, 18, "2024-09-21 13:10:50"),
(3, 25, "2024-09-27 19:24:12"),
(3, 28, "2024-09-30 11:45:23"),
(3, 32, "2024-10-02 14:55:35"),
(3, 33, "2024-10-05 16:05:12"),
(3, 38, "2024-10-09 18:22:44"),
(3, 43, "2024-10-13 12:00:32"),
(3, 52, "2024-10-18 10:34:11"),
(1, 7, "2024-09-15 16:05:12"),
(1, 7, "2024-09-20 18:30:12"),
(1, 7, "2024-09-25 10:45:00"),
(1, 7, "2024-10-01 12:33:22"),
(1, 7, "2024-09-15 16:05:12"),
(1, 7, "2024-09-20 18:30:12"),
(1, 7, "2024-09-25 10:45:00"),
(1, 7, "2024-10-01 12:33:22"),
(1, 4, "2024-09-27 15:46:45"),
(1, 5, "2024-09-27 15:45:45"),
(1, 3, "2024-09-26 18:45:35"),
(1, 6, "2024-09-27 13:56:45"),
(1, 9, "2024-09-20 10:22:34"),
(1, 12, "2024-10-01 11:14:47"),
(2, 12, "2024-09-10 14:22:18"),
(2, 12, "2024-09-15 16:20:12"),
(2, 12, "2024-09-20 12:33:45"),
(2, 4, "2024-09-21 18:00:00"),
(2, 5, "2024-09-30 15:15:30"),
(2, 6, "2024-10-01 20:14:12"),
(2, 8, "2024-10-02 10:30:22"),
(2, 17, "2024-10-05 12:45:00"),
(2, 22, "2024-10-06 08:12:05"),
(2, 27, "2024-10-09 14:55:15"),
(3, 9, "2024-09-05 11:11:11"),
(3, 9, "2024-09-10 09:09:09"),
(3, 9, "2024-09-15 18:18:18"),
(3, 1, "2024-09-20 16:30:30"),
(3, 2, "2024-09-25 13:45:45"),
(3, 3, "2024-09-30 20:22:22"),
(3, 4, "2024-10-01 15:10:10"),
(3, 5, "2024-10-05 14:20:20"),
(3, 12, "2024-10-08 11:15:15"),
(3, 18, "2024-10-10 17:45:45"),
(4, 6, "2024-09-02 12:30:12"),
(4, 6, "2024-09-05 15:00:00"),
(4, 6, "2024-09-15 10:10:10"),
(4, 8, "2024-09-20 14:14:14"),
(4, 10, "2024-09-25 19:19:19"),
(4, 11, "2024-10-01 11:11:11"),
(4, 13, "2024-10-02 16:16:16"),
(4, 14, "2024-10-03 12:30:12"),
(4, 19, "2024-10-05 20:20:20"),
(4, 20, "2024-10-07 17:45:45"),
(5, 35, "2024-09-12 09:30:30"),
(5, 35, "2024-09-15 14:14:14"),
(5, 35, "2024-09-22 11:11:11"),
(5, 2, "2024-09-30 16:45:45"),
(5, 3, "2024-10-01 19:50:50"),
(5, 4, "2024-10-05 14:05:05"),
(5, 5, "2024-10-07 10:10:10"),
(5, 18, "2024-10-09 12:12:12"),
(5, 22, "2024-10-10 17:45:45"),
(5, 26, "2024-10-11 16:30:30"),
(4, 9, "2024-09-05 11:11:11"),
(5, 9, "2024-09-10 09:09:09"),
(6, 19, "2024-09-15 18:18:18"),
(3, 1, "2024-09-20 16:30:30"),
(6, 12, "2024-09-25 13:45:45"),
(3, 3, "2024-09-30 20:22:22"),
(3, 4, "2024-10-01 15:10:10"),
(3, 5, "2024-10-05 14:20:20"),
(3, 12, "2024-10-08 11:15:15"),
(3, 18, "2024-10-10 17:45:45"),
(4, 6, "2024-09-02 12:30:12"),
(4, 6, "2024-09-05 15:00:00"),
(4, 6, "2024-09-15 10:10:10"),
(4, 8, "2024-09-20 14:14:14"),
(4, 10, "2024-09-25 19:19:19"),
(6, 11, "2024-10-01 11:11:11"),
(6, 13, "2024-10-02 16:16:16"),
(6, 19, "2024-10-03 12:30:12"),
(6, 19, "2024-10-05 20:20:20"),
(6, 22, "2024-10-07 17:45:45"),
(6, 31, "2024-09-12 09:30:30"),
(6, 33, "2024-09-15 14:14:14"),
(6, 33, "2024-10-23 11:11:11"),
(6, 2, "2024-07-24 16:45:45"),
(6, 3, "2024-10-01 19:50:50"),
(6, 4, "2024-10-23 14:05:05"),
(6, 5, "2024-10-23 10:10:10"),
(6, 18, "2024-10-22 12:12:12"),
(5, 22, "2024-10-10 17:45:45"),
(5, 26, "2024-10-11 16:30:30");*/
(7, 9, "2024-01-05 11:11:11"),
(7, 29, "2024-09-10 09:09:09"),
(7, 19, "2024-06-15 18:18:18"),
(7, 1, "2023-02-20 16:30:30"),
(7, 12, "2024-09-25 13:45:45"),
(7, 32, "2024-09-30 20:22:22"),
(7, 40, "2024-03-01 15:10:10"),
(7, 45, "2024-03-05 14:20:20"),
(7, 12, "2024-10-08 11:15:15"),
(7, 38, "2024-10-10 17:45:45"),
(7, 56, "2024-09-02 12:30:12"),
(7, 46, "2024-09-05 15:00:00"),
(7, 6, "2024-09-15 10:10:10"),
(7, 8, "2024-09-20 14:14:14"),
(7, 10, "2024-09-25 19:19:19"),
(7, 11, "2024-10-01 11:11:11"),
(7, 49, "2024-10-02 16:16:16"),
(7, 49, "2024-10-03 12:30:12"),
(7, 49, "2024-10-05 20:20:20"),
(7, 22, "2024-10-07 17:45:45"),
(7, 31, "2024-09-12 09:30:30"),
(7, 32, "2024-09-15 14:14:14"),
(7, 34, "2024-10-23 11:11:11"),
(7, 2, "2024-07-24 16:45:45"),
(7, 53, "2024-10-01 19:50:50"),
(7, 56, "2024-10-24 14:05:05"),
(7, 53, "2024-10-24 10:10:10"),
(7, 8, "2024-10-22 12:12:12"),
(7, 22, "2024-10-10 17:45:45"),
(7, 26, "2024-10-11 16:30:30");



INSERT INTO Cancion VALUES 
(1, "Highway to Hell", "Hard Rock","03:29" , 1),
(2, "Master of Puppets", "Thrash Metal", "08:03", 2),
(3, "Girls got Rythm", "Hard Rock", "03:24", 1),
(4, "Psychotron", "Heavy Metal", "04:42", 4),		
(5, "Wind of Change", "Hard Rock", "05:12", 5),
(6, "Heaven's on Fire", "Glam Metal", "03:20", 6),
(7, "The Queen Is Dead", "Rock Alternativo", "06:23", 16),
(8, "I Know It's Over", "Rock Alternativo", "05:48", 16),
(9, "Bigmouth Strikes Again", "Rock Alternativo", "03:12", 16),
(10, "Meat Is Murder", "Rock Alternativo", "06:05", 29),
(11, "Nowhere Fast", "Rock Alternativo", "02:37", 29),
(12, "Welcome to the Jungle", "Hard Rock", "04:31", 7),
(13, "Sweet Child O' Mine", "Hard Rock", "05:56", 7),
(14, "November Rain", "Hard Rock", "08:57", 30),
(15, "Don't Cry", "Hard Rock", "04:44", 30),
(16, "Paradise City", "Hard Rock", "06:46", 7),
(17, "Back In Black", "Hard Rock", "04:15", 34),
(18, "You Shook Me All Night Long", "Hard Rock", "03:30", 34),
(19, "Let There Be Rock", "Hard Rock", "06:06", 35),
(20, "Touch Too Much", "Hard Rock", "04:27", 1),
(21, "Rock 'n' Roll Damnation", "Hard Rock", "03:37", 35),
(22, "The Number of the Beast", "Heavy Metal", "04:50", 25),
(23, "Run to the Hills", "Heavy Metal", "03:54", 25),
(24, "The Trooper", "Heavy Metal", "04:12", 39),
(25, "Revelations", "Heavy Metal", "06:48", 39),
(26, "Flight of Icarus", "Heavy Metal", "03:50", 39),
(27, "Battery", "Thrash Metal", "05:12", 2),
(28, "Ride the Lightning", "Thrash Metal", "06:37", 14),
(29, "Fade to Black", "Thrash Metal", "06:56", 14),
(30, "For Whom the Bell Tolls", "Thrash Metal", "05:10", 14),
(31, "Disposable Heroes", "Thrash Metal", "08:16", 2),
(32, "Violet", "Grunge", "03:24", 17),
(33, "Doll Parts", "Grunge", "03:31", 17),
(34, "Miss World", "Grunge", "03:26", 17),
(35, "War Pigs", "Heavy Metal", "07:55", 18),
(36, "Iron Man", "Heavy Metal", "05:55", 18),
(37, "Paranoid", "Heavy Metal", "02:48", 18),
(38, "Money", "Rock Progresivo", "06:22", 19),
(39, "Time", "Rock Progresivo", "07:06", 19),
(40, "Us and Them", "Rock Progresivo", "07:49", 19),
(41, "Bohemian Rhapsody", "Rock", "05:54", 20),
(42, "You're My Best Friend", "Rock", "02:52", 20),
(43, "Love of My Life", "Rock", "03:39", 20),
(44, "Smoke on the Water", "Hard Rock", "05:40", 21),
(45, "Highway Star", "Hard Rock", "06:05", 21),
(46, "Space Truckin'", "Hard Rock", "04:31", 21),
(47, "American Idiot", "Punk Rock", "02:54", 22),
(48, "Boulevard of Broken Dreams", "Punk Rock", "04:20", 22),
(49, "Holiday", "Punk Rock", "03:52", 22),
(50, "Livin' on a Prayer", "Rock", "04:09", 23),
(51, "You Give Love a Bad Name", "Rock", "03:43", 23),
(52, "Wanted Dead or Alive", "Rock", "05:08", 23),
(53, "Stairway to Heaven", "Hard Rock", "08:02", 24),
(54, "Black Dog", "Hard Rock", "04:55", 24),
(55, "Rock and Roll", "Hard Rock", "03:40", 24),
(56, "Left Behind", "Nu Metal", "04:01", 26),
(57, "People = Shit", "Nu Metal", "03:35", 26),
(58, "The Heretic Anthem", "Nu Metal", "04:12", 26),
(59, "Change (In the House of Flies)", "Metal Alternativo", "05:00", 27),
(60, "Digital Bath", "Metal Alternativo", "04:15", 27),
(61, "Knife Prty", "Metal Alternativo", "04:49", 27),
(62, "Breaking the Law", "Heavy Metal", "02:34", 28),
(63, "Living After Midnight", "Heavy Metal", "03:30", 28),
(64, "Metal Gods", "Heavy Metal", "04:00", 28);

                  
INSERT INTO Artista VALUES 
(1, "hth.jpg", "AC/DC", "Es una banda australiana de hard rock formada en Sídney en 1973 por los hermanos Malcolm y Angus Young.", "Hard Rock"),
(2, "metallica.png", "Metallica", "Es una banda estadounidense de thrash metal formada en 1981 en Los Ángeles, conocida por su gran impacto en el heavy metal.", "Metal"),
(3, "kiss.jpg", "Kiss", "Es una banda estadounidense de rock formada en Nueva York en 1973 por Gene Simmons (bajo), Paul Stanley (guitarra y voz) y Peter Criss (batería), a los que más tarde se uniría Ace Frehley (guitarra).", "Glam Metal"),
(4, "scorpions.jpg", "Scorpions", "Es una banda alemana de hard rock y heavy metal formada en 1965, conocida por baladas icónicas y su sonido potente.", "Metal"),
(5, "megadeth.jpeg", "Megadeth", "Es una banda estadounidense de thrash metal fundada por Dave Mustaine en 1983, conocida por sus complejas composiciones.", "Heavy Metal"),
(6, "mayhem.jpeg", "Mayhem", "Es una banda noruega de black metal formada en 1984, considerada pionera del género y conocida por su historia controversial.", "Black Metal"),
(7, "motleyCrue.jpg", "Motley Crue", "Es una banda estadounidense de glam metal formada en Los Ángeles en 1981, conocida por su imagen rebelde y sus shows enérgicos.", "Glam Metal"),
(8, "sodaStereo.jpg", "Soda Stereo", "Es una banda argentina de rock formada en 1982 en Buenos Aires, liderada por Gustavo Cerati, considerada una de las más influyentes del rock latinoamericano.", "Rock Nacional"),
(9, "soad.jpg", "System Of A Down", "Es una banda estadounidense de metal alternativo formada en 1994 en Los Ángeles, conocida por su estilo único y letras políticas.", "Nu Metal"),
(10, "nirvana.jpg", "Nirvana", "Es una banda estadounidense de grunge formada en 1987 en Aberdeen, Washington, liderada por Kurt Cobain, y pionera del sonido grunge.", "Grunge"),
(11, "pantera.jpeg", "Pantera", "Es una banda estadounidense de groove metal formada en 1981, conocida por su agresivo estilo de metal y sus poderosos riffs.", "Metal"),
(12, "gnr.jpg", "Guns N' Roses", "Es una banda estadounidense de hard rock formada en Los Ángeles en 1985, famosa por sus éxitos en los 80 y 90 y su sonido rebelde.", "Glam Metal"),
(13, "thesmiths.jpg", "The Smiths", "Es una banda británica de rock alternativo formada en Mánchester en 1982, liderada por Morrissey y Johnny Marr, conocida por sus letras melancólicas.", "Rock Alternativo"),
(14, "hole.jpg", "Hole", "Es una banda estadounidense de rock alternativo y grunge, formada en Los Ángeles en 1989 por Courtney Love.", "Grunge"),
(15, "blackSabbath.jpg", "Black Sabbath", "Es una banda británica de heavy metal formada en Birmingham en 1968, considerada pionera del género metal.", "Heavy Metal"),
(16, "pinkFloyd.jpg", "Pink Floyd", "Es una banda británica de rock formada en Londres en 1965, famosa por sus álbumes conceptuales y su estilo psicodélico y progresivo.", "Rock Progresivo"),
(17, "queen.jpg", "Queen", "Es una banda británica de rock formada en Londres en 1970, conocida por su sonido versátil y la carismática voz de Freddie Mercury.", "Rock"),
(18, "deepPurple.jpg", "Deep Purple", "Es una banda británica de rock formada en 1968, considerada una de las pioneras del hard rock y el heavy metal.", "Hard Rock"),
(19, "greenDay.jpg", "Green Day", "Es una banda estadounidense de punk rock formada en 1987, famosa por popularizar el punk rock en los años 90.", "Punk Rock"),
(20, "bonJovi.jpg", "Bon Jovi", "Es una banda estadounidense de rock formada en 1983 en Nueva Jersey, conocida por su éxito en la escena del rock durante los 80 y 90.", "Rock"),
(21, "ledZeppelin.jpg", "Led Zeppelin", "Es una banda británica de rock formada en Londres en 1968, conocida por su influencia en el hard rock y heavy metal.", "Hard Rock"),
(22, "ironMaiden.png", "Iron Maiden", "Es una banda británica de heavy metal formada en 1975, conocida por su estilo épico y por ser una de las más influyentes del género.", "Heavy Metal"),
(23, "slipknot.jpeg", "Slipknot", "Es una banda estadounidense de metal alternativo formada en 1995, conocida por su estilo agresivo y su imagen característica con máscaras.", "Nu Metal"),
(24, "deftones.jpg", "Deftones", "Es una banda estadounidense de metal alternativo formada en Sacramento en 1988, conocida por su mezcla de estilos que incluye metal y shoegaze.", "Metal Alternativo"),
(25, "judasPriest.jpg", "Judas Priest", "Es una banda británica de heavy metal formada en 1969, considerada una de las más influyentes del género.", "Heavy Metal");

UPDATE Artista SET imagen = "TheSmiths.jpg" WHERE nombre = "The Smiths";
                                                 
INSERT INTO Album VALUES 
(1, "Highway to Hell", "hth.jpg", "1997-07-29", "Hard Rock", 1),
(2, "Master of Puppets", "mopp.jpg", "1986-03-03", "Heavy Metal", 2),
(3, "Hotter than Hell", "hth-kiss.jpg", "1974-10-22", "Hard Rock", 3),
(4, "Countdown To Extinction", "cdte.jpg", "1992-07-06", "Heavy Metal", 5),
(5, "Crazy World", "crazyWorld.jpeg", "1990-11-06", "Hard Rock", 4),
(6, "Animalize", "animalize.jpg", "1984-09-13", "Hard Rock",3),
(7, "Appetite for Destruction", "afd-gnr.jpg", "1987-07-21", "Hard Rock",12),
(8, "Dynasty", "dynasty.jpeg", "1979-05-23", "Hard Rock",3),
(9, "In Utero", "inutero.jpg", "1993-09-23", "Grunge",10),
(10, "Black Album", "black.jpeg", "1991-08-12", "Heavy Metal", 2),
(11, "Daemon", "daemon-mayhem.jpg", "2019-10-25", "Black Metal", 6),
(12, "De Mysteriis", "demysteriis.jpg", "1994-05-24", "Black Metal", 6),
(13, "Love Gun", "lovegun.jpg", "1977-06-30", "Glam Metal", 3),
(14, "Ride The Lightning", "rtl.jpg", "1984-07-27", "Heavy Metal", 2),
(15, "Vulgar Display...", "vdop-pantera.jpeg", "1992-02-25", "Groove Metal",11),
(16, "The Queen Is Dead", "tqid.jpeg", "1986-06-16", "Indie Rock",13),
(17, "Live Through This", "ltt.png", "1994-04-12", "Grunge", 14),
(18, "Paranoid", "paranoid.jpg", "1970-09-18", "Heavy Metal", 15),
(19, "The Dark Side of the Moon", "darkside.png", "1973-03-01", "Rock Progresivo", 16),
(20, "A Night at the Opera", "anato.jpg", "1975-11-21", "Rock", 17),
(21, "Machine Head", "machine_head.jpg", "1972-03-25", "Hard Rock", 18),
(22, "American Idiot", "american_idiot.jpg", "2004-09-20", "Punk Rock", 19),
(23, "Slippery When Wet", "sww.jpg", "1986-08-18", "Rock", 20),
(24, "Led Zeppelin IV", "lz4.jpg", "1971-11-08", "Hard Rock", 21),
(25, "The Number of the Beast", "notb.jpg", "1982-03-22", "Heavy Metal", 22),
(26, "Iowa", "iowa.jpg", "2001-08-28", "Nu Metal", 23),
(27, "White Pony", "white_pony.webp", "2000-06-20", "Metal Alternativo", 24),
(28, "British Steel", "britishSteel.webp", "1980-04-14", "Heavy Metal", 25),
(29, "Meat Is Murder", "meat_is_murder.webp", "1985-02-11", "Rock Alternativo", 13),
(30, "Use Your Illusion I", "uyi1.webp", "1991-09-17", "Hard Rock", 12),
(31, "Strangeways, Here We Come", "strangeways.jpg", "1987-09-28", "Rock Alternativo", 13),
(32, "Hatful of Hollow", "hoh.jpg", "1984-11-12", "Rock Alternativo", 13),
(33, "Kill 'Em All", "kill-em-all.jpg", "1983-07-25", "Heavy Metal", 2),
(34, "Back In Black", "bib.jpg", "1980-07-25", "Hard Rock", 1),
(35, "Let There Be Rock", "ltbr.webp", "1977-03-21", "Hard Rock", 1),
(36, "Powerage", "powerage.jpg", "1978-05-05", "Hard Rock", 1),
(37, "Use Your Illusion II", "uyi2.jpg", "1991-09-17", "Hard Rock", 12),
(38, "G N R Lies", "gnr_lies.webp", "1988-11-29", "Hard Rock", 12),
(39, "Piece of Mind", "piece_of_mind.webp", "1983-05-16", "Heavy Metal", 22),
(40, "Powerslave", "powerslave.webp", "1984-09-03", "Heavy Metal", 22),
(41, "Seventh Son", "seventh.webp", "1988-04-11", "Heavy Metal", 22),
(42, "Rust In Peace", "rip.jpg", "1990-09-24", "Heavy Metal", 5),
(43, "Peace Sells...", "peacesells.jpg", "1986-09-19", "Heavy Metal", 5),
(44, "Youthanasia", "youthanasia.jpg", "1994-11-01", "Heavy Metal", 5);


