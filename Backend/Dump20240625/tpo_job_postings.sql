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
-- Table structure for table `job_postings`
--

DROP TABLE IF EXISTS `job_postings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_postings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `companyId` int NOT NULL,
  `remarkId` int NOT NULL,
  `job_description` varchar(255) NOT NULL,
  `package_details` varchar(255) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `criteria_10th` varchar(255) NOT NULL,
  `criteria_12th` varchar(255) NOT NULL,
  `deg_criteria` varchar(255) NOT NULL,
  `diploma_criteria` varchar(255) NOT NULL,
  `eligible_branches` varchar(255) NOT NULL,
  `docs` varchar(255) DEFAULT NULL,
  `tracker` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_company` (`companyId`),
  KEY `FK_remark` (`remarkId`),
  CONSTRAINT `FK_company` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`),
  CONSTRAINT `FK_remark` FOREIGN KEY (`remarkId`) REFERENCES `remarks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_postings`
--

LOCK TABLES `job_postings` WRITE;
/*!40000 ALTER TABLE `job_postings` DISABLE KEYS */;
INSERT INTO `job_postings` VALUES (1,1,9,'mast job hai','10','data administrator','80','75','8','85','IT,CS',NULL,NULL,'2024-06-21 21:15:34','2024-06-21 21:15:34'),(2,2,10,'job le le na baba','7','web developer','80','80','9','90','IT,CS',NULL,NULL,'2024-06-21 21:15:34','2024-06-21 21:15:34'),(3,5,14,'Great opportunity in IT','12','Software Engineer','85','80','9','88','IT',NULL,NULL,'2024-06-24 13:46:37','2024-06-24 13:46:37'),(4,6,15,'Exciting role in Marketing','15','Marketing Manager','82','78','7','85','Marketing',NULL,NULL,'2024-06-24 13:46:37','2024-06-24 13:46:37'),(5,7,16,'Join our Finance team','14','Financial Analyst','80','75','8','85','Finance,Accounting',NULL,NULL,'2024-06-24 13:46:37','2024-06-24 13:46:37'),(6,8,17,'Senior Developer role','18','Senior Developer','85','80','9','88','IT,CS',NULL,NULL,'2024-06-24 13:46:37','2024-06-24 13:46:37'),(7,9,18,'Business Analyst Position','16','Business Analyst','82','78','7','85','Business,Management',NULL,NULL,'2024-06-24 13:46:37','2024-06-24 13:46:37'),(8,10,19,'UX Designer Role','20','UX Designer','80','75','8','85','Design,IT',NULL,NULL,'2024-06-24 13:46:37','2024-06-24 13:46:37'),(9,11,20,'Customer Support Specialist','19','Customer Support','85','80','9','88','Customer Service',NULL,NULL,'2024-06-24 13:46:37','2024-06-24 13:46:37'),(10,12,13,'Quality Assurance Engineer','17','QA Engineer','82','78','7','85','Quality Assurance',NULL,NULL,'2024-06-24 13:46:38','2024-06-24 13:46:38');
/*!40000 ALTER TABLE `job_postings` ENABLE KEYS */;
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
