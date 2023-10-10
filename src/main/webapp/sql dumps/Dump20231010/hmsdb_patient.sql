-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: hmsdb
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `idpatient` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `ic` varchar(12) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `phonenumber` varchar(11) NOT NULL,
  `nationality` varchar(45) NOT NULL,
  `dateofbirth` date NOT NULL,
  `address` varchar(120) NOT NULL,
  `appointmentDate` datetime NOT NULL,
  `status` int NOT NULL,
  `statusprogress` varchar(45) DEFAULT NULL,
  `doctorid` int DEFAULT NULL,
  `predicament` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpatient`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Muhammad Nabil','980725116031','Male','0125603450','Malaysia','1998-07-25','231, Taman Maharaja Lela, 70400 Seremban, Negeri Sembilan','2023-09-23 00:00:00',1,'Assigned',13,NULL),(2,'Siti Ayuni','990131140942','Female','0146789043','Malaysia','1999-01-31','78, Lorong Mahsuri, Kampung Mahsuri, 60302 Langkawi, Kedah','2023-11-02 00:00:00',1,'Assigned',7,NULL),(3,'Nor Farahin','981010083452','Female','0186308976','Malaysia','1998-10-10','362, Felda Jengka 8, 26400 Jengka, Pahang','2023-12-02 00:00:00',1,'Assigned',11,NULL),(4,'Mohd Idham','000218125051','Male','0136127933','Malaysia','2000-02-18','28, Jalan Rajawali, Blok B, Kampung Pasir Putih, 91000 Tawau, Sabah','2023-10-09 17:00:00',2,'Assigned',7,NULL),(5,'Syafiq Musa','720415034035','Male','0198765043','Malaysia','1972-04-15','123, Jalan Aman Bahagia, Taman Murni, 67000 Jerantut, Pahang','2023-11-29 00:00:00',0,'Discharged',10,NULL),(6,'Siti Zarifah','990503162436','Female','01132134905','Malaysia','1999-05-03','30 Jalan Perak, 23854, Kuala Kangsar, Perak','2023-10-06 10:27:00',1,'Registered',NULL,NULL),(7,'Muhammad Nur Aiman','990222095123','Male','01987654321','Malaysia','1999-02-22','61,Lebuhraya Sejahtera Indah, 18656, Seremban, Negeri Sembilan','2023-09-06 10:27:00',1,'Assigned',13,NULL),(8,'Nabil Asyraf','991122074021','Male','0132774561','Malaysia','1999-11-22','21, Jalan Reko 3, Taman Reko Utama, 45600, Bandar Baru Bangi, Selangor','2023-10-05 16:40:00',0,'Discharged',10,NULL),(9,'Syamil Arif','000918075111','Male','0128774554','Malaysia','2000-09-18','5, Jalan Kiara Utama, Taman Kiara Heights, 43400, Bandar Tasik Selatan, Selangor','2023-10-09 16:00:00',1,'Assigned',7,NULL),(10,'Kamal Adli','700118411015','Male','0123456789','Malaysia','1970-01-18','6,Lorong Damai Indah, 12396, Putrajaya, Putrajaya','2023-10-07 00:01:00',1,'Assigned',13,NULL),(11,'Danial Haqeem','931216285147','Male','0123456789','Malaysia','1993-12-16','88,Jalan Raya, 19771, Kota Bharu, Kelantan','2023-10-12 13:07:00',1,'Assigned',13,NULL),(12,'Maisarah','230827032940','Female','01234567890','Malaysia','2023-08-27','75,Jalan Permai, 17746, Kuala Terengganu, Terengganu','2023-10-07 00:19:00',1,'Assigned',7,NULL),(13,'Laili Alia','190419322946','Female','0123456789','Malaysia','2019-04-19','43,Lorong Damai Indah, 14250, Johor Bahru, Johor','2023-10-26 00:21:00',1,'Assigned',13,NULL),(14,'Nor Zulaikha','180123034486','Female','0123456789','Malaysia','2018-01-23','23,Jalan Sentosa Ria, 11107, Miri, Sarawak','2023-10-06 13:40:00',1,'Assigned',10,NULL),(15,'Khavitha','970709146724','Female','0123456789','Malaysia','1997-07-09','64,Jalan Besar, 10904, Kajang, Selangor','2023-10-16 13:41:00',1,'Registered',NULL,NULL),(16,'Tan Kian Ho','971218025423','Male','0123456789','Malaysia','1997-12-18','7,Lorong Damai Sejahtera, 12865, Kuala Lumpur, Kuala Lumpur','2023-10-09 13:21:00',1,'Assigned',6,NULL),(17,'Firdaus Akmal','860607145677','Male','0123456789','Malaysia','1986-06-07','8,Persiaran Harmoni Cemerlang, 19893, Alor Setar, Kedah','2023-10-07 10:58:00',1,'Registered',NULL,NULL),(18,'Annabilah binti Muhd Razman','960312404546','Female','0112341234','Malaysia','1996-03-12','Gua Kelam, 02600, Arau, Perlis','2023-10-06 15:00:00',2,'Assigned',13,NULL),(23,'Ahmad Firdaus','000403011017','Male','0112223905','Malaysia','2023-10-02','Jalan 90, Bukit Gaising, 42700, Banting, Selangor','2023-10-09 17:24:00',0,'Discharged',7,NULL);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-10  9:28:38
