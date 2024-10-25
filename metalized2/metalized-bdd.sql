-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Metalized
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Album`
--

DROP TABLE IF EXISTS `Album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Album` (
  `id` int NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `genero` varchar(45) DEFAULT NULL,
  `idArtista` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idArtista` (`idArtista`),
  CONSTRAINT `Album_ibfk_1` FOREIGN KEY (`idArtista`) REFERENCES `Artista` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Album`
--

LOCK TABLES `Album` WRITE;
/*!40000 ALTER TABLE `Album` DISABLE KEYS */;
INSERT INTO `Album` VALUES (1,'Highway to Hell','hth.jpg','1997-07-29','Hard Rock',1),(2,'Master of Puppets','mopp.jpg','1986-03-03','Heavy Metal',2),(3,'Hotter than Hell','hth-kiss.jpg','1974-10-22','Hard Rock',3),(4,'Countdown To Extinction','cdte.jpg','1992-07-06','Heavy Metal',5),(5,'Crazy World','crazyWorld.jpeg','1990-11-06','Hard Rock',4),(6,'Animalize','animalize.jpg','1984-09-13','Hard Rock',3),(7,'Appetite for Destruction','afd-gnr.jpg','1987-07-21','Hard Rock',12),(8,'Dynasty','dynasty.jpeg','1979-05-23','Hard Rock',3),(9,'In Utero','inutero.jpg','1993-09-23','Grunge',10),(10,'Black Album','black.jpeg','1991-08-12','Heavy Metal',2),(11,'Daemon','daemon-mayhem.jpg','2019-10-25','Black Metal',6),(12,'De Mysteriis','demysteriis.jpg','1994-05-24','Black Metal',6),(13,'Love Gun','lovegun.jpg','1977-06-30','Glam Metal',3),(14,'Ride The Lightning','rtl.jpg','1984-07-27','Heavy Metal',2),(15,'Vulgar Display...','vdop-pantera.jpeg','1992-02-25','Groove Metal',11),(16,'The Queen Is Dead','tqid.jpeg','1986-06-16','Indie Rock',13),(17,'Live Through This','ltt.png','1994-04-12','Grunge',14),(18,'Paranoid','paranoid.jpg','1970-09-18','Heavy Metal',15),(19,'The Dark Side of the Moon','darkside.png','1973-03-01','Rock Progresivo',16),(20,'A Night at the Opera','anato.jpg','1975-11-21','Rock',17),(21,'Machine Head','machine_head.jpg','1972-03-25','Hard Rock',18),(22,'American Idiot','american_idiot.jpg','2004-09-20','Punk Rock',19),(23,'Slippery When Wet','sww.jpg','1986-08-18','Rock',20),(24,'Led Zeppelin IV','lz4.jpg','1971-11-08','Hard Rock',21),(25,'The Number of the Beast','notb.jpg','1982-03-22','Heavy Metal',22),(26,'Iowa','iowa.jpg','2001-08-28','Nu Metal',23),(27,'White Pony','white_pony.webp','2000-06-20','Metal Alternativo',24),(28,'British Steel','britishSteel.webp','1980-04-14','Heavy Metal',25),(29,'Meat Is Murder','meat_is_murder.webp','1985-02-11','Rock Alternativo',13),(30,'Use Your Illusion I','uyi1.webp','1991-09-17','Hard Rock',12),(31,'Strangeways, Here We Come','strangeways.jpg','1987-09-28','Rock Alternativo',13),(32,'Hatful of Hollow','hoh.jpg','1984-11-12','Rock Alternativo',13),(33,'Kill \'Em All','kill-em-all.jpg','1983-07-25','Heavy Metal',2),(34,'Back In Black','bib.jpg','1980-07-25','Hard Rock',1),(35,'Let There Be Rock','ltbr.webp','1977-03-21','Hard Rock',1),(36,'Powerage','powerage.jpg','1978-05-05','Hard Rock',1),(37,'Use Your Illusion II','uyi2.jpg','1991-09-17','Hard Rock',12),(38,'G N R Lies','gnr_lies.webp','1988-11-29','Hard Rock',12),(39,'Piece of Mind','piece_of_mind.webp','1983-05-16','Heavy Metal',22),(40,'Powerslave','powerslave.webp','1984-09-03','Heavy Metal',22),(41,'Seventh Son','seventh.webp','1988-04-11','Heavy Metal',22),(42,'Rust In Peace','rip.jpg','1990-09-24','Heavy Metal',5),(43,'Peace Sells...','peacesells.jpg','1986-09-19','Heavy Metal',5),(44,'Youthanasia','youthanasia.jpg','1994-11-01','Heavy Metal',5);
/*!40000 ALTER TABLE `Album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Artista`
--

DROP TABLE IF EXISTS `Artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Artista` (
  `id` int NOT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `bio` varchar(1000) DEFAULT NULL,
  `genero` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artista`
--

LOCK TABLES `Artista` WRITE;
/*!40000 ALTER TABLE `Artista` DISABLE KEYS */;
INSERT INTO `Artista` VALUES (1,'hth.jpg','AC/DC','Es una banda australiana de hard rock formada en Sídney en 1973 por los hermanos Malcolm y Angus Young.','Hard Rock'),(2,'metallica.png','Metallica','Es una banda estadounidense de thrash metal formada en 1981 en Los Ángeles, conocida por su gran impacto en el heavy metal.','Metal'),(3,'kiss.jpg','Kiss','Es una banda estadounidense de rock formada en Nueva York en 1973 por Gene Simmons (bajo), Paul Stanley (guitarra y voz) y Peter Criss (batería), a los que más tarde se uniría Ace Frehley (guitarra).','Glam Metal'),(4,'scorpions.jpg','Scorpions','Es una banda alemana de hard rock y heavy metal formada en 1965, conocida por baladas icónicas y su sonido potente.','Metal'),(5,'megadeth.jpeg','Megadeth','Es una banda estadounidense de thrash metal fundada por Dave Mustaine en 1983, conocida por sus complejas composiciones.','Heavy Metal'),(6,'mayhem.jpeg','Mayhem','Es una banda noruega de black metal formada en 1984, considerada pionera del género y conocida por su historia controversial.','Black Metal'),(7,'motleyCrue.jpg','Motley Crue','Es una banda estadounidense de glam metal formada en Los Ángeles en 1981, conocida por su imagen rebelde y sus shows enérgicos.','Glam Metal'),(8,'sodaStereo.jpg','Soda Stereo','Es una banda argentina de rock formada en 1982 en Buenos Aires, liderada por Gustavo Cerati, considerada una de las más influyentes del rock latinoamericano.','Rock Nacional'),(9,'soad.jpg','System Of A Down','Es una banda estadounidense de metal alternativo formada en 1994 en Los Ángeles, conocida por su estilo único y letras políticas.','Nu Metal'),(10,'nirvana.jpg','Nirvana','Es una banda estadounidense de grunge formada en 1987 en Aberdeen, Washington, liderada por Kurt Cobain, y pionera del sonido grunge.','Grunge'),(11,'pantera.jpeg','Pantera','Es una banda estadounidense de groove metal formada en 1981, conocida por su agresivo estilo de metal y sus poderosos riffs.','Metal'),(12,'gnr.jpg','Guns N\' Roses','Es una banda estadounidense de hard rock formada en Los Ángeles en 1985, famosa por sus éxitos en los 80 y 90 y su sonido rebelde.','Glam Metal'),(13,'thesmiths.jpeg','The Smiths','Es una banda británica de rock alternativo formada en Mánchester en 1982, liderada por Morrissey y Johnny Marr, conocida por sus letras melancólicas.','Rock Alternativo'),(14,'hole.jpg','Hole','Es una banda estadounidense de rock alternativo y grunge, formada en Los Ángeles en 1989 por Courtney Love.','Grunge'),(15,'blackSabbath.jpg','Black Sabbath','Es una banda británica de heavy metal formada en Birmingham en 1968, considerada pionera del género metal.','Heavy Metal'),(16,'pinkFloyd.jpg','Pink Floyd','Es una banda británica de rock formada en Londres en 1965, famosa por sus álbumes conceptuales y su estilo psicodélico y progresivo.','Rock Progresivo'),(17,'queen.jpg','Queen','Es una banda británica de rock formada en Londres en 1970, conocida por su sonido versátil y la carismática voz de Freddie Mercury.','Rock'),(18,'deepPurple.jpg','Deep Purple','Es una banda británica de rock formada en 1968, considerada una de las pioneras del hard rock y el heavy metal.','Hard Rock'),(19,'greenDay.jpg','Green Day','Es una banda estadounidense de punk rock formada en 1987, famosa por popularizar el punk rock en los años 90.','Punk Rock'),(20,'bonJovi.jpg','Bon Jovi','Es una banda estadounidense de rock formada en 1983 en Nueva Jersey, conocida por su éxito en la escena del rock durante los 80 y 90.','Rock'),(21,'ledZeppelin.jpg','Led Zeppelin','Es una banda británica de rock formada en Londres en 1968, conocida por su influencia en el hard rock y heavy metal.','Hard Rock'),(22,'ironMaiden.png','Iron Maiden','Es una banda británica de heavy metal formada en 1975, conocida por su estilo épico y por ser una de las más influyentes del género.','Heavy Metal'),(23,'slipknot.jpeg','Slipknot','Es una banda estadounidense de metal alternativo formada en 1995, conocida por su estilo agresivo y su imagen característica con máscaras.','Nu Metal'),(24,'deftones.jpg','Deftones','Es una banda estadounidense de metal alternativo formada en Sacramento en 1988, conocida por su mezcla de estilos que incluye metal y shoegaze.','Metal Alternativo'),(25,'judasPriest.jpg','Judas Priest','Es una banda británica de heavy metal formada en 1969, considerada una de las más influyentes del género.','Heavy Metal');
/*!40000 ALTER TABLE `Artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cancion`
--

DROP TABLE IF EXISTS `Cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cancion` (
  `id` int NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `genero` varchar(45) DEFAULT NULL,
  `duracion` time DEFAULT NULL,
  `idAlbum` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idAlbum` (`idAlbum`),
  CONSTRAINT `Cancion_ibfk_1` FOREIGN KEY (`idAlbum`) REFERENCES `Album` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cancion`
--

LOCK TABLES `Cancion` WRITE;
/*!40000 ALTER TABLE `Cancion` DISABLE KEYS */;
INSERT INTO `Cancion` VALUES (1,'Highway to Hell','Hard Rock','03:29:00',1),(2,'Master of Puppets','Thrash Metal','08:03:00',2),(3,'Girls got Rythm','Hard Rock','03:24:00',1),(4,'Psychotron','Heavy Metal','04:42:00',4),(5,'Wind of Change','Hard Rock','05:12:00',5),(6,'Heaven\'s on Fire','Glam Metal','03:20:00',6),(7,'The Queen Is Dead','Rock Alternativo','06:23:00',16),(8,'I Know It\'s Over','Rock Alternativo','05:48:00',16),(9,'Bigmouth Strikes Again','Rock Alternativo','03:12:00',16),(10,'Meat Is Murder','Rock Alternativo','06:05:00',29),(11,'Nowhere Fast','Rock Alternativo','02:37:00',29),(12,'Welcome to the Jungle','Hard Rock','04:31:00',7),(13,'Sweet Child O\' Mine','Hard Rock','05:56:00',7),(14,'November Rain','Hard Rock','08:57:00',30),(15,'Don\'t Cry','Hard Rock','04:44:00',30),(16,'Paradise City','Hard Rock','06:46:00',7),(17,'Back In Black','Hard Rock','04:15:00',34),(18,'You Shook Me All Night Long','Hard Rock','03:30:00',34),(19,'Let There Be Rock','Hard Rock','06:06:00',35),(20,'Touch Too Much','Hard Rock','04:27:00',1),(21,'Rock \'n\' Roll Damnation','Hard Rock','03:37:00',35),(22,'The Number of the Beast','Heavy Metal','04:50:00',25),(23,'Run to the Hills','Heavy Metal','03:54:00',25),(24,'The Trooper','Heavy Metal','04:12:00',39),(25,'Revelations','Heavy Metal','06:48:00',39),(26,'Flight of Icarus','Heavy Metal','03:50:00',39),(27,'Battery','Thrash Metal','05:12:00',2),(28,'Ride the Lightning','Thrash Metal','06:37:00',14),(29,'Fade to Black','Thrash Metal','06:56:00',14),(30,'For Whom the Bell Tolls','Thrash Metal','05:10:00',14),(31,'Disposable Heroes','Thrash Metal','08:16:00',2),(32,'Violet','Grunge','03:24:00',17),(33,'Doll Parts','Grunge','03:31:00',17),(34,'Miss World','Grunge','03:26:00',17),(35,'War Pigs','Heavy Metal','07:55:00',18),(36,'Iron Man','Heavy Metal','05:55:00',18),(37,'Paranoid','Heavy Metal','02:48:00',18),(38,'Money','Rock Progresivo','06:22:00',19),(39,'Time','Rock Progresivo','07:06:00',19),(40,'Us and Them','Rock Progresivo','07:49:00',19),(41,'Bohemian Rhapsody','Rock','05:54:00',20),(42,'You\'re My Best Friend','Rock','02:52:00',20),(43,'Love of My Life','Rock','03:39:00',20),(44,'Smoke on the Water','Hard Rock','05:40:00',21),(45,'Highway Star','Hard Rock','06:05:00',21),(46,'Space Truckin\'','Hard Rock','04:31:00',21),(47,'American Idiot','Punk Rock','02:54:00',22),(48,'Boulevard of Broken Dreams','Punk Rock','04:20:00',22),(49,'Holiday','Punk Rock','03:52:00',22),(50,'Livin\' on a Prayer','Rock','04:09:00',23),(51,'You Give Love a Bad Name','Rock','03:43:00',23),(52,'Wanted Dead or Alive','Rock','05:08:00',23),(53,'Stairway to Heaven','Hard Rock','08:02:00',24),(54,'Black Dog','Hard Rock','04:55:00',24),(55,'Rock and Roll','Hard Rock','03:40:00',24),(56,'Left Behind','Nu Metal','04:01:00',26),(57,'People = Shit','Nu Metal','03:35:00',26),(58,'The Heretic Anthem','Nu Metal','04:12:00',26),(59,'Change (In the House of Flies)','Metal Alternativo','05:00:00',27),(60,'Digital Bath','Metal Alternativo','04:15:00',27),(61,'Knife Prty','Metal Alternativo','04:49:00',27),(62,'Breaking the Law','Heavy Metal','02:34:00',28),(63,'Living After Midnight','Heavy Metal','03:30:00',28),(64,'Metal Gods','Heavy Metal','04:00:00',28);
/*!40000 ALTER TABLE `Cancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombreUser` varchar(30) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contraseña` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,'usuario','usuario@gmail.com','usuario'),(2,'viky','viky@gmail.com','papa'),(3,'aby','abyaa@gmail.com','abylamejor');
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario_escucha_Cancion`
--

DROP TABLE IF EXISTS `Usuario_escucha_Cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuario_escucha_Cancion` (
  `idUsuario` int NOT NULL,
  `idCancion` int NOT NULL,
  `plays` datetime NOT NULL,
  PRIMARY KEY (`idUsuario`,`idCancion`,`plays`),
  KEY `idCancion` (`idCancion`),
  CONSTRAINT `Usuario_escucha_Cancion_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`id`),
  CONSTRAINT `Usuario_escucha_Cancion_ibfk_2` FOREIGN KEY (`idCancion`) REFERENCES `Cancion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario_escucha_Cancion`
--

LOCK TABLES `Usuario_escucha_Cancion` WRITE;
/*!40000 ALTER TABLE `Usuario_escucha_Cancion` DISABLE KEYS */;
INSERT INTO `Usuario_escucha_Cancion` VALUES (1,2,'2024-09-25 16:25:15'),(1,3,'2024-09-26 18:45:35'),(1,4,'2024-09-27 15:46:45'),(1,5,'2024-09-27 15:45:45'),(1,6,'2024-09-23 17:45:45'),(1,6,'2024-09-27 13:56:45'),(1,7,'2024-09-15 16:05:12'),(2,8,'2024-09-10 15:30:22'),(1,9,'2024-09-20 10:22:34'),(1,12,'2024-09-28 11:14:47'),(2,14,'2024-09-18 11:25:40'),(1,17,'2024-10-01 12:33:22'),(2,19,'2024-09-25 09:34:21'),(1,22,'2024-10-05 09:18:45'),(2,23,'2024-09-30 14:47:09'),(2,29,'2024-10-03 16:18:54'),(2,30,'2024-10-06 18:35:12'),(1,34,'2024-10-10 18:30:12'),(1,35,'2024-10-11 14:25:33'),(2,37,'2024-10-08 10:12:34'),(1,39,'2024-10-12 20:45:22'),(2,41,'2024-10-11 12:45:20'),(1,47,'2024-10-14 17:50:45'),(2,50,'2024-10-13 17:52:45'),(1,56,'2024-10-16 19:12:08'),(2,61,'2024-10-17 20:20:18');
/*!40000 ALTER TABLE `Usuario_escucha_Cancion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-21 11:38:34
