-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: std-mysql    Database: std_2588_exam_library
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book_to_genres`
--

DROP TABLE IF EXISTS `book_to_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_to_genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `book_to_genres_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `book_to_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_to_genres`
--

LOCK TABLES `book_to_genres` WRITE;
/*!40000 ALTER TABLE `book_to_genres` DISABLE KEYS */;
INSERT INTO `book_to_genres` VALUES (1,1,3),(2,2,3),(3,2,2),(4,2,1),(5,3,2),(6,3,1),(7,4,1);
/*!40000 ALTER TABLE `book_to_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` varchar(256) NOT NULL,
  `year` int(11) NOT NULL,
  `publisher` varchar(256) NOT NULL,
  `author` varchar(256) NOT NULL,
  `pages` int(11) NOT NULL,
  `cover_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cover_id` (`cover_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`cover_id`) REFERENCES `covers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Отцы и дети','Книга об взаимоотношениях двух поколений',1862,'Спб','Тургенев Иван',234,1),(2,'122','22',11,'11','11',11,2),(3,'Hachico','122',123,'12','12',1,1),(4,'1','1',1,'1','1',1,1);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `covers`
--

DROP TABLE IF EXISTS `covers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `covers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `mime_type` varchar(256) NOT NULL,
  `md5_hash` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `covers`
--

LOCK TABLES `covers` WRITE;
/*!40000 ALTER TABLE `covers` DISABLE KEYS */;
INSERT INTO `covers` VALUES (1,'deti.jpeg','image/jpeg','34c04cb2eb334f52036b7bb9bfc28dc1'),(2,'book.html','text/html','b65395d1796c79278610774b4f74ca37');
/*!40000 ALTER TABLE `covers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (3,'Драма'),(2,'Лирика'),(1,'Эпос');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` varchar(256) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,1,5,'123','2024-06-17 21:00:00');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','admin'),(2,'moderator','moderator'),(3,'user','user');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(256) NOT NULL,
  `password_hash` varchar(256) NOT NULL,
  `surname` varchar(256) NOT NULL,
  `name` varchar(256) NOT NULL,
  `lastname` varchar(256) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','scrypt:32768:8:1$DOPDAX7whnBBOpLF$8add6aafd6102192fece334ba0585be8c5c96b10aeb2d01b0d2559085c6671fcc91cfbf652f4435b2bac8b3e2216ddb7818c79752c1939028662ea0dda95483d','ivanov','ivanov','ivanovich',1),(2,'moderator','scrypt:32768:8:1$f0KDbWlHSJF3Sdaa$159c56fd331d923a856a6e906208cb966eadbcf32a2c066c18a9ddf9fca4270766b4759e2e1cbcd1cc1350b21ebba51984e4203eba823d0cc1356779fb64ea79','sidorov','ivan','ivanovich',2),(3,'user','scrypt:32768:8:1$9kSbvUxO3wcTUk7d$7e063ccfeec5808cc386e24c06d98703ba9150f1905dd84f038f0dd61df940f22a68cbcc9ac6f5f01b5c9c6a39aa1192e14f91679c8f9e71525f220cedf52e93','petrov','ivan','ivanovich',3),(4,'admin','scrypt:32768:8:1$S2DTCUOrZke6RMLW$7d23ad9327af2649ebdb092f640d0863dcd16fa71aa83e1a6d52769b685fee399788217090db840c9a332a5dfb270024e6531cdb348beb894b8815568f1d270e','ivanov','ivanov','ivanovich',1),(5,'moderator','scrypt:32768:8:1$QsJoQ9BprNRteawg$a3288be0ac45ab163403b34b4fbc5b969c3da46f0a784be145e3d8b74e0ade3537f2a0535e4ee5b5b42f2149b6683e26a76f7d6d3c507cc7364b3f95a896643d','sidorov','ivan','ivanovich',2),(6,'user','scrypt:32768:8:1$wMUo3AHaS0phQKU5$dd0ebe484df492daa965612649aafa32497b6243ca6303cdd1891418dc8c682eb6885f1c8a1d88328ad5cd0959c316b8b02fc344efccf21f573238d64266e606','petrov','ivan','ivanovich',3),(7,'admin','scrypt:32768:8:1$OpB5Pt7qyQByw8hs$76e892d16d64ee9cb5463afb197cce229451cedb84936dae86850dbe59f55714c5294a68e65c95fbaacb839ca1f8c55277f376c911d451f62530c1b5b042b1be','ivanov','ivanov','ivanovich',1),(8,'moderator','scrypt:32768:8:1$58GvkanHj4eQrKBK$bcd00f563a1a2449b6252864560908b95d894a4037c52da971fa4b1d12231d2ec7c933ce5a31cd33f764f16ddd08d43373c2b3c1409b6a00e75e20fb063ada51','sidorov','ivan','ivanovich',2),(9,'user','scrypt:32768:8:1$Biit4Ct41ZOvCjgQ$0bd45c1ff823a56851103eeeef5534983186d5f7b85000d4e794fa83fb7cbc6e35c282e13aa75ff4d3e3f7da4fb95a3ed9e8b108c75a4ebbb702f9ded467f419','petrov','ivan','ivanovich',3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-19 12:41:06
