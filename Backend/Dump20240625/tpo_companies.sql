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
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `mode_of_communication` varchar(255) DEFAULT NULL,
  `academic_year` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'GetFly','Mumbai','email','2024','2024-06-17 10:37:13','2024-06-17 10:37:13'),(2,'Demo Company','Mumbai','whatsapp','2024','2024-06-17 10:37:49','2024-06-17 10:37:49'),(3,'Company A','Mumbai','offline','2024','2024-06-21 20:53:41','2024-06-21 20:55:57'),(5,'ABC Corporation','New York','Email','2023','2024-06-24 13:20:30','2024-06-24 13:20:30'),(6,'XYZ Industries','Los Angeles','Phone','2024','2024-06-24 13:20:30','2024-06-24 13:20:30'),(7,'Tech Solutions Ltd','London','Video Call','2022','2024-06-24 13:20:30','2024-06-24 13:20:30'),(8,'Global Innovations','Tokyo','Email','2023','2024-06-24 13:20:30','2024-06-24 13:20:30'),(9,'Smart Tech Inc','San Francisco','Video Call','2023','2024-06-24 13:20:30','2024-06-24 13:20:30'),(10,'Data Solutions Group','Sydney','Email','2022','2024-06-24 13:20:30','2024-06-24 13:20:30'),(11,'Innovative Systems','Berlin','Phone','2024','2024-06-24 13:20:30','2024-06-24 13:20:30'),(12,'Tech Wizards Ltd','Toronto','Email','2023','2024-06-24 13:20:30','2024-06-24 13:20:30'),(13,'Swift Innovations','Paris','Phone','2022','2024-06-24 13:20:30','2024-06-24 13:20:30'),(14,'Digital Services Corp','Singapore','Video Call','2024','2024-06-24 13:20:30','2024-06-24 13:20:30');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-25 13:00:38
