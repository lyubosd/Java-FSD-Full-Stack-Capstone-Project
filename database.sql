CREATE DATABASE  IF NOT EXISTS `medlsd` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `medlsd`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: medlsd
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (155);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_quantity`
--

DROP TABLE IF EXISTS `product_quantity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_quantity` (
  `pqid` bigint NOT NULL,
  `quantity` int NOT NULL,
  `product_pid` bigint DEFAULT NULL,
  PRIMARY KEY (`pqid`),
  KEY `FKip34w0vkav30av9foyw8920h3` (`product_pid`),
  CONSTRAINT `FKip34w0vkav30av9foyw8920h3` FOREIGN KEY (`product_pid`) REFERENCES `products` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_quantity`
--

LOCK TABLES `product_quantity` WRITE;
/*!40000 ALTER TABLE `product_quantity` DISABLE KEYS */;
INSERT INTO `product_quantity` VALUES (146,4,3);
/*!40000 ALTER TABLE `product_quantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `pid` bigint NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `description` text,
  `is_available` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `total_available` int NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (3,'Divi\'s laboratories limited','Hormone','Melatonin is a hormone that your brain produces in response to darkness. It helps with the timing of your circadian rhythms ',_binary '','Melatonin',13.16,436),(7,'Divi\'s laboratories limited','Analgesics','Acetaminophen is used to relieve mild to moderate pain from headaches, muscle aches, menstrual periods, colds and sore throats, toothaches, backaches, and reactions to vaccinations (shots), and to reduce fever.',_binary '','Acetaminophen ',8.5,398),(9,'CadilZydus Cadila healthcarea Pharma Ltd.','Gastro Intestinal','Omeprazole reduces the amount of acid your stomach makes. It\'s widely used to treat indigestion and heartburn, and acid reflux. It\'s also taken to prevent and treat stomach ulcers. Omeprazole is a type of medicine called a proton pump inhibitor (PPI).',_binary '','Omeprazole ',8.12,800),(11,'Zydus Cadila healthcare','Anti Infectives','Augmentin 625 Duo Tablet is a penicillin-type of antibiotic that helps your body fight infections caused by bacteria.',_binary '','Augmentin 625 Duo Tablet',170,555),(13,'Aurobindo pharma','Analgesics','Hydrocodone is an antitussive (cough suppressant) and narcotic analgesic agent for the treatment of moderate to moderately severe pain. Studies indicate that hydrocodone is as effective, or more effective, than codeine for cough suppression and nearly equipotent to morphine for pain relief.',_binary '','Hydrocodone ',5.8,650),(15,'Aurobindo pharma','Analgesics','Paracetamol is a common painkiller used to treat aches and pain. It can also be used to reduce a high temperature.',_binary '','Paracetamol',1.18,1000),(17,'Lupin Limited','Antibiotics ','Keflex is a cephalosporin (SEF a low spor in) antibiotic. It works by fighting bacteria in your body. Keflex is used to treat infections caused by bacteria, including upper respiratory infections, ear infections, skin infections, urinary tract infections and bone infections.',_binary '','Keflex ',56.3,25),(19,'Lupin Limited','Diabetes','Forxiga is a medicine used to treat type 2 diabetes, chronic (long-term) heart failure and chronic kidney disease.',_binary '','Forxiga',50.99,167),(154,'New medicine','OPA','OPA',_binary '\0','yuyu uyu',344,43);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` bigint NOT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (101,'Administrator'),(102,'Client');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_order`
--

DROP TABLE IF EXISTS `user_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_order` (
  `oid` bigint NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `payment_mode` varchar(255) DEFAULT NULL,
  `pin_code` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_order`
--

LOCK TABLES `user_order` WRITE;
/*!40000 ALTER TABLE `user_order` DISABLE KEYS */;
INSERT INTO `user_order` VALUES (147,'uyuyuy','897987987','16-ago-2023','989898988989889','yuyu','uyu',52.64,'CARD-PAYMENT','uy7','yiuyiuy','PLACED','admin@admin');
/*!40000 ALTER TABLE `user_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_order_products`
--

DROP TABLE IF EXISTS `user_order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_order_products` (
  `user_order_oid` bigint NOT NULL,
  `products_pqid` bigint NOT NULL,
  PRIMARY KEY (`user_order_oid`,`products_pqid`),
  KEY `FKle2bws20c5sc21o3i1wjxcu8d` (`products_pqid`),
  CONSTRAINT `FK2tve5s0w3x52t2vmvjtnegmbb` FOREIGN KEY (`user_order_oid`) REFERENCES `user_order` (`oid`),
  CONSTRAINT `FKle2bws20c5sc21o3i1wjxcu8d` FOREIGN KEY (`products_pqid`) REFERENCES `product_quantity` (`pqid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_order_products`
--

LOCK TABLES `user_order_products` WRITE;
/*!40000 ALTER TABLE `user_order_products` DISABLE KEYS */;
INSERT INTO `user_order_products` VALUES (147,146);
/*!40000 ALTER TABLE `user_order_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_role_id` bigint NOT NULL,
  `role_role_id` bigint DEFAULT NULL,
  `user_user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`user_role_id`),
  KEY `FK7u21823ktfhu9bmx2350x6n8s` (`role_role_id`),
  KEY `FK8gqp8vkivwjo8us69ct7b35vl` (`user_user_id`),
  CONSTRAINT `FK7u21823ktfhu9bmx2350x6n8s` FOREIGN KEY (`role_role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `FK8gqp8vkivwjo8us69ct7b35vl` FOREIGN KEY (`user_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (2,101,1),(70,102,69),(110,102,109),(117,102,116),(121,102,120),(127,102,126),(145,101,144),(150,102,149);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` bigint NOT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'678934321',_binary '','Roberto','Alvarez','$2a$2a$10$teAPepLPy30BZYdd76tjx.VjcrWmtM9v70.1JHZrdwyS/LDOAfqwS','roberto.a.a@gmail.com'),(69,'653892211',_binary '','Carlos','Rodriguez','$2a$10$teAPepLPy30BZYdd76tjx.VjcrWmtM9v70.1JHZrdwyS/LDOAfqwS','carlos.ro@gmail.com'),(109,'653891233',_binary '','Pablo','Vega','$2a$10$teAPepLPy30BZYdd76tjx.VjcrWmtM9v70.1JHZrdwyS/LDOAfqwS','pablo1993@gmail.com'),(116,'676893429',_binary '','Antonio','Pelaez','$2a$10$teAPepLPy30BZYdd76tjx.VjcrWmtM9v70.1JHZrdwyS/LDOAfqwS','a.pelaez2@gmail.com'),(120,'621234567',_binary '','Lyubo','Simeonov Dimitrov','$2a$10$sMGVBhJfY3rg8I$10$teAPepLPy30BZYdd76tjx.VjcrWmtM9v70.1JHZrdwyS/LDOAfqwS','lyubo@medicare.com'),(126,'653834433',_binary '','L','D','$2a$10$teAPepLPy30BZYdd76tjx.VjcrWmtM9v70.1JHZrdwyS/LDOAfqwS','user@user.com'),(144,'654434216',_binary '','Lyubo','Simeonov Dimitrov','$2a$10$LqALVYpyNptq4nMazswBJeppWVjGW3qPme.V.2uGMwuOqS7.yroIO','admin@medicare.es'),(149,'693485433',_binary '','Angel','Hernandez','$2a$10$EtCCEkYwaUuT1j1HIRqZ.OMKkL2.8yhuAfY.GUpURuWLjmpw3L2gy','angel1991@gmail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'medlsd'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-16 17:59:08
