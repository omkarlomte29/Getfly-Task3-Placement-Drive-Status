-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: tpo
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `remarks`
--

DROP TABLE IF EXISTS `remarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remarks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `remark` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `companyId` int NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `companyId` (`companyId`),
  CONSTRAINT `remarks_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remarks`
--

LOCK TABLES `remarks` WRITE;
/*!40000 ALTER TABLE `remarks` DISABLE KEYS */;
INSERT INTO `remarks` VALUES (1,'Example Remark','Still Communication',1,'2024-06-17 11:11:52','2024-06-22 11:46:16'),(2,'Placement','Paused',1,'2024-06-17 11:12:47','2024-06-18 20:26:04'),(3,'Company 2','Paused',2,'2024-06-17 11:13:27','2024-06-18 19:49:04'),(4,'hello','Ongoing',2,'2024-06-18 20:07:57','2024-06-18 20:07:57'),(9,'Demo Remark about the Demo Company for Drive','Confirmed',2,'2024-06-18 20:18:47','2024-06-22 20:32:49'),(10,'Demo Remakr','Confirmed',1,'2024-06-22 11:46:28','2024-06-22 21:07:25'),(11,'One more remark','Confirmed',2,'2024-06-22 20:32:40','2024-06-22 20:32:40'),(12,'comapny a remark','Paused',3,'2024-06-22 21:07:35','2024-06-23 10:16:00'),(13,'Great company to work with','Confirmed',12,'2024-06-24 13:24:40','2024-06-24 13:24:40'),(14,'Very innovative solutions','Confirmed',5,'2024-06-24 13:24:40','2024-06-24 13:41:53'),(15,'Excellent customer service','Confirmed',6,'2024-06-24 13:24:40','2024-06-24 13:41:53'),(16,'Top-notch quality products','Confirmed',7,'2024-06-24 13:24:40','2024-06-24 13:41:53'),(17,'Highly recommended','Confirmed',8,'2024-06-24 13:24:40','2024-06-24 13:41:53'),(18,'Reliable partner in business','Confirmed',9,'2024-06-24 13:24:40','2024-06-24 13:41:53'),(19,'Outstanding performance','Confirmed',10,'2024-06-24 13:24:40','2024-06-24 13:41:53'),(20,'Great team collaboration','Confirmed',11,'2024-06-24 13:24:40','2024-06-24 13:41:53');
/*!40000 ALTER TABLE `remarks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-25 13:00:37
