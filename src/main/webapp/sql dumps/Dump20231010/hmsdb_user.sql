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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `accessLevel` int DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `ic` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `phonenumber` varchar(12) DEFAULT NULL,
  `nationality` varchar(45) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `address` varchar(120) DEFAULT NULL,
  `profilePicture` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Nurul Nabilah','nabilah@gmail.com','password123',0,'Administrator','980911140532','Female','01128004249','Malaysia','1998-09-11','30, Jalan Ampang, Taman Sejora,80100 Kuala Lumpur',NULL),(2,'Nur Hafizatul Izzah','izzah@gmail.com','password123',0,'Administrator','990916125428','Female','0137299034','Malaysia','1999-09-16','23, Jalan Seri Pagi 4, Taman Seri Pagi, 73000 Seremban, Negeri Sembilan',NULL),(3,'Nur Aleina','aleina@gmail.com','password123',0,'Administrator','951220056378','Female','0166141875','Malaysia','1995-12-20','75,Jalan Seri Bunga, 14360, Johor Bahru, Johor',NULL),(4,'Osman Sairi','osman@gmail.com','123',0,'Administrator','980203040507','Male','0123456789','Malaysia','1998-02-03','81,Jalan Cemerlang Heights, 19882, Subang Jaya, Selangor',NULL),(5,'Arif Amiruddin','arif@gmail.com','password123',0,'Administrator','000314125443','Male','0189974556','Malaysia','2000-03-14','Lot 29, Jalan 3/6, Bandar Baru Bangi 43560, Selangor',NULL),(6,'Nur Aina','aina@gmail.com','password321',2,'Doctor','780226521620','Female','0188318671','Malaysia','1978-02-26','29,Jalan Mutiara Bahagia, 14491, Cyberjaya, Selangor',NULL),(7,'Abdul Halim','halim@gmail.com','password321',2,'Doctor','720225156871','Male','0188318671','Malaysia','1972-02-25','30 Jalan Perak, 23854, Kuala Kangsar, Perak',NULL),(8,'Ahmad Kamil','kamil@gmail.com','password321',2,'Doctor','660617574701','Male','0188318671','Malaysia','1966-06-17','20,Lorong Damai Sejahtera, 17458, Ipoh, Perak',NULL),(9,'Muaz','muaz@gmail.com','password321',2,'Doctor','820228094651','Male','0188318671','Malaysia','1982-02-28','77,Jalan Permai, 13222, Seremban, Negeri Sembilan',NULL),(10,'Nur Izzaty Auni','izzaty@gmail.com','password321',2,'Doctor','771019002882','Female','0188318671','Malaysia','1977-10-19','84,Jalan Seri Bunga, 16491, Subang Jaya, Selangor',NULL),(11,'Nurul Aisyah','aisyah@gmail.com','password321',1,'Nurse','991115930410','Female','0188318671','Malaysia','1999-11-15','84,Lorong Damai Indah, 17951, Kota Kinabalu, Sabah',NULL),(12,'Naim Najmi','naim@gmail.com','password321',1,'Nurse','000524672165','Male','0188318671','Malaysia','2000-05-24','47,Jalan Seri Bunga, 17936, Shah Alam, Selangor',NULL),(13,'Ammar Aizat','ammar@gmail.com','password321',1,'Nurse','941029047833','Male','0178953443','Malaysia','1994-10-29','Angkasapuri, 70450, Seremban, Negeri Sembilan',NULL),(14,'Siti Zarifah','zarifah@gmail.com','password321',1,'Nurse','820316417284','Female','01132134905','Malaysia','1982-03-16','43,Jalan Sentosa Ria, 14057, Kota Kinabalu, Sabah',_binary '?'),(15,'Fatin Amirah','amirah@gmail.com','password321',1,'Nurse','951010104556','Female','0123456789','Malaysia','1995-10-10','83,Persiaran Murni Jaya, 18678, Subang Jaya, Selangor',_binary '?'),(24,'Siti Zarifah','arif@gmail.com','password123',1,'Nurse','010131040872','Male','01132134905','Malaysian','2023-10-10','30 Jalan Perak, 23854, Kuala Kangsar, Perak',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-10  9:28:37
