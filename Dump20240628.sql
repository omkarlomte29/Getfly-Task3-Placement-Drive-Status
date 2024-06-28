-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tpo
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
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement` (
  `an_id` int NOT NULL AUTO_INCREMENT,
  `post_id` int DEFAULT NULL,
  `announcement` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`an_id`),
  KEY `anouncemen_postt_idx` (`post_id`),
  CONSTRAINT `anouncemen_postt` FOREIGN KEY (`post_id`) REFERENCES `job_postings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement`
--

LOCK TABLES `announcement` WRITE;
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
INSERT INTO `announcement` VALUES (1,1,'Upcoming drive details 1...','2024-06-26 10:42:21'),(2,2,'Summer Internship Drive details...','2024-06-26 10:42:21'),(3,3,'Job Fair Announcement...','2024-06-26 10:42:21'),(4,4,'New Job Opening in Marketing...','2024-06-26 10:42:21'),(5,5,'Recruitment Drive for IT positions...','2024-06-26 10:42:21'),(6,1,'Company XYZ Campus Placement Drive...','2024-06-26 10:42:21'),(7,2,'Virtual Career Fair Announcement...','2024-06-26 10:42:21'),(8,3,'Upcoming Interview Schedule...','2024-06-26 10:42:21'),(9,4,'Job Opportunities in Finance Sector...','2024-06-26 10:42:21'),(10,5,'Exciting Internship Opportunities...','2024-06-26 10:42:21');
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;
UNLOCK TABLES;

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
  `visited` int DEFAULT '1',
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
INSERT INTO `companies` VALUES (1,'GetFly','Mumbai','email','2024',1,'2024-06-17 10:37:13','2024-06-17 10:37:13'),(2,'Demo Company','Mumbai','whatsapp','2024',1,'2024-06-17 10:37:49','2024-06-17 10:37:49'),(3,'Company A','Mumbai','offline','2024',1,'2024-06-21 20:53:41','2024-06-21 20:55:57'),(5,'ABC Corporation','New York','Email','2023',1,'2024-06-24 13:20:30','2024-06-24 13:20:30'),(6,'XYZ Industries','Los Angeles','Phone','2024',1,'2024-06-24 13:20:30','2024-06-24 13:20:30'),(7,'Tech Solutions Ltd','London','Video Call','2022',1,'2024-06-24 13:20:30','2024-06-24 13:20:30'),(8,'Global Innovations','Tokyo','Email','2023',1,'2024-06-24 13:20:30','2024-06-24 13:20:30'),(9,'Smart Tech Inc','San Francisco','Video Call','2023',1,'2024-06-24 13:20:30','2024-06-24 13:20:30'),(10,'Data Solutions Group','Sydney','Email','2022',1,'2024-06-24 13:20:30','2024-06-24 13:20:30'),(11,'Innovative Systems','Berlin','Phone','2024',1,'2024-06-24 13:20:30','2024-06-24 13:20:30'),(12,'Tech Wizards Ltd','Toronto','Email','2023',1,'2024-06-24 13:20:30','2024-06-24 13:20:30'),(13,'Swift Innovations','Paris','Phone','2022',1,'2024-06-24 13:20:30','2024-06-24 13:20:30'),(14,'Digital Services Corp','Singapore','Video Call','2024',1,'2024-06-24 13:20:30','2024-06-24 13:20:30');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drive_status`
--

DROP TABLE IF EXISTS `drive_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drive_status` (
  `d_id` int NOT NULL AUTO_INCREMENT,
  `s_id` int NOT NULL,
  `p_id` int NOT NULL,
  `round1` tinyint DEFAULT '1',
  `round2` tinyint DEFAULT '0',
  `round3` tinyint DEFAULT '0',
  `round4` tinyint DEFAULT '0',
  `placedStudent` tinyint DEFAULT '0',
  PRIMARY KEY (`d_id`),
  KEY `student_id_idx` (`s_id`),
  KEY `post_id_idx` (`p_id`),
  CONSTRAINT `post_id` FOREIGN KEY (`p_id`) REFERENCES `job_postings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_id` FOREIGN KEY (`s_id`) REFERENCES `student_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drive_status`
--

LOCK TABLES `drive_status` WRITE;
/*!40000 ALTER TABLE `drive_status` DISABLE KEYS */;
INSERT INTO `drive_status` VALUES (1,1,1,1,0,0,0,0),(2,2,2,1,0,0,0,0),(3,3,3,1,0,0,0,0),(4,4,4,1,0,0,0,0),(5,5,5,1,0,0,0,0),(6,6,6,1,0,0,0,0),(7,7,7,1,0,0,0,0),(8,8,8,1,0,0,0,0),(9,9,9,1,0,0,0,0),(10,10,10,1,0,0,0,0),(11,11,1,1,0,0,0,0),(12,12,2,1,0,0,0,0),(13,13,3,1,0,0,0,0),(14,14,4,1,0,0,0,0),(15,15,5,1,0,0,0,0),(16,16,6,1,0,0,0,0),(17,17,7,1,0,0,0,0),(18,18,8,1,0,0,0,0);
/*!40000 ALTER TABLE `drive_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `drive_status_view`
--

DROP TABLE IF EXISTS `drive_status_view`;
/*!50001 DROP VIEW IF EXISTS `drive_status_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `drive_status_view` AS SELECT 
 1 AS `full_name`,
 1 AS `student_id`,
 1 AS `tpo_id`,
 1 AS `clg_id`,
 1 AS `mobile`,
 1 AS `branch`,
 1 AS `round1`,
 1 AS `round2`,
 1 AS `round3`,
 1 AS `round4`,
 1 AS `placedStudent`,
 1 AS `company_name`,
 1 AS `company_id`,
 1 AS `job_posting_id`*/;
SET character_set_client = @saved_cs_client;

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum`
--

LOCK TABLES `forum` WRITE;
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
INSERT INTO `forum` VALUES (1,1,1,'What is status','2024-06-23 18:30:00','sddf','2024-06-25 11:53:57'),(2,2,2,'What is forum','2024-06-23 18:30:00','Status','2024-06-23 18:30:00'),(3,1,1,'how are you?','2024-06-23 18:30:00','fine','2024-06-23 18:30:00'),(4,5,3,'What are the qualifications required for this position?','2024-06-24 14:00:38','The qualifications...','2024-06-24 14:00:38'),(5,6,4,'Could you explain the career growth opportunities?','2024-06-24 14:00:38','The career growth opportunities...','2024-06-24 14:00:38'),(6,7,5,'Is there flexibility in work hours?','2024-06-24 14:00:38','Yes, there is flexibility...','2024-06-24 14:00:38'),(7,8,6,'How is performance evaluated in this role?','2024-06-24 14:00:38','Performance is evaluated based on...','2024-06-24 14:00:38'),(8,9,7,'What are the main challenges faced in this job?','2024-06-24 14:00:38','The main challenges include...','2024-06-24 14:00:38'),(9,10,8,'Can you describe the training and development programs?','2024-06-24 14:00:38','Training and development programs...','2024-06-24 14:00:38'),(10,3,9,'What are the key technologies used in this position?','2024-06-24 14:00:38','Key technologies used include...','2024-06-24 14:00:38'),(11,1,1,'What skills are most important for this role?','2024-06-25 03:30:00','done.','2024-06-26 06:59:16'),(12,2,2,'How does your team handle deadlines?','2024-06-25 03:45:00',NULL,NULL),(13,3,3,'What opportunities are there for professional development?','2024-06-25 04:00:00',NULL,NULL),(14,4,4,'Can you describe the company culture?','2024-06-25 04:30:00',NULL,NULL),(15,5,5,'What are the next steps in the interview process?','2024-06-25 04:45:00',NULL,NULL),(16,6,6,'How does your team collaborate on projects?','2024-06-25 05:00:00',NULL,NULL),(17,7,7,'What are the expectations for overtime or extra hours?','2024-06-25 05:30:00',NULL,NULL),(18,8,8,'How do you measure success in this role?','2024-06-25 05:45:00',NULL,NULL),(19,9,9,'What are the key challenges facing your team right now?','2024-06-25 06:00:00',NULL,NULL),(20,10,10,'What types of projects will I be working on?','2024-06-25 06:30:00',NULL,NULL);
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `data_type` varchar(50) NOT NULL,
  `companyId` int DEFAULT NULL,
  `remarkId` int DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `companyId` (`companyId`),
  KEY `remarkId` (`remarkId`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`),
  CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`remarkId`) REFERENCES `remarks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `student_details`
--

DROP TABLE IF EXISTS `student_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email_id` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `clg_id` varchar(45) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `tpo_id` varchar(45) DEFAULT NULL,
  `branch` varchar(45) DEFAULT NULL,
  `degree` varchar(45) DEFAULT NULL,
  `loc` varchar(45) DEFAULT NULL,
  `ssc_per` float DEFAULT NULL,
  `ssc_year` int DEFAULT NULL,
  `hsc_per` float DEFAULT NULL,
  `hsc_year` int DEFAULT NULL,
  `diploma_per` float DEFAULT NULL,
  `diploma_year` int DEFAULT NULL,
  `degree_per` float DEFAULT NULL,
  `degree_cgpa` int DEFAULT NULL,
  `degree_year` int DEFAULT NULL,
  `resume` text,
  `comp_id` int DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_id_UNIQUE` (`email_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `tpo_id_UNIQUE` (`tpo_id`),
  UNIQUE KEY `clg_id_UNIQUE` (`clg_id`),
  UNIQUE KEY `mobile_UNIQUE` (`mobile`),
  KEY `fk_company_id` (`comp_id`),
  CONSTRAINT `fk_company_id` FOREIGN KEY (`comp_id`) REFERENCES `company_info` (`comp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_details`
--

LOCK TABLES `student_details` WRITE;
/*!40000 ALTER TABLE `student_details` DISABLE KEYS */;
INSERT INTO `student_details` VALUES (1,'yashpimpalkar214@gmail.com','$2b$10$657vDDhw0ZdZK8hAVH19NuJmLZgP35FASImHZP0v0T7iia3vdZnUi','Yash','Prakash','Pimpalkar','vu1s223003','1234567891','male','2024-01-19','TPO_765','IT','SE','mumbai',82.4,2019,68,2022,NULL,NULL,74.5,9,2024,'file-1718819610532-473214124.pdf',1,NULL),(2,'vu1s2223002@pvppcoe.ac.in','$2b$10$8kIBkTNC82qLeTHjGI/Sd.JBrCdrSWyVillYioBapJeULKdyG/adG','Yash','Prakash','Pimpalkar','vu1s223004','9834534574','male','2024-03-06','TPO_342','Comps','SE','mumbai',82.4,2019,68,2022,NULL,NULL,74.5,9,2024,'file-1718819876971-426607911.pdf',3,NULL),(3,'dmmovie720@gmail.com','$2b$10$0XO9vtkfAy.m1oCsBHTy7eAFGdF1ldF2vy8z/AlX3ZloYvW/XgGeu','Yash','Prakash','Pimpalkar','vu1s223005','9969123456','male','2024-06-18','TPO_352','AIDS','SE','mumbai',82.4,2019,NULL,NULL,90.75,2022,74.5,8,2024,'file-1718820472699-56859300.pdf',8,NULL),(4,'example1@example.com','$2b$10$hashedpassword1','John','Doe','Smith','vu1s223006','9876543210','male','2024-02-15','TPO_123','ECE','SE','New York',78.9,2020,70,2023,NULL,NULL,76.3,7,2025,'file-1.pdf',1,NULL),(5,'example2@example.com','$2b$10$hashedpassword2','Jane','Doe','Johnson','vu1s223007','9876543211','female','2024-04-30','TPO_456','MECH','TE','Los Angeles',85.6,2021,72,2024,NULL,NULL,79.8,8,2025,'file-2.pdf',3,NULL),(6,'example3@example.com','$2b$10$hashedpassword3','Michael','Smith','Williams','vu1s223008','9876543212','male','2024-07-10','TPO_789','Civil','BE','Chicago',81.2,2019,68,2022,NULL,NULL,77.1,9,2023,'file-3.pdf',8,NULL),(7,'student1@example.com','$2b$10$hashedpassword4','Emma','Johnson','Brown','vu1s223009','9876543213','female','2024-08-20','TPO_111','IT','FE','San Francisco',79.5,2020,71,2023,NULL,NULL,75.2,6,2025,'file-4.pdf',1,NULL),(8,'student2@example.com','$2b$10$hashedpassword5','James','Williams','Miller','vu1s223010','9876543214','male','2024-09-05','TPO_222','ECE','SE','Seattle',83.7,2021,73,2024,NULL,NULL,78.9,7,2025,'file-5.pdf',8,NULL),(9,'student3@example.com','$2b$10$hashedpassword6','Olivia','Brown','Wilson','vu1s223011','9876543215','female','2024-10-15','TPO_333','Comps','TE','Boston',87.1,2019,69,2022,NULL,NULL,82.1,8,2023,'file-6.pdf',1,NULL),(10,'student4@example.com','$2b$10$hashedpassword7','William','Jones','Anderson','vu1s223012','9876543216','male','2024-11-25','TPO_444','MECH','BE','Dallas',80.3,2020,72,2023,NULL,NULL,76.8,9,2024,'file-7.pdf',3,NULL),(11,'student5@example.com','$2b$10$hashedpassword8','Sophia','Davis','Martinez','vu1s223013','9876543217','female','2024-12-05','TPO_555','Civil','SE','Houston',84.9,2021,74,2024,NULL,NULL,79.5,7,2025,'file-8.pdf',8,NULL),(12,'student6@example.com','$2b$10$hashedpassword9','Liam','Garcia','Rodriguez','vu1s223014','9876543218','male','2025-01-10','TPO_666','IT','FE','New York',81.6,2019,70,2022,NULL,NULL,77.3,9,2023,'file-9.pdf',1,NULL),(13,'student7@example.com','$2b$10$hashedpassword10','Isabella','Hernandez','Hernandez','vu1s223015','9876543219','female','2025-02-20','TPO_777','ECE','SE','Los Angeles',86.2,2020,73,2023,NULL,NULL,80.7,8,2024,'file-10.pdf',3,NULL),(14,'student8@example.com','$2b$10$hashedpassword11','Logan','Martinez','Lopez','vu1s223016','9876543220','male','2025-03-15','TPO_888','Comps','TE','Chicago',82.5,2021,74,2024,NULL,NULL,78.3,7,2025,'file-11.pdf',8,NULL),(15,'student9@example.com','$2b$10$hashedpassword12','Mia','Gonzalez','Gonzalez','vu1s223017','9876543221','female','2025-04-25','TPO_999','MECH','BE','San Francisco',88.4,2019,71,2022,NULL,NULL,83.2,6,2023,'file-12.pdf',1,NULL),(16,'student10@example.com','$2b$10$hashedpassword13','Lucas','Perez','Perez','vu1s223018','9876543222','male','2025-05-30','TPO_1010','Civil','SE','Seattle',79.8,2020,72,2023,NULL,NULL,75.9,6,2024,'file-13.pdf',3,NULL),(17,'yash@gmail.com','$2b$10$6huAJ1UHHm2vOC4KIZT0aOzkbnuMbk2PFQHax/rsCtKyNmGrj1joG','Yash','Prakash','Pimpalkar','vu1s223100','9969157636','male','2024-06-19','TPO_770','IT','FE','mumbai',82.4,2019,89,2022,NULL,NULL,74.5,4,2024,'file-1719053389875-859058636.pdf',NULL,NULL),(18,'abhinav@gmail.com','$2b$10$G7lf0hP4zoBDD6mBFdsCqOejXmu6ic1WnuEEvQrRivNHbMfQOmKNa','Yash','asf','Pimpalkar','vu1s223101','9923435223','male','2024-06-19','TPO_326','IT','SE','mumbai',82.4,2019,68,2022,NULL,NULL,74.5,9,2024,'file-1719054654160-98634211.pdf',NULL,NULL),(19,'asd@gmail.com','$2b$10$miBzW04Pmwa6zTYone03z.RrOzLJF.qS1pylFnSF14i4UZqv/bI4W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `student_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `drive_status_view`
--

/*!50001 DROP VIEW IF EXISTS `drive_status_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `drive_status_view` AS select concat(`s`.`first_name`,' ',`s`.`middle_name`,' ',`s`.`last_name`) AS `full_name`,`s`.`id` AS `student_id`,`s`.`tpo_id` AS `tpo_id`,`s`.`clg_id` AS `clg_id`,`s`.`mobile` AS `mobile`,`s`.`branch` AS `branch`,`d`.`round1` AS `round1`,`d`.`round2` AS `round2`,`d`.`round3` AS `round3`,`d`.`round4` AS `round4`,`d`.`placedStudent` AS `placedStudent`,`c`.`name` AS `company_name`,`c`.`id` AS `company_id`,`j`.`id` AS `job_posting_id` from (((`student_details` `s` join `drive_status` `d` on((`s`.`id` = `d`.`s_id`))) join `job_postings` `j` on((`d`.`p_id` = `j`.`id`))) join `companies` `c` on((`j`.`companyId` = `c`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-28 11:14:24
