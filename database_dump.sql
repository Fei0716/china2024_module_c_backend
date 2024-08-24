-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 192.168.10.2    Database: china2024_module_c
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'admin','$2y$12$t5B1jZ6NcZMyiZilFTEc6O0dyS0U3FEn16OSzUCl/O4kJBh3KsMZS','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','2024-08-24 07:22:56','2024-08-24 14:07:10'),(2,'ntw_001','$2y$12$pAaBCSvf8Xcr.nIVzhYntOd4sZ.17CPMzSE35ERBdoFt752pq61Pa',NULL,'2024-08-24 07:22:56','2024-08-24 07:22:56'),(3,'ntw_002','$2y$12$kxe/IZPLkAVIBBtzQfQBhujAT9a3H8w.7wuz4PY5nSDeIZ8vF4Ybm',NULL,'2024-08-24 07:22:56','2024-08-24 07:22:56'),(4,'ntw_003','$2y$12$LBsbBO/48OZCRdfjKgipoeHPW1AFH/hpC666Rc9sXOKLR1ZubfrWK',NULL,'2024-08-24 07:22:56','2024-08-24 07:22:56');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `knowledge_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `images_knowledge_id_foreign` (`knowledge_id`),
  CONSTRAINT `images_knowledge_id_foreign` FOREIGN KEY (`knowledge_id`) REFERENCES `knowledges` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'storage/images/66c999436545a1.63386491_2024-08-24 08:26:43.webp','2024-08-24 07:26:43','2024-08-24 07:26:43',1),(2,'storage/images/66c99e3d1fda06.57327766_2024-08-24 08:47:57.webp','2024-08-24 07:47:57','2024-08-24 07:47:57',4),(3,'storage/images/66c99eeabcd228.54366853_2024-08-24 08:50:50.webp','2024-08-24 07:50:50','2024-08-24 07:50:50',5),(4,'storage/images/66c9bab5b68c30.48885882_2024-08-24 10:49:25.png','2024-08-24 09:49:25','2024-08-24 09:49:25',6),(5,'storage/images/66c9bab5b894c8.55619429_2024-08-24 10:49:25.webp','2024-08-24 09:49:25','2024-08-24 09:49:25',6),(6,'storage/images/66c9bae336a4d2.48924095_2024-08-24 10:50:11.png','2024-08-24 09:50:11','2024-08-24 09:50:11',7),(7,'storage/images/66c9baf6a73a39.66511799_2024-08-24 10:50:30.png','2024-08-24 09:50:30','2024-08-24 09:50:30',8),(8,'storage/images/66c9bb56a1ee05.96681271_2024-08-24 10:52:06.png','2024-08-24 09:52:06','2024-08-24 09:52:06',9),(9,'storage/images/66c9bb7cd384b3.29937861_2024-08-24 10:52:44.webp','2024-08-24 09:52:44','2024-08-24 09:52:44',10),(10,'storage/images/66c9bd1578bdf9.62419615_2024-08-24 10:59:33.png','2024-08-24 09:59:33','2024-08-24 09:59:33',11);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knowledge_tags`
--

DROP TABLE IF EXISTS `knowledge_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knowledge_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `knowledge_id` bigint(20) unsigned NOT NULL,
  `tag_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `knowledge_tags_knowledge_id_foreign` (`knowledge_id`),
  KEY `knowledge_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `knowledge_tags_knowledge_id_foreign` FOREIGN KEY (`knowledge_id`) REFERENCES `knowledges` (`id`),
  CONSTRAINT `knowledge_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knowledge_tags`
--

LOCK TABLES `knowledge_tags` WRITE;
/*!40000 ALTER TABLE `knowledge_tags` DISABLE KEYS */;
INSERT INTO `knowledge_tags` VALUES (1,1,1,'2024-08-24 07:26:43','2024-08-24 07:26:43'),(2,4,2,'2024-08-24 07:47:57','2024-08-24 07:47:57'),(3,4,1,'2024-08-24 07:47:57','2024-08-24 07:47:57'),(5,5,2,'2024-08-24 07:50:50','2024-08-24 07:50:50'),(7,6,2,'2024-08-24 09:49:25','2024-08-24 09:49:25'),(8,6,1,'2024-08-24 09:49:25','2024-08-24 09:49:25'),(10,7,2,'2024-08-24 09:50:11','2024-08-24 09:50:11'),(11,7,1,'2024-08-24 09:50:11','2024-08-24 09:50:11'),(13,8,1,'2024-08-24 09:50:30','2024-08-24 09:50:30'),(14,8,2,'2024-08-24 09:50:30','2024-08-24 09:50:30'),(16,9,2,'2024-08-24 09:52:06','2024-08-24 09:52:06'),(18,10,2,'2024-08-24 09:52:44','2024-08-24 09:52:44'),(20,11,2,'2024-08-24 09:59:33','2024-08-24 09:59:33'),(21,12,14,'2024-08-24 14:21:13','2024-08-24 14:21:13'),(22,12,1,'2024-08-24 14:21:13','2024-08-24 14:21:13'),(23,12,2,'2024-08-24 14:21:13','2024-08-24 14:21:13'),(25,13,15,'2024-08-24 14:21:20','2024-08-24 14:21:20'),(26,13,1,'2024-08-24 14:21:20','2024-08-24 14:21:20'),(27,13,2,'2024-08-24 14:21:20','2024-08-24 14:21:20'),(29,14,16,'2024-08-24 14:21:31','2024-08-24 14:21:31'),(30,15,17,'2024-08-24 14:21:46','2024-08-24 14:21:46'),(31,15,1,'2024-08-24 14:21:46','2024-08-24 14:21:46'),(32,15,2,'2024-08-24 14:21:46','2024-08-24 14:21:46'),(34,16,18,'2024-08-24 14:21:51','2024-08-24 14:21:51');
/*!40000 ALTER TABLE `knowledge_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knowledges`
--

DROP TABLE IF EXISTS `knowledges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knowledges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `excerpt` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `author_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `knowledges_author_id_foreign` (`author_id`),
  CONSTRAINT `knowledges_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `admins` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knowledges`
--

LOCK TABLES `knowledges` WRITE;
/*!40000 ALTER TABLE `knowledges` DISABLE KEYS */;
INSERT INTO `knowledges` VALUES (1,'new knowledge 1','excerpt 1','asd','2024-07-31 23:00:00','2024-08-24 07:26:43',NULL,1),(4,'New Knowledge 1','excerpt 1','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam animi aspernatur commodi corporis culpa cum delectus deleniti dolorum ea, ex laudantium maiores odio odit perspiciatis porro quaerat quisquam sequi veritatis?            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam animi aspernatur commodi corporis culpa cum delectus deleniti dolorum ea, ex laudantium maiores odio odit perspiciatis porro quaerat quisquam sequi veritatis?','2024-07-24 23:00:00','2024-08-24 07:47:57',NULL,1),(5,'Dummy','excerpt 1','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam animi aspernatur commodi corporis culpa cum delectus deleniti dolorum ea, ex laudantium maiores odio odit perspiciatis porro quaerat quisquam sequi veritatis?','2024-07-16 23:00:00','2024-08-24 07:50:54','2024-08-24 07:50:54',1),(6,'Bombaclat','as','asdas','2024-08-21 23:00:00','2024-08-24 09:49:25',NULL,1),(7,'sdasdasdasd','as','asd','2024-08-12 23:00:00','2024-08-24 09:50:11',NULL,1),(8,'asd','asd','asd','2024-06-19 23:00:00','2024-08-24 09:50:30',NULL,1),(9,'123123','123','123','2024-08-20 23:00:00','2024-08-24 09:52:06',NULL,1),(10,'asd','asd','asd','2024-07-24 23:00:00','2024-08-24 09:52:44',NULL,1),(11,'asd','asd','asd','2024-08-07 23:00:00','2024-08-24 09:59:33',NULL,1),(12,'New Title 1','excerpt 1','content 1','2024-07-31 23:00:00','2024-08-24 14:21:13',NULL,1),(13,'New Title 1','excerpt 1','content 1','2024-07-31 23:00:00','2024-08-24 14:21:20',NULL,1),(14,'New Title 1','excerpt 1','content 1','2024-07-31 23:00:00','2024-08-24 14:21:31',NULL,1),(15,'New Title 1','excerpt 1','content 1','2024-07-31 23:00:00','2024-08-24 14:21:46',NULL,1),(16,'New Title 1','excerpt 1','content 1','2024-07-31 23:00:00','2024-08-24 14:22:39','2024-08-24 14:22:39',1);
/*!40000 ALTER TABLE `knowledges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2019_12_14_000001_create_personal_access_tokens_table',1),(2,'2024_08_23_124506_create_admins_table',1),(3,'2024_08_23_124511_create_knowledge_table',1),(4,'2024_08_23_124534_create_images_table',1),(5,'2024_08_23_124539_create_tags_table',1),(6,'2024_08_23_124555_create_knowledge_tags_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'new tag 1','2024-08-24 07:26:43','2024-08-24 07:26:43'),(2,'new tag 2','2024-08-24 07:47:57','2024-08-24 07:47:57'),(9,'asd','2024-08-24 09:58:05','2024-08-24 09:58:05'),(13,'New Tag 1','2024-08-24 14:09:52','2024-08-24 14:09:52'),(14,'new tag 66','2024-08-24 14:21:13','2024-08-24 14:21:13'),(15,'new tag 66','2024-08-24 14:21:20','2024-08-24 14:21:20'),(16,'new tag 66','2024-08-24 14:21:31','2024-08-24 14:21:31'),(17,'new tag 66','2024-08-24 14:21:46','2024-08-24 14:21:46'),(18,'new tag 66','2024-08-24 14:21:51','2024-08-24 14:21:51');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-24 23:26:48
