-- MySQL dump 10.13  Distrib 8.2.0, for Linux (x86_64)
--
-- Host: localhost    Database: busines_sector
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'new name','set last name',NULL,'f6a9f574-6984-4405-b6a7-538743bfa1e3.jpg','2024-01-09 17:14:33','2024-01-09 19:43:01',1),(2,'first name2',NULL,NULL,NULL,'2024-01-09 17:14:36','2024-01-09 17:14:36',2),(3,'first name23',NULL,NULL,NULL,'2024-01-09 17:14:39','2024-01-09 17:14:39',3),(4,'first name2',NULL,NULL,NULL,'2024-01-09 17:15:52','2024-01-09 17:15:52',4),(5,'first name3',NULL,NULL,NULL,'2024-01-09 17:15:57','2024-01-09 17:15:57',5),(6,'first name4',NULL,NULL,NULL,'2024-01-09 17:16:02','2024-01-09 17:16:02',6),(7,'first name5',NULL,NULL,NULL,'2024-01-09 17:16:08','2024-01-09 17:16:08',7),(8,'first name6',NULL,NULL,NULL,'2024-01-09 17:16:14','2024-01-09 17:16:14',8),(9,'first name7',NULL,NULL,NULL,'2024-01-09 17:16:19','2024-01-09 17:16:19',9),(10,'first name8',NULL,NULL,NULL,'2024-01-09 17:16:24','2024-01-09 17:16:24',10),(11,'first name9',NULL,NULL,NULL,'2024-01-09 17:16:29','2024-01-09 17:16:29',11),(12,'first name10',NULL,NULL,NULL,'2024-01-09 17:16:35','2024-01-09 17:16:35',12),(13,'first name11',NULL,NULL,NULL,'2024-01-09 17:16:40','2024-01-09 17:16:40',13);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test1','$2b$07$fvX1WMfDIYzFr.AR.Jq50eFtBw.R6DsZYAnAmQd2RMfePZR6/McZy','2024-01-09 17:14:33','2024-01-09 17:14:33'),(2,'test12','$2b$07$NigXKAui7jbLWVr0CPHP4efj3vlOVcR60s1UOwZzCkVB0V9WwNs3W','2024-01-09 17:14:36','2024-01-09 17:14:36'),(3,'test123','$2b$07$176FTuisz2qRurGEQQp/Ze0ppOT5adN0xRdhFCr2A8jqARrwtEL3y','2024-01-09 17:14:39','2024-01-09 17:14:39'),(4,'test2','$2b$07$bfjy8qXW649NSIf3TgO2Xuk00e68a4h9q6VmgKjUHYU1.Er/4v5j2','2024-01-09 17:15:52','2024-01-09 17:15:52'),(5,'test3','$2b$07$uWBNUoKjjmJK6DJ8IE9Uyubz1TbwSdg6EE1Cqksz1P8rytYUEg5zy','2024-01-09 17:15:57','2024-01-09 17:15:57'),(6,'test4','$2b$07$5MpEQK4pgLrxQ7QrGXyscOYey5UEXQfPXsD8TNBij3jyJlYTaCx/K','2024-01-09 17:16:02','2024-01-09 17:16:02'),(7,'test5','$2b$07$032o3gtC.0QFw71B8jSXEepO1OMGCRnlMuKL31WR2Pqztb1QKExOC','2024-01-09 17:16:08','2024-01-09 17:16:08'),(8,'test6','$2b$07$QxQfOheB0aicFaN5LhFq.uZpBTKlcJkNsqyJ.d8f1aTklReEvKAHm','2024-01-09 17:16:14','2024-01-09 17:16:14'),(9,'test7','$2b$07$fcxvKRExzWFRYOLykmmN4uL/FbGBwQMSjIMmUAmkS4COlFVCSw9m6','2024-01-09 17:16:19','2024-01-09 17:16:19'),(10,'test8','$2b$07$kcXRyH0KJw5Mzvl0mPfaHeYTGWhSDi3WkwP4AlM1e7cNgXv3gWdZC','2024-01-09 17:16:24','2024-01-09 17:16:24'),(11,'test9','$2b$07$yEO5bzithPgwzf0g4DT6fuIsnFU20p5G/O1WB0y3LZV1ROlGUVy0a','2024-01-09 17:16:29','2024-01-09 17:16:29'),(12,'test10','$2b$07$hOYget5U7e0ioVP9yc4tQOdsWLOj9bDWNeCwRtdT/SIz9M9sdfjAi','2024-01-09 17:16:35','2024-01-09 17:16:35'),(13,'test11','$2b$07$UzvkTCVWiEUJwSwkRPt3ueH6WyiZMC6fFZrl79NwLeTBTAv8B8zcO','2024-01-09 17:16:40','2024-01-09 17:16:40');
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

-- Dump completed on 2024-01-09 19:49:20
