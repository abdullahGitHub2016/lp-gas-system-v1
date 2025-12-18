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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2025_12_09_090000_create_purchases_table',1),(3,'2025_12_17_055902_create_cache_table',0),(4,'2025_12_17_055902_create_cache_locks_table',0),(5,'2025_12_17_055902_create_companies_table',0),(6,'2025_12_17_055902_create_cylinder_sizes_table',0),(7,'2025_12_17_055902_create_dealers_table',0),(8,'2025_12_17_055902_create_failed_jobs_table',0),(9,'2025_12_17_055902_create_job_batches_table',0),(10,'2025_12_17_055902_create_jobs_table',0),(11,'2025_12_17_055902_create_lot_price_history_table',0),(12,'2025_12_17_055902_create_lots_table',0),(13,'2025_12_17_055902_create_password_reset_tokens_table',0),(14,'2025_12_17_055902_create_purchase_items_table',0),(15,'2025_12_17_055902_create_purchases_table',0),(16,'2025_12_17_055902_create_sale_items_table',0),(17,'2025_12_17_055902_create_sales_table',0),(18,'2025_12_17_055902_create_sessions_table',0),(19,'2025_12_17_055902_create_suppliers_table',0),(20,'2025_12_17_055902_create_users_table',0),(21,'2025_12_17_055905_add_foreign_keys_to_lot_price_history_table',0),(22,'2025_12_17_055905_add_foreign_keys_to_lots_table',0),(23,'2025_12_17_055905_add_foreign_keys_to_purchases_table',0),(24,'2025_12_17_055905_add_foreign_keys_to_sale_items_table',0),(25,'2025_12_17_055905_add_foreign_keys_to_sales_table',0);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-17 12:10:05
