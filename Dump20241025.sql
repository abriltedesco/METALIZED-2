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
INSERT INTO `Album` VALUES (1,'Highway to Hell','hth.jpg','1997-07-29','Hard Rock',1),(2,'Master of Puppets','mopp.jpg','1986-03-03','Heavy Metal',2),(3,'Hotter than Hell','hth-kiss.jpg','1974-10-22','Hard Rock',3),(4,'Countdown To Extinction','cdte.jpg','1992-07-06','Heavy Metal',5),(5,'Crazy World','crazyWorld.jpeg','1990-11-06','Hard Rock',4),(6,'Animalize','animalize.jpg','1984-09-13','Hard Rock',3),(7,'Appetite for Destruction','afd-gnr.jpg','1987-07-21','Hard Rock',12),(8,'Dynasty','dynasty.jpeg','1979-05-23','Hard Rock',3),(9,'In Utero','inutero.jpg','1993-09-23','Grunge',10),(10,'Black Album','black.jpeg','1991-08-12','Heavy Metal',2),(11,'Daemon','daemon-mayhem.jpg','2019-10-25','Black Metal',6),(12,'De Mysteriis','demysteriis.jpg','1994-05-24','Black Metal',6),(13,'Love Gun','lovegun.jpg','1977-06-30','Glam Metal',3),(14,'Ride The Lightning','rtl.jpg','1984-07-27','Heavy Metal',2),(15,'Vulgar Display...','vdop-pantera.jpeg','1992-02-25','Groove Metal',11),(16,'The Queen Is Dead','tqid.jpeg','1986-06-16','Indie Rock',13),(17,'Live Through This','ltt.png','1994-04-12','Grunge',14),(18,'Paranoid','paranoid.jpg','1970-09-18','Heavy Metal',15),(19,'The Dark Side of the Moon','darkside.png','1973-03-01','Rock Progresivo',16),(20,'A Night at the Opera','anato.jpg','1975-11-21','Rock',17),(21,'Machine Head','machine_head.jpg','1972-03-25','Hard Rock',18),(22,'American Idiot','american_idiot.jpg','2004-09-20','Punk Rock',19),(23,'Slippery When Wet','sww.jpg','1986-08-18','Rock',20),(24,'Led Zeppelin IV','lz4.jpeg','1971-11-08','Hard Rock',21),(25,'The Number of the Beast','notb.jpg','1982-03-22','Heavy Metal',22),(26,'Iowa','iowa.jpg','2001-08-28','Nu Metal',23),(27,'White Pony','white_pony.webp','2000-06-20','Metal Alternativo',24),(28,'British Steel','britishSteel.webp','1980-04-14','Heavy Metal',25),(29,'Meat Is Murder','meat_is_murder.webp','1985-02-11','Rock Alternativo',13),(30,'Use Your Illusion I','uyi1.jpg','1991-09-17','Hard Rock',12),(31,'Strangeways, Here We Come','strangeways.jpg','1987-09-28','Rock Alternativo',13),(32,'Hatful of Hollow','hoh.jpg','1984-11-12','Rock Alternativo',13),(33,'Kill \'Em All','kill-em-all.jpg','1983-07-25','Heavy Metal',2),(34,'Back In Black','bib.jpg','1980-07-25','Hard Rock',1),(35,'Let There Be Rock','ltbr.webp','1977-03-21','Hard Rock',1),(36,'Powerage','powerage.jpg','1978-05-05','Hard Rock',1),(37,'Use Your Illusion II','uyi2.jpg','1991-09-17','Hard Rock',12),(38,'G N R Lies','gnr_lies.webp','1988-11-29','Hard Rock',12),(39,'Piece of Mind','piece_of_mind.webp','1983-05-16','Heavy Metal',22),(40,'Powerslave','powerslave.webp','1984-09-03','Heavy Metal',22),(41,'Seventh Son','seventh.webp','1988-04-11','Heavy Metal',22),(42,'Rust In Peace','rip.jpg','1990-09-24','Heavy Metal',5),(43,'Peace Sells...','peacesells.jpg','1986-09-19','Heavy Metal',5),(44,'Youthanasia','youthanasia.jpg','1994-11-01','Heavy Metal',5);
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
INSERT INTO `Artista` VALUES (1,'hth.jpg','AC/DC','Es una banda australiana de hard rock formada en Sídney en 1973 por los hermanos Malcolm y Angus Young.','Hard Rock'),(2,'metallica.png','Metallica','Es una banda estadounidense de thrash metal formada en 1981 en Los Ángeles, conocida por su gran impacto en el heavy metal.','Metal'),(3,'kiss.jpg','Kiss','Es una banda estadounidense de rock formada en Nueva York en 1973 por Gene Simmons (bajo), Paul Stanley (guitarra y voz) y Peter Criss (batería), a los que más tarde se uniría Ace Frehley (guitarra).','Glam Metal'),(4,'scorpions.jpg','Scorpions','Es una banda alemana de hard rock y heavy metal formada en 1965, conocida por baladas icónicas y su sonido potente.','Metal'),(5,'megadeth.jpeg','Megadeth','Es una banda estadounidense de thrash metal fundada por Dave Mustaine en 1983, conocida por sus complejas composiciones.','Heavy Metal'),(6,'mayhem.jpeg','Mayhem','Es una banda noruega de black metal formada en 1984, considerada pionera del género y conocida por su historia controversial.','Black Metal'),(7,'motleyCrue.jpg','Motley Crue','Es una banda estadounidense de glam metal formada en Los Ángeles en 1981, conocida por su imagen rebelde y sus shows enérgicos.','Glam Metal'),(8,'sodaStereo.jpg','Soda Stereo','Es una banda argentina de rock formada en 1982 en Buenos Aires, liderada por Gustavo Cerati, considerada una de las más influyentes del rock latinoamericano.','Rock Nacional'),(9,'soad.jpg','System Of A Down','Es una banda estadounidense de metal alternativo formada en 1994 en Los Ángeles, conocida por su estilo único y letras políticas.','Nu Metal'),(10,'nirvana.jpg','Nirvana','Es una banda estadounidense de grunge formada en 1987 en Aberdeen, Washington, liderada por Kurt Cobain, y pionera del sonido grunge.','Grunge'),(11,'pantera.jpeg','Pantera','Es una banda estadounidense de groove metal formada en 1981, conocida por su agresivo estilo de metal y sus poderosos riffs.','Metal'),(12,'gnr.jpg','Guns N\' Roses','Es una banda estadounidense de hard rock formada en Los Ángeles en 1985, famosa por sus éxitos en los 80 y 90 y su sonido rebelde.','Glam Metal'),(13,'TheSmiths.jpg','The Smiths','Es una banda británica de rock alternativo formada en Mánchester en 1982, liderada por Morrissey y Johnny Marr, conocida por sus letras melancólicas.','Rock Alternativo'),(14,'hole.jpg','Hole','Es una banda estadounidense de rock alternativo y grunge, formada en Los Ángeles en 1989 por Courtney Love.','Grunge'),(15,'blackSabbath.jpg','Black Sabbath','Es una banda británica de heavy metal formada en Birmingham en 1968, considerada pionera del género metal.','Heavy Metal'),(16,'pinkFloyd.jpg','Pink Floyd','Es una banda británica de rock formada en Londres en 1965, famosa por sus álbumes conceptuales y su estilo psicodélico y progresivo.','Rock Progresivo'),(17,'queen.jpg','Queen','Es una banda británica de rock formada en Londres en 1970, conocida por su sonido versátil y la carismática voz de Freddie Mercury.','Rock'),(18,'deepPurple.jpg','Deep Purple','Es una banda británica de rock formada en 1968, considerada una de las pioneras del hard rock y el heavy metal.','Hard Rock'),(19,'greenDay.jpg','Green Day','Es una banda estadounidense de punk rock formada en 1987, famosa por popularizar el punk rock en los años 90.','Punk Rock'),(20,'bonJovi.jpg','Bon Jovi','Es una banda estadounidense de rock formada en 1983 en Nueva Jersey, conocida por su éxito en la escena del rock durante los 80 y 90.','Rock'),(21,'ledZeppelin.jpg','Led Zeppelin','Es una banda británica de rock formada en Londres en 1968, conocida por su influencia en el hard rock y heavy metal.','Hard Rock'),(22,'ironMaiden.png','Iron Maiden','Es una banda británica de heavy metal formada en 1975, conocida por su estilo épico y por ser una de las más influyentes del género.','Heavy Metal'),(23,'slipknot.jpeg','Slipknot','Es una banda estadounidense de metal alternativo formada en 1995, conocida por su estilo agresivo y su imagen característica con máscaras.','Nu Metal'),(24,'deftones.jpg','Deftones','Es una banda estadounidense de metal alternativo formada en Sacramento en 1988, conocida por su mezcla de estilos que incluye metal y shoegaze.','Metal Alternativo'),(25,'judasPriest.jpg','Judas Priest','Es una banda británica de heavy metal formada en 1969, considerada una de las más influyentes del género.','Heavy Metal');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,'delfi','delfi@gmail.com','12345'),(2,'user','user@gmail.com','user'),(3,'aby','aby@gmail.com','abybybyby'),(4,'nose','nose@gmail.com','nosenosenoseqtiene'),(5,'usuario','usuario@yahoo.com','usuario'),(6,'kiki','kiki@gmail.com','kikidouluvme'),(7,'nombre','email@yahoo.com','contraseña');
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario_escucha_Cancion`
--

DROP TABLE IF EXISTS `Usuario_escucha_Cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuario_escucha_Cancion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int DEFAULT NULL,
  `idCancion` int DEFAULT NULL,
  `plays` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idCancion` (`idCancion`),
  CONSTRAINT `Usuario_escucha_Cancion_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`id`),
  CONSTRAINT `Usuario_escucha_Cancion_ibfk_2` FOREIGN KEY (`idCancion`) REFERENCES `Cancion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario_escucha_Cancion`
--

LOCK TABLES `Usuario_escucha_Cancion` WRITE;
/*!40000 ALTER TABLE `Usuario_escucha_Cancion` DISABLE KEYS */;
INSERT INTO `Usuario_escucha_Cancion` VALUES (1,1,4,'2024-09-27 15:46:45'),(2,1,5,'2024-09-27 15:45:45'),(3,1,3,'2024-09-26 18:45:35'),(4,1,6,'2024-09-27 13:56:45'),(5,1,2,'2024-09-25 16:25:15'),(6,1,5,'2024-08-27 14:35:45'),(7,1,5,'2024-09-27 15:59:49'),(8,1,5,'2024-09-25 13:45:45'),(9,1,5,'2024-09-27 15:45:45'),(10,1,2,'2024-05-27 15:45:45'),(11,1,3,'2024-09-08 12:45:45'),(12,1,6,'2024-06-27 13:45:15'),(13,1,3,'2024-09-21 15:05:45'),(14,1,6,'2024-09-23 17:45:45'),(15,1,7,'2024-09-15 16:05:12'),(16,1,9,'2024-09-20 10:22:34'),(17,1,12,'2024-09-28 11:14:47'),(18,1,17,'2024-10-01 12:33:22'),(19,1,22,'2024-10-05 09:18:45'),(20,1,34,'2024-10-10 18:30:12'),(21,1,35,'2024-10-11 14:25:33'),(22,1,39,'2024-10-12 20:45:22'),(23,1,47,'2024-10-14 17:50:45'),(24,1,56,'2024-10-16 19:12:08'),(25,1,4,'2024-09-20 15:46:45'),(26,1,5,'2023-09-28 15:45:45'),(27,1,40,'2024-05-26 18:47:35'),(28,1,6,'2023-06-27 13:56:45'),(29,1,2,'2023-06-15 16:26:15'),(30,1,5,'2023-08-27 14:35:45'),(31,1,5,'2024-09-27 15:52:49'),(32,1,6,'2024-09-25 13:45:45'),(33,1,40,'2024-09-27 15:45:45'),(34,1,40,'2024-05-27 15:45:45'),(35,1,3,'2024-09-08 12:45:45'),(36,1,6,'2024-06-27 13:45:15'),(37,1,40,'2024-09-21 15:05:45'),(38,1,6,'2024-09-23 17:45:45'),(39,1,7,'2024-09-15 16:05:12'),(40,1,9,'2024-09-20 10:22:34'),(41,1,12,'2024-09-28 11:14:47'),(42,1,17,'2024-10-01 12:33:22'),(43,1,22,'2024-10-05 09:18:45'),(44,1,34,'2024-10-10 18:30:12'),(45,1,35,'2024-10-11 14:25:33'),(46,1,39,'2024-10-12 20:45:22'),(47,1,47,'2024-10-14 17:50:45'),(48,1,56,'2024-10-16 19:12:08'),(49,1,24,'2024-09-20 15:46:45'),(50,1,25,'2023-09-28 15:45:45'),(51,1,40,'2024-05-26 18:47:35'),(52,1,6,'2023-06-27 13:56:45'),(53,1,2,'2023-06-15 16:26:15'),(54,1,35,'2023-08-27 14:35:45'),(55,1,35,'2024-09-27 15:52:49'),(56,1,36,'2024-09-25 13:45:45'),(57,1,40,'2024-09-27 15:45:45'),(58,1,40,'2024-05-27 15:45:45'),(59,1,3,'2024-09-08 12:45:45'),(60,1,6,'2024-06-27 13:45:15'),(61,1,40,'2024-09-21 15:05:45'),(62,1,6,'2024-09-23 17:45:45'),(63,1,7,'2024-09-15 16:05:12'),(64,1,19,'2024-10-20 10:22:34'),(65,1,15,'2024-10-20 11:14:47'),(66,1,17,'2024-10-21 12:33:22'),(67,1,16,'2024-10-19 09:18:45'),(68,1,19,'2024-10-11 18:30:12'),(69,1,35,'2024-10-11 14:25:33'),(70,1,39,'2024-10-12 20:45:22'),(71,1,47,'2024-10-14 17:50:45'),(72,1,56,'2024-10-16 19:12:08'),(73,2,8,'2024-09-10 15:30:22'),(74,2,14,'2024-09-18 11:25:40'),(75,2,19,'2024-09-25 09:34:21'),(76,2,23,'2024-09-30 14:47:09'),(77,2,29,'2024-10-03 16:18:54'),(78,2,30,'2024-10-06 18:35:12'),(79,2,37,'2024-10-08 10:12:34'),(80,2,41,'2024-10-11 12:45:20'),(81,2,50,'2024-10-13 17:52:45'),(82,2,61,'2024-10-17 20:20:18'),(83,3,11,'2024-09-05 14:12:30'),(84,3,15,'2024-09-17 16:42:18'),(85,3,18,'2024-09-21 13:10:50'),(86,3,25,'2024-09-27 19:24:12'),(87,3,28,'2024-09-30 11:45:23'),(88,3,32,'2024-10-02 14:55:35'),(89,3,33,'2024-10-05 16:05:12'),(90,3,38,'2024-10-09 18:22:44'),(91,3,43,'2024-10-13 12:00:32'),(92,3,52,'2024-10-18 10:34:11'),(93,1,7,'2024-09-15 16:05:12'),(94,1,7,'2024-09-20 18:30:12'),(95,1,7,'2024-09-25 10:45:00'),(96,1,7,'2024-10-01 12:33:22'),(97,1,7,'2024-09-15 16:05:12'),(98,1,7,'2024-09-20 18:30:12'),(99,1,7,'2024-09-25 10:45:00'),(100,1,7,'2024-10-01 12:33:22'),(101,1,4,'2024-09-27 15:46:45'),(102,1,5,'2024-09-27 15:45:45'),(103,1,3,'2024-09-26 18:45:35'),(104,1,6,'2024-09-27 13:56:45'),(105,1,9,'2024-09-20 10:22:34'),(106,1,12,'2024-10-01 11:14:47'),(107,2,12,'2024-09-10 14:22:18'),(108,2,12,'2024-09-15 16:20:12'),(109,2,12,'2024-09-20 12:33:45'),(110,2,4,'2024-09-21 18:00:00'),(111,2,5,'2024-09-30 15:15:30'),(112,2,6,'2024-10-01 20:14:12'),(113,2,8,'2024-10-02 10:30:22'),(114,2,17,'2024-10-05 12:45:00'),(115,2,22,'2024-10-06 08:12:05'),(116,2,27,'2024-10-09 14:55:15'),(117,3,9,'2024-09-05 11:11:11'),(118,3,9,'2024-09-10 09:09:09'),(119,3,9,'2024-09-15 18:18:18'),(120,3,1,'2024-09-20 16:30:30'),(121,3,2,'2024-09-25 13:45:45'),(122,3,3,'2024-09-30 20:22:22'),(123,3,4,'2024-10-01 15:10:10'),(124,3,5,'2024-10-05 14:20:20'),(125,3,12,'2024-10-08 11:15:15'),(126,3,18,'2024-10-10 17:45:45'),(127,4,6,'2024-09-02 12:30:12'),(128,4,6,'2024-09-05 15:00:00'),(129,4,6,'2024-09-15 10:10:10'),(130,4,8,'2024-09-20 14:14:14'),(131,4,10,'2024-09-25 19:19:19'),(132,4,11,'2024-10-01 11:11:11'),(133,4,13,'2024-10-02 16:16:16'),(134,4,14,'2024-10-03 12:30:12'),(135,4,19,'2024-10-05 20:20:20'),(136,4,20,'2024-10-07 17:45:45'),(137,5,35,'2024-09-12 09:30:30'),(138,5,35,'2024-09-15 14:14:14'),(139,5,35,'2024-09-22 11:11:11'),(140,5,2,'2024-09-30 16:45:45'),(141,5,3,'2024-10-01 19:50:50'),(142,5,4,'2024-10-05 14:05:05'),(143,5,5,'2024-10-07 10:10:10'),(144,5,18,'2024-10-09 12:12:12'),(145,5,22,'2024-10-10 17:45:45'),(146,5,26,'2024-10-11 16:30:30'),(147,4,9,'2024-09-05 11:11:11'),(148,5,9,'2024-09-10 09:09:09'),(149,6,19,'2024-09-15 18:18:18'),(150,3,1,'2024-09-20 16:30:30'),(151,6,12,'2024-09-25 13:45:45'),(152,3,3,'2024-09-30 20:22:22'),(153,3,4,'2024-10-01 15:10:10'),(154,3,5,'2024-10-05 14:20:20'),(155,3,12,'2024-10-08 11:15:15'),(156,3,18,'2024-10-10 17:45:45'),(157,4,6,'2024-09-02 12:30:12'),(158,4,6,'2024-09-05 15:00:00'),(159,4,6,'2024-09-15 10:10:10'),(160,4,8,'2024-09-20 14:14:14'),(161,4,10,'2024-09-25 19:19:19'),(162,6,11,'2024-10-01 11:11:11'),(163,6,13,'2024-10-02 16:16:16'),(164,6,19,'2024-10-03 12:30:12'),(165,6,19,'2024-10-05 20:20:20'),(166,6,22,'2024-10-07 17:45:45'),(167,6,31,'2024-09-12 09:30:30'),(168,6,33,'2024-09-15 14:14:14'),(169,6,33,'2024-10-23 11:11:11'),(170,6,2,'2024-07-24 16:45:45'),(171,6,3,'2024-10-01 19:50:50'),(172,6,4,'2024-10-23 14:05:05'),(173,6,5,'2024-10-23 10:10:10'),(174,6,18,'2024-10-22 12:12:12'),(175,5,22,'2024-10-10 17:45:45'),(176,5,26,'2024-10-11 16:30:30'),(177,7,9,'2024-01-05 11:11:11'),(178,7,29,'2024-09-10 09:09:09'),(179,7,19,'2024-06-15 18:18:18'),(180,7,1,'2023-02-20 16:30:30'),(181,7,12,'2024-09-25 13:45:45'),(182,7,32,'2024-09-30 20:22:22'),(183,7,40,'2024-03-01 15:10:10'),(184,7,45,'2024-03-05 14:20:20'),(185,7,12,'2024-10-08 11:15:15'),(186,7,38,'2024-10-10 17:45:45'),(187,7,56,'2024-09-02 12:30:12'),(188,7,46,'2024-09-05 15:00:00'),(189,7,6,'2024-09-15 10:10:10'),(190,7,8,'2024-09-20 14:14:14'),(191,7,10,'2024-09-25 19:19:19'),(192,7,11,'2024-10-01 11:11:11'),(193,7,49,'2024-10-02 16:16:16'),(194,7,49,'2024-10-03 12:30:12'),(195,7,49,'2024-10-05 20:20:20'),(196,7,22,'2024-10-07 17:45:45'),(197,7,31,'2024-09-12 09:30:30'),(198,7,32,'2024-09-15 14:14:14'),(199,7,34,'2024-10-23 11:11:11'),(200,7,2,'2024-07-24 16:45:45'),(201,7,53,'2024-10-01 19:50:50'),(202,7,56,'2024-10-24 14:05:05'),(203,7,53,'2024-10-24 10:10:10'),(204,7,8,'2024-10-22 12:12:12'),(205,7,22,'2024-10-10 17:45:45'),(206,7,26,'2024-10-11 16:30:30');
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

-- Dump completed on 2024-10-25  8:11:07
