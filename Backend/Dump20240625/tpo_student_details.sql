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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-25 13:00:37
