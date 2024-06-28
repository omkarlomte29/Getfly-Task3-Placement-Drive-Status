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
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum` (
  `forum_id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `stud_id` int NOT NULL,
  `question` varchar(255) NOT NULL,
  `question_time` timestamp NOT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `answer_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`forum_id`),
  UNIQUE KEY `forum_id_UNIQUE` (`forum_id`),
  KEY `post_key_idx` (`post_id`),
  KEY `stud_key_idx` (`stud_id`),
  CONSTRAINT `post_key` FOREIGN KEY (`post_id`) REFERENCES `job_postings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stud_key` FOREIGN KEY (`stud_id`) REFERENCES `student_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum`
--

LOCK TABLES `forum` WRITE;
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
INSERT INTO `forum` VALUES (1,1,1,'What is status','2024-06-23 18:30:00','ajhsvdjah','2024-06-23 18:30:00'),(2,2,2,'What is forum','2024-06-23 18:30:00','Status','2024-06-23 18:30:00'),(3,1,1,'how are you?','2024-06-23 18:30:00','fine','2024-06-23 18:30:00'),(4,5,3,'What are the qualifications required for this position?','2024-06-24 14:00:38','The qualifications...','2024-06-24 14:00:38'),(5,6,4,'Could you explain the career growth opportunities?','2024-06-24 14:00:38','The career growth opportunities...','2024-06-24 14:00:38'),(6,7,5,'Is there flexibility in work hours?','2024-06-24 14:00:38','Yes, there is flexibility...','2024-06-24 14:00:38'),(7,8,6,'How is performance evaluated in this role?','2024-06-24 14:00:38','Performance is evaluated based on...','2024-06-24 14:00:38'),(8,9,7,'What are the main challenges faced in this job?','2024-06-24 14:00:38','The main challenges include...','2024-06-24 14:00:38'),(9,10,8,'Can you describe the training and development programs?','2024-06-24 14:00:38','Training and development programs...','2024-06-24 14:00:38'),(10,3,9,'What are the key technologies used in this position?','2024-06-24 14:00:38','Key technologies used include...','2024-06-24 14:00:38');
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;
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
