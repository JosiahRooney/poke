-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: pokes_db
-- ------------------------------------------------------
-- Server version	5.5.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `pokes`
--

DROP TABLE IF EXISTS `pokes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokes` (
  `poke_id` int(11) NOT NULL AUTO_INCREMENT,
  `poked_at` datetime DEFAULT NULL,
  `poked_user_id` int(11) DEFAULT NULL,
  `users_user_id` int(11) NOT NULL,
  PRIMARY KEY (`poke_id`),
  KEY `fk_pokes_users_idx` (`users_user_id`),
  CONSTRAINT `fk_pokes_users` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokes`
--

LOCK TABLES `pokes` WRITE;
/*!40000 ALTER TABLE `pokes` DISABLE KEYS */;
INSERT INTO `pokes` VALUES (6,'2016-06-24 10:47:11',1,4),(7,'2016-06-24 10:47:17',1,4),(8,'2016-06-24 10:47:18',1,4),(9,'2016-06-24 10:47:18',1,4),(10,'2016-06-24 10:47:19',3,4),(11,'2016-06-24 10:47:19',3,4),(12,'2016-06-24 10:47:19',3,4),(13,'2016-06-24 10:47:19',3,4),(14,'2016-06-24 10:52:25',3,4),(15,'2016-06-24 10:52:27',1,4),(16,'2016-06-24 10:52:27',1,4),(17,'2016-06-24 11:07:56',4,1),(18,'2016-06-24 11:07:58',4,1),(19,'2016-06-24 11:08:00',3,1),(20,'2016-06-24 11:08:00',3,1),(22,'2016-06-24 11:08:44',4,1),(23,'2016-06-24 11:08:46',4,1);
/*!40000 ALTER TABLE `pokes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(105) DEFAULT NULL,
  `last_name` varchar(105) DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `email` varchar(105) DEFAULT NULL,
  `pw_hash` varchar(255) DEFAULT NULL,
  `birthday` varchar(25) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Josiah','Rooney','Chaosrock','josiahrooney@gmail.com','$2b$12$L495mi420eezTAevfemLxOnB/33k7FaIEal1V.5Ohz21.tBlSJkl.','06/06/1985','2016-06-24 10:02:54','2016-06-24 10:02:54'),(3,'Tom','Rooney','Bob','josiahrooney1@gmail.com','$2b$12$MyAffYPbOJ1ACtoIYOkiT..Qp0O/KmAwl7OnF9MAdBWp6vZEgFvkS','06/06/1985','2016-06-24 10:06:17','2016-06-24 10:06:17'),(4,'Frank','Rooney','Tom','josiahrooney3@gmail.com','$2b$12$PWt60UkbHwkGm.Y3Q8TXkuKvGsc1ae/g6uM.SjpMqCQr1kiY2oVAy','06/06/1985','2016-06-24 10:07:47','2016-06-24 10:07:47');
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

-- Dump completed on 2016-06-24 11:29:43
