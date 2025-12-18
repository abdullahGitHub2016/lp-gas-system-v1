-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: lpg_management
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
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
  `code` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Jamuna LP Gas',NULL,'2025-12-09 09:01:14','2025-12-09 09:01:14'),(2,'Bashundhara LP Gas Limited (BLPGL)',NULL,'2025-12-09 09:01:14','2025-12-09 09:01:14'),(3,'Omera LPG',NULL,'2025-12-09 09:01:14','2025-12-09 09:01:14'),(4,'Petromax LPG',NULL,'2025-12-09 09:01:14','2025-12-09 09:01:14'),(5,'Pacific Gas Bangladesh Limited (PGBL)',NULL,'2025-12-09 09:01:14','2025-12-09 09:01:14'),(6,'Beximco LPG Unit-1 Ltd.',NULL,'2025-12-09 09:01:14','2025-12-09 09:01:14');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cylinder_sizes`
--

DROP TABLE IF EXISTS `cylinder_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cylinder_sizes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `weight_kg` decimal(6,2) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cylinder_sizes`
--

LOCK TABLES `cylinder_sizes` WRITE;
/*!40000 ALTER TABLE `cylinder_sizes` DISABLE KEYS */;
INSERT INTO `cylinder_sizes` VALUES (1,'Small',5.00,'Small cylinder, 5kg','2025-12-09 09:05:47','2025-12-09 09:05:47'),(2,'Medium',12.00,'Medium cylinder, 12kg','2025-12-09 09:05:47','2025-12-09 09:05:47'),(3,'Large',24.00,'Large cylinder, 24kg','2025-12-09 09:05:47','2025-12-09 09:05:47'),(4,'Small',5.00,'Small cylinder, 5kg','2025-12-09 09:05:48','2025-12-09 09:05:48'),(5,'Medium',12.00,'Medium cylinder, 12kg','2025-12-09 09:05:48','2025-12-09 09:05:48'),(6,'Large',24.00,'Large cylinder, 24kg','2025-12-09 09:05:48','2025-12-09 09:05:48');
/*!40000 ALTER TABLE `cylinder_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dealers`
--

DROP TABLE IF EXISTS `dealers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dealers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text,
  `credit_limit` decimal(14,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dealers`
--

LOCK TABLES `dealers` WRITE;
/*!40000 ALTER TABLE `dealers` DISABLE KEYS */;
INSERT INTO `dealers` VALUES (1,'NSS Dhaka','Mr. Rahman','01711111111','Dhaka, Bangladesh',200000.00,'2025-12-09 09:09:22','2025-12-09 09:09:22'),(2,'ABC Store','Ms. Sultana','01712222222','Chittagong, Bangladesh',150000.00,'2025-12-09 09:09:22','2025-12-09 09:09:22'),(3,'XYZ Store','Mr. Karim','01713333333','Khulna, Bangladesh',100000.00,'2025-12-09 09:09:22','2025-12-09 09:09:22'),(4,'Delta LPG','Mr. Alam','01714444444','Barishal, Bangladesh',180000.00,'2025-12-09 09:09:22','2025-12-09 09:09:22'),(5,'Omega Traders','Ms. Hossain','01715555555','Sylhet, Bangladesh',120000.00,'2025-12-09 09:09:22','2025-12-09 09:09:22');
/*!40000 ALTER TABLE `dealers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lot_price_history`
--

DROP TABLE IF EXISTS `lot_price_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lot_price_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lot_id` int NOT NULL,
  `old_price` decimal(14,2) DEFAULT NULL,
  `new_price` decimal(14,2) DEFAULT NULL,
  `changed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lot_id` (`lot_id`),
  CONSTRAINT `lot_price_history_ibfk_1` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lot_price_history`
--

LOCK TABLES `lot_price_history` WRITE;
/*!40000 ALTER TABLE `lot_price_history` DISABLE KEYS */;
INSERT INTO `lot_price_history` VALUES (19,22,1500.00,1550.00,'2025-12-10 04:00:00',1),(20,25,2500.00,2600.00,'2025-12-11 05:30:00',2),(21,28,1450.00,1500.00,'2025-12-12 03:45:00',1),(22,31,3500.00,3550.00,'2025-12-13 08:15:00',2),(23,34,2400.00,2450.00,'2025-12-14 10:00:00',3),(24,37,3600.00,3650.00,'2025-12-15 06:00:00',3);
/*!40000 ALTER TABLE `lot_price_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lots`
--

DROP TABLE IF EXISTS `lots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lots` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `cylinder_size_id` int NOT NULL,
  `lot_number` varchar(100) NOT NULL,
  `purchase_price` decimal(14,2) NOT NULL,
  `quantity` int NOT NULL,
  `remaining_quantity` int NOT NULL,
  `purchase_date` date NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `remarks` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_id` (`company_id`,`cylinder_size_id`,`lot_number`),
  KEY `cylinder_size_id` (`cylinder_size_id`),
  CONSTRAINT `lots_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `lots_ibfk_2` FOREIGN KEY (`cylinder_size_id`) REFERENCES `cylinder_sizes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lots`
--

LOCK TABLES `lots` WRITE;
/*!40000 ALTER TABLE `lots` DISABLE KEYS */;
INSERT INTO `lots` VALUES (1,1,1,'DHK-12KG-001',450.00,200,200,'2025-12-14','2027-12-14','New stock, high priority','2025-12-14 10:54:14','2025-12-14 10:54:14'),(2,1,3,'DHK-45KG-002',1550.75,100,95,'2025-12-10','2027-12-10','Large purchase from GazMax','2025-12-14 10:54:14','2025-12-14 10:54:14'),(3,2,1,'CTG-12KG-003',460.00,50,25,'2025-11-20','2026-11-20','Quick turnover lot','2025-12-14 10:54:14','2025-12-14 10:54:14'),(4,2,2,'CTG-25KG-004',880.50,75,75,'2025-10-01','2026-04-01','Priority sale batch, short expiry','2025-12-14 10:54:14','2025-12-14 10:54:14'),(5,1,3,'DHK-45KG-005',1545.00,150,150,'2025-12-05','2027-12-05','Bulk purchase from Alpha','2025-12-14 10:54:14','2025-12-14 10:54:14'),(6,1,1,'DHK-12KG-006',445.00,500,480,'2025-12-14','2027-12-14','Recent large delivery','2025-12-14 10:54:14','2025-12-14 10:54:14'),(7,2,2,'CTG-25KG-007',890.00,30,5,'2025-09-15','2026-09-15','Almost depleted stock','2025-12-14 10:54:14','2025-12-14 10:54:14'),(8,2,1,'CTG-12KG-008',475.00,100,100,'2025-12-12','2027-12-12','Premium quality batch','2025-12-14 10:54:14','2025-12-14 10:54:14'),(9,1,3,'DHK-45KG-009',1560.00,80,60,'2025-11-01','2027-11-01','Standard stock movement','2025-12-14 10:54:14','2025-12-14 10:54:14'),(10,2,2,'CTG-TEST-010',900.00,10,10,'2025-12-14','2027-12-14','Small test batch','2025-12-14 10:54:14','2025-12-14 10:54:14'),(22,1,1,'LOT-007',1520.00,120,120,'2025-12-07','2026-06-10','Extra small cylinders batch','2025-12-09 09:15:34','2025-12-09 09:15:34'),(23,1,2,'LOT-008',2550.00,60,60,'2025-12-08','2026-06-12','Extra medium cylinders batch','2025-12-09 09:15:34','2025-12-09 09:15:34'),(24,1,3,'LOT-009',3600.00,35,35,'2025-12-09','2026-06-18','Extra large cylinders batch','2025-12-09 09:15:34','2025-12-09 09:15:34'),(25,2,1,'LOT-010',1480.00,110,110,'2025-12-07','2026-06-08','BLPGL small cylinders batch','2025-12-09 09:15:34','2025-12-09 09:15:34'),(26,2,2,'LOT-011',2500.00,55,55,'2025-12-08','2026-06-14','BLPGL medium cylinders batch','2025-12-09 09:15:34','2025-12-09 09:15:34'),(27,2,3,'LOT-012',3550.00,28,28,'2025-12-09','2026-06-20','BLPGL large cylinders batch','2025-12-09 09:15:34','2025-12-09 09:15:34'),(28,3,1,'LOT-013',1460.00,130,130,'2025-12-10','2026-06-15','Omera small cylinders batch','2025-12-09 09:15:34','2025-12-09 09:15:34'),(29,3,2,'LOT-014',2450.00,75,75,'2025-12-11','2026-06-17','Omera medium cylinders batch','2025-12-09 09:15:34','2025-12-09 09:15:34'),(30,3,3,'LOT-015',3620.00,45,45,'2025-12-12','2026-06-22','Omera large cylinders batch','2025-12-09 09:15:34','2025-12-09 09:15:34'),(31,4,1,'LOT-016',1490.00,100,100,'2025-12-13','2026-06-19','Petromax small batch','2025-12-09 09:15:34','2025-12-09 09:15:34'),(32,4,2,'LOT-017',2580.00,60,60,'2025-12-14','2026-06-21','Petromax medium batch','2025-12-09 09:15:34','2025-12-09 09:15:34'),(33,4,3,'LOT-018',3650.00,40,40,'2025-12-15','2026-06-25','Petromax large batch','2025-12-09 09:15:34','2025-12-09 09:15:34'),(34,5,1,'LOT-019',1505.00,90,90,'2025-12-16','2026-06-26','Pacific Gas small batch','2025-12-09 09:15:34','2025-12-09 09:15:34'),(35,5,2,'LOT-020',2605.00,50,50,'2025-12-17','2026-06-28','Pacific Gas medium batch','2025-12-09 09:15:34','2025-12-09 09:15:34'),(36,5,3,'LOT-021',3675.00,35,35,'2025-12-18','2026-06-30','Pacific Gas large batch','2025-12-09 09:15:34','2025-12-09 09:15:34'),(37,6,1,'LOT-022',1525.00,95,95,'2025-12-19','2026-07-01','Beximco small batch','2025-12-09 09:15:34','2025-12-09 09:15:34'),(38,6,2,'LOT-023',2620.00,55,55,'2025-12-20','2026-07-03','Beximco medium batch','2025-12-09 09:15:34','2025-12-09 09:15:34'),(39,6,3,'LOT-024',3700.00,38,38,'2025-12-21','2026-07-05','Beximco large batch','2025-12-09 09:15:34','2025-12-09 09:15:34');
/*!40000 ALTER TABLE `lots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2025_12_09_090000_create_purchases_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_items`
--

DROP TABLE IF EXISTS `purchase_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint unsigned NOT NULL,
  `lot_id` bigint unsigned NOT NULL,
  `cylinder_size_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_items`
--

LOCK TABLES `purchase_items` WRITE;
/*!40000 ALTER TABLE `purchase_items` DISABLE KEYS */;
INSERT INTO `purchase_items` VALUES (1,1,1,3,50,1500.00,NULL,NULL),(2,1,1,2,100,850.50,NULL,NULL),(3,2,2,1,200,450.00,NULL,NULL),(4,1,1,1,150,445.00,NULL,NULL),(5,1,2,3,50,1500.00,NULL,NULL),(6,2,3,2,100,850.50,NULL,NULL),(7,2,4,1,50,460.00,NULL,NULL),(8,3,5,3,20,1550.75,NULL,NULL),(9,4,6,2,80,890.00,NULL,NULL),(10,4,7,3,30,1545.00,NULL,NULL),(11,5,8,1,120,475.00,NULL,NULL),(12,6,9,2,90,880.50,NULL,NULL),(13,6,10,3,40,1560.00,NULL,NULL),(14,7,26,2,1,0.00,'2025-12-14 06:47:29','2025-12-14 06:47:29'),(15,8,23,2,1,0.00,'2025-12-14 06:49:16','2025-12-14 06:49:16'),(16,9,22,1,1,100.00,'2025-12-14 06:52:59','2025-12-14 06:52:59'),(17,9,8,1,1,500.00,'2025-12-14 06:52:59','2025-12-14 06:52:59'),(18,9,26,2,1,1000.00,'2025-12-14 06:52:59','2025-12-14 06:52:59'),(19,10,6,1,1,0.00,'2025-12-14 07:02:50','2025-12-14 07:02:50');
/*!40000 ALTER TABLE `purchase_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` bigint unsigned NOT NULL,
  `lot_id` int NOT NULL,
  `invoice_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date NOT NULL,
  `supplier_reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `purchases_supplier_id_foreign` (`supplier_id`),
  KEY `lot_id` (`lot_id`),
  CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (2,1,1,'P-INV-2025-001','2025-12-14','GAZMAX-1214A',450000.00,1,'2025-12-14 10:44:03'),(3,2,2,'P-INV-2025-002','2025-12-13','FFLPG-1213B',125000.50,2,'2025-12-14 10:44:03'),(4,3,1,'P-INV-2025-003','2025-12-14','PIPE-EQ-003',55000.75,1,'2025-12-14 10:44:03'),(5,4,3,'P-INV-2025-004','2025-12-12','ALPHA-1212C',280000.00,3,'2025-12-14 10:44:03'),(6,1,2,'P-INV-2025-005','2025-12-14','GAZMAX-1214B',90000.00,2,'2025-12-14 10:44:03'),(7,4,1,'INV-20251214124649','2025-12-14',NULL,0.00,NULL,'2025-12-14 12:47:29'),(8,1,1,'INV-20251214124909','2025-12-14',NULL,0.00,NULL,'2025-12-14 12:49:16'),(9,2,1,'INV-20251214125135','2025-12-14',NULL,1600.00,NULL,'2025-12-14 12:52:59'),(10,4,1,'INV-20251214130125','2025-12-31',NULL,0.00,NULL,'2025-12-14 13:02:50');
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_items`
--

DROP TABLE IF EXISTS `sale_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sale_id` int NOT NULL,
  `lot_id` int NOT NULL,
  `cylinder_size_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(14,2) NOT NULL,
  `subtotal` decimal(14,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `sale_id` (`sale_id`),
  KEY `lot_id` (`lot_id`),
  KEY `cylinder_size_id` (`cylinder_size_id`),
  CONSTRAINT `sale_items_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`),
  CONSTRAINT `sale_items_ibfk_2` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`),
  CONSTRAINT `sale_items_ibfk_3` FOREIGN KEY (`cylinder_size_id`) REFERENCES `cylinder_sizes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_items`
--

LOCK TABLES `sale_items` WRITE;
/*!40000 ALTER TABLE `sale_items` DISABLE KEYS */;
INSERT INTO `sale_items` VALUES (7,1,22,1,10,1550.00,15500.00,'2025-12-10 04:30:00'),(8,1,23,2,5,2600.00,13000.00,'2025-12-10 04:35:00'),(9,2,24,1,8,1500.00,12000.00,'2025-12-11 05:00:00'),(10,2,25,3,3,3550.00,10650.00,'2025-12-11 05:10:00'),(11,3,26,2,7,2450.00,17150.00,'2025-12-12 03:50:00'),(12,3,27,3,2,3600.00,7200.00,'2025-12-12 03:55:00'),(13,8,30,3,1,3620.00,3620.00,'2025-12-10 02:42:04'),(14,9,30,3,4,3620.00,14480.00,'2025-12-10 02:46:23'),(15,9,34,1,10,1505.00,15050.00,'2025-12-10 02:46:23'),(16,9,33,3,15,3650.00,54750.00,'2025-12-10 02:46:23'),(17,10,31,1,1,1490.00,1490.00,'2025-12-10 03:04:06'),(18,11,30,3,1,3620.00,3620.00,'2025-12-10 03:27:13'),(19,12,31,1,1,1490.00,1490.00,'2025-12-10 03:46:30'),(20,12,34,1,1,1505.00,1505.00,'2025-12-10 03:46:30'),(21,12,39,3,1,3700.00,3700.00,'2025-12-10 03:46:30');
/*!40000 ALTER TABLE `sale_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dealer_id` int NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `sale_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `total_amount` decimal(14,2) NOT NULL,
  `discount_amount` decimal(14,2) DEFAULT '0.00',
  `vat_amount` decimal(14,2) DEFAULT '0.00',
  `paid_amount` decimal(14,2) DEFAULT '0.00',
  `status` enum('draft','posted','paid','cancelled') DEFAULT 'draft',
  `created_by` int DEFAULT NULL,
  `remarks` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice_no` (`invoice_no`),
  KEY `dealer_id` (`dealer_id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`dealer_id`) REFERENCES `dealers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,1,'INV-20251201-001','2025-12-10 10:00:00',28500.00,0.00,0.00,28500.00,'posted',1,'First sale to Dealer 1','2025-12-10 04:00:00','2025-12-09 09:20:28'),(2,2,'INV-20251202-002','2025-12-11 11:00:00',23600.00,0.00,0.00,23600.00,'posted',2,'First sale to Dealer 2','2025-12-11 05:00:00','2025-12-09 09:20:28'),(3,3,'INV-20251203-003','2025-12-12 09:45:00',24350.00,0.00,0.00,24350.00,'posted',3,'First sale to Dealer 3','2025-12-12 03:45:00','2025-12-09 09:20:28'),(4,1,'INV-20251210080908','2025-12-10 00:00:00',0.00,0.00,0.00,0.00,'draft',1,NULL,'2025-12-10 02:09:27','2025-12-10 02:09:27'),(5,1,'INV-20251210081142','2025-12-10 00:00:00',0.00,0.00,0.00,0.00,'draft',1,NULL,'2025-12-10 02:11:54','2025-12-10 02:11:54'),(6,2,'INV-20251210083526','2025-12-10 00:00:00',4070.00,0.00,0.00,0.00,'draft',NULL,NULL,'2025-12-10 02:35:37','2025-12-10 02:35:37'),(7,1,'INV-20251210084128','2025-12-10 00:00:00',2580.00,0.00,0.00,0.00,'draft',NULL,NULL,'2025-12-10 02:41:36','2025-12-10 02:41:36'),(8,1,'INV-20251210084200','2025-12-10 00:00:00',3620.00,0.00,0.00,0.00,'draft',NULL,NULL,'2025-12-10 02:42:04','2025-12-10 02:42:04'),(9,4,'INV-20251210084558','2025-12-10 00:00:00',84280.00,0.00,0.00,0.00,'draft',NULL,NULL,'2025-12-10 02:46:23','2025-12-10 02:46:23'),(10,1,'INV-20251210090354','2025-12-10 00:00:00',1490.00,0.00,0.00,0.00,'draft',NULL,NULL,'2025-12-10 03:04:06','2025-12-10 03:04:06'),(11,3,'INV-20251210092702','2025-12-10 00:00:00',3620.00,0.00,0.00,0.00,'draft',NULL,NULL,'2025-12-10 03:27:13','2025-12-10 09:27:13'),(12,2,'INV-20251210094534','2025-12-11 00:00:00',6695.00,0.00,0.00,0.00,'draft',NULL,NULL,'2025-12-10 03:46:30','2025-12-10 09:46:30');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('IXx2KnQeifIajeJgHYLFHsOzejW8ztYp07mEA7lD',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYmt4ZXlZeENsYjZESE1Uc1dTSUdIUDNJOGJscENnZ0U4cTdKdExjZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9',1765949364);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` decimal(12,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'ABC Supplies','Mr. Rahman','01711111111','Dhaka',100000.00,NULL,NULL),(2,'Delta Traders','Ms. Sultana','01712222222','Chittagong',150000.00,NULL,NULL),(3,'Omega Store','Mr. Karim','01713333333','Khulna',200000.00,NULL,NULL),(4,'GazMax Energy Corp.','Mr. Anis Khan','01718123456','25/A, Gulshan Avenue, Dhaka',500000.00,NULL,NULL),(5,'FastFill LPG Station','Ms. Rina Akhter','01923765432','Highway Service Area, Savar',150000.00,NULL,NULL),(6,'Pipeline Equipment Ltd.','Eng. Hasan Ali','01689001122','3rd Floor, Mirpur DOHS, Dhaka',50000.00,NULL,NULL),(7,'Alpha Fuel Distributors','Mr. Karim Chowdhury','01844556677','Main Road, Chittagong Port Area',300000.00,NULL,NULL),(8,'City Gas Services','Mr. Jamil Ahmed','01512987654','Plot 10, Industrial Area, Tongi',75000.00,NULL,NULL);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','seller') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'seller',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ab','demo@localhost.com',NULL,'$2y$12$25CfriTf1L9bAK0dCuOdvetiTuW.aqOh8rH6krhBCSqMC.8aGxAS2','seller','0R2tKUWJw1KfacDoI2S2zWrbYgoIcnzIlMdHOzjcllKRqcAZYXG2kD9T02bC','2025-12-08 04:44:39','2025-12-08 04:44:39');
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

-- Dump completed on 2025-12-17 11:52:04
