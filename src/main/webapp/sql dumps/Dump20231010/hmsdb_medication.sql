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
-- Table structure for table `medication`
--

DROP TABLE IF EXISTS `medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medication` (
  `medicationid` int NOT NULL AUTO_INCREMENT,
  `patientid` int NOT NULL,
  `dosage` varchar(45) NOT NULL,
  `frequency` varchar(45) NOT NULL,
  `startdatetime` date NOT NULL,
  `enddatetime` date NOT NULL,
  `duration` varchar(45) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `prescribeby` int NOT NULL,
  `medicationList_id` int NOT NULL,
  PRIMARY KEY (`medicationid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication`
--

LOCK TABLES `medication` WRITE;
/*!40000 ALTER TABLE `medication` DISABLE KEYS */;
INSERT INTO `medication` VALUES (1,18,'1000','2','2023-10-06','2023-10-20','14','Eat a balanced diet.',1,4),(2,18,'2000','2','2023-10-09','2023-10-27','18','Exercise regularly.',1,7),(3,18,'1000','1','2023-10-15','2023-10-29','14','Get enough sleep.',1,11),(4,18,'500','2','2023-10-06','2023-10-20','14','Manage stress.',1,9),(5,17,'500','2','2023-10-06','2023-10-20','14','Quit smoking and limit alcohol.',1,11),(6,4,'2000','1','2023-10-05','2023-10-13','8','High fever.',13,11),(7,12,'2000','1','2023-10-05','2023-10-26','21','Practice good hygiene.',13,2),(8,12,'500','2','2023-10-05','2023-10-20','15','Practice good hygiene.',13,2),(9,12,'500','2','2023-10-05','2023-10-26','21','Quit smoking and limit alcohol.',13,9),(11,20,'2000','2','2023-10-01','2023-10-15','1000','Reduce consumption of sugar.',13,2),(12,20,'500','2','2023-10-08','2023-10-08','1000','Limit caffeine and sugary drinks.',13,4),(13,20,'500','2','2023-10-01','2023-10-15','14','Practice good hygiene.',13,2),(14,20,'500','1','2023-10-01','2023-10-15','14','Limit caffeine and sugary drinks.',13,3),(15,20,'500','2','2023-10-01','2023-10-15','14','Limit caffeine and sugary drinks.',13,16),(16,20,'1000','2','2023-10-08','2023-10-09','1','Practice good hygiene.',13,12),(18,20,'1000','1','2023-10-01','2023-10-15','14','Limit caffeine and sugary drinks.',13,10),(19,20,'500','1','2023-10-01','2023-10-15','14','Limit caffeine and sugary drinks.',13,6),(20,20,'1000','2','2023-10-01','2023-10-15','14','Manage Stress.',13,4),(21,20,'1000','2','2023-10-01','2023-10-08','7','Limit caffeine and sugary drinks.',13,5),(23,10,'2000','3','2023-10-17','2023-10-27','10','Practice good hygiene.',10,6),(24,10,'1000','3','2023-10-08','2023-10-12','4','Limit caffeine and sugary drinks.',10,16),(25,10,'2000','3','2023-10-13','2023-10-27','14','Manage Stress.',10,8),(26,10,'500','3','2023-10-08','2023-10-27','19','Practice good hygiene.',10,10),(27,10,'500','3','2023-10-10','2023-10-19','9','Eat a balanced diet.',10,9),(28,5,'1000','3','2023-10-01','2023-10-22','21','Manage Stress.',10,16),(29,5,'2000','2','2023-10-01','2023-10-15','14','Quit smoking and limit alcohol.',10,11),(30,5,'1000','2','2023-10-01','2023-10-08','7','Quit smoking and limit alcohol.',10,2),(31,17,'2000','2','2023-10-08','2023-11-30','22','Quit smoking and limit alcohol.',10,22),(32,17,'1000','2','2023-10-08','2023-10-29','21','Manage Stress.',10,2);
/*!40000 ALTER TABLE `medication` ENABLE KEYS */;
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
