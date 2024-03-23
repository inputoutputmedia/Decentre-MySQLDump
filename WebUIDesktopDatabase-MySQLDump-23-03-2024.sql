CREATE DATABASE  IF NOT EXISTS `sdwebui_extention_local` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sdwebui_extention_local`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sdwebui_extention_local
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `captions_table`
--

DROP TABLE IF EXISTS `captions_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `captions_table` (
  `caption_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) DEFAULT NULL,
  `text` text,
  `model_used` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`caption_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `captions_table_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `image_table` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captions_table`
--

LOCK TABLES `captions_table` WRITE;
/*!40000 ALTER TABLE `captions_table` DISABLE KEYS */;
INSERT INTO `captions_table` VALUES (1,1,'A beautiful space featuring girl with a matellic ball behind','clip','2024-03-22 01:09:52'),(2,2,'A 90s hitman with a gun.','GPT-4','2024-03-22 01:28:46'),(3,3,'Skyscrapper having pool with alligaters.','GPT-4','2024-03-22 01:28:46'),(4,4,'a female robot under development','GPT-4','2024-03-22 01:28:46'),(5,5,'a creature with germs molecules','GPT-4','2024-03-22 01:28:46'),(6,6,'octopus in a super store cinematic.','GPT-4','2024-03-22 01:28:46');
/*!40000 ALTER TABLE `captions_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_table`
--

DROP TABLE IF EXISTS `image_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image_table` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_path` text,
  `prompt_text` text,
  `generation_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `image_table_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_table`
--

LOCK TABLES `image_table` WRITE;
/*!40000 ALTER TABLE `image_table` DISABLE KEYS */;
INSERT INTO `image_table` VALUES (1,'C:\\Users\\anish\\Downloads\\sdwebui-pics\\6.jpg','A anime girl with matellic moon in the background','2024-03-01 09:36:27',1),(2,'C:\\Users\\anish\\Downloads\\sdwebui-pics\\5.jpg','A 90s hitman with a gun','2024-03-06 09:36:39',2),(3,'C:\\Users\\anish\\Downloads\\sdwebui-pics\\4.jpg','Skyscrapper having pool with alligaters','2024-03-13 09:36:45',3),(4,'C:\\Users\\anish\\Downloads\\sdwebui-pics\\3.jpg','a femnale ronot under development','2024-03-15 09:36:50',4),(5,'C:\\Users\\anish\\Downloads\\sdwebui-pics\\2.jpg','a creature with germs molecules','2024-03-16 09:36:54',1),(6,'C:\\Users\\anish\\Downloads\\sdwebui-pics\\1.jpg','octopus in a super store cinematic','2024-03-15 09:36:59',2);
/*!40000 ALTER TABLE `image_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_detection_table`
--

DROP TABLE IF EXISTS `object_detection_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_detection_table` (
  `object_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) DEFAULT NULL,
  `model_used` varchar(255) DEFAULT NULL,
  `object_name` varchar(255) DEFAULT NULL,
  `object_path` text,
  `confidence_score` decimal(5,2) DEFAULT NULL,
  `bounding_box` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`object_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `object_detection_table_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `image_table` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_detection_table`
--

LOCK TABLES `object_detection_table` WRITE;
/*!40000 ALTER TABLE `object_detection_table` DISABLE KEYS */;
INSERT INTO `object_detection_table` VALUES (1,1,'YOLOv4','girl','C:UsersanishDownloadssdwebui-pics6.jpg',95.00,'{\"x\":100,\"y\":200,\"width\":300,\"height\":400}','2024-03-23 14:37:39'),(2,1,'YOLOv4','metalic ball','C:UsersanishDownloadssdwebui-pics6.jpg',88.50,'{\"x\":150,\"y\":250,\"width\":100,\"height\":150}','2024-03-22 01:08:21'),(3,2,'YOLOv5','gun','C:UsersanishDownloadssdwebui-pics5.jpg',89.70,'{\"x\":250,\"y\":100,\"width\":220,\"height\":180}','2024-03-22 01:26:07'),(4,3,'YOLOv5','alligater','C:UsersanishDownloadssdwebui-pics4.jpg',92.30,'{\"x\":300,\"y\":200,\"width\":100,\"height\":300}','2024-03-22 01:26:07'),(5,4,'YOLOv5','face','C:UsersanishDownloadssdwebui-pics3.jpg',95.00,'{\"x\":150,\"y\":250,\"width\":400,\"height\":200}','2024-03-22 01:26:07'),(6,5,'YOLOv5','mouse','C:UsersanishDownloadssdwebui-pics2.jpg',99.10,'{\"x\":200,\"y\":100,\"width\":50,\"height\":50}','2024-03-22 01:26:07'),(7,6,'YOLOv5','octopus','C:UsersanishDownloadssdwebui-pics1.jpg',93.80,'{\"x\":100,\"y\":200,\"width\":300,\"height\":400}','2024-03-22 01:26:07');
/*!40000 ALTER TABLE `object_detection_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jessielim','Admin','jessie@iomedia.io','2024-03-22 01:02:36'),(2,'AnishHassan','Editor','anish@iomedia.io','2024-03-22 01:13:03'),(3,'AdilHussain','Contributor','adil@iomedia.io','2024-03-22 01:13:03'),(4,'Muaz','Viewer','muaz@iomedia.io','2024-03-22 01:13:03');
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

-- Dump completed on 2024-03-23 20:51:42
