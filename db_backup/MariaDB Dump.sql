/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.6.2-MariaDB, for Linux (x86_64)
--
-- Host: 192.168.50.3    Database: p9
-- ------------------------------------------------------
-- Server version	11.6.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fk_fk_type` (`parent`),
  CONSTRAINT `fk_fk_type` FOREIGN KEY (`parent`) REFERENCES `brand` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES
(1,'Apple',NULL),
(2,'Google',NULL),
(3,'Samsung',NULL),
(4,'Huawei',NULL),
(5,'Honor','Huawei'),
(6,'Xiaomi',NULL),
(7,'Redmi','Xiaomi'),
(8,'OnePlus',NULL),
(9,'Nokia',NULL),
(10,'Motorola',NULL),
(11,'Sony',NULL),
(12,'LG',NULL),
(13,'Philips',NULL),
(14,'Realtek',NULL),
(15,'Intel',NULL);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connectivity_chip`
--

DROP TABLE IF EXISTS `connectivity_chip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connectivity_chip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `connectivity_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fk_connectivity_chip_brand` (`brand`),
  KEY `fk_connectivity_chip_type` (`connectivity_type`),
  CONSTRAINT `fk_connectivity_chip_brand` FOREIGN KEY (`brand`) REFERENCES `brand` (`name`),
  CONSTRAINT `fk_connectivity_chip_type` FOREIGN KEY (`connectivity_type`) REFERENCES `connectivity_type` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connectivity_chip`
--

LOCK TABLES `connectivity_chip` WRITE;
/*!40000 ALTER TABLE `connectivity_chip` DISABLE KEYS */;
/*!40000 ALTER TABLE `connectivity_chip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connectivity_type`
--

DROP TABLE IF EXISTS `connectivity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connectivity_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alt_name` varchar(255) DEFAULT NULL,
  `parent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fk_connection_type_parent` (`parent`),
  CONSTRAINT `fk_connection_type_parent` FOREIGN KEY (`parent`) REFERENCES `connectivity_type` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connectivity_type`
--

LOCK TABLES `connectivity_type` WRITE;
/*!40000 ALTER TABLE `connectivity_type` DISABLE KEYS */;
INSERT INTO `connectivity_type` VALUES
(1,'WiFi','802.11',NULL),
(2,'Ethernet','802.3',NULL),
(3,'Bluetooth',NULL,NULL),
(4,'WiFi 1','802.11b','WiFi'),
(5,'WiFi 2','802.11a','WiFi'),
(6,'WiFi 3','802.11g','WiFi'),
(7,'WiFi 4','802.11n','WiFi'),
(8,'WiFi 5','802.11ac','WiFi'),
(9,'WiFi 6','802.11ax','WiFi'),
(10,'WiFi 6E','802.11ax','WiFi'),
(11,'WiFi 7','802.11be','WiFi'),
(12,'WiFi 8','802.11bn','WiFi');
/*!40000 ALTER TABLE `connectivity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connectivity_type_identifier`
--

DROP TABLE IF EXISTS `connectivity_type_identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connectivity_type_identifier` (
  `identifier` varchar(255) NOT NULL,
  `connectivity_type` varchar(255) NOT NULL,
  UNIQUE KEY `identifier` (`identifier`),
  KEY `connectivity_type` (`connectivity_type`),
  CONSTRAINT `connectivity_type_identifier_FK` FOREIGN KEY (`connectivity_type`) REFERENCES `connectivity_type` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connectivity_type_identifier`
--

LOCK TABLES `connectivity_type_identifier` WRITE;
/*!40000 ALTER TABLE `connectivity_type_identifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `connectivity_type_identifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57695 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES
(52394,NULL),
(57694,NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_device`
--

DROP TABLE IF EXISTS `customer_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `device_identifier` varchar(255) NOT NULL,
  `device_mac` varchar(50) DEFAULT NULL,
  `os_version` varchar(255) DEFAULT NULL,
  `platform_version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `customer_device_unique` (`device_mac`),
  KEY `fk_customer_device_customer` (`customer_id`),
  KEY `customer_device_device_identifier_FK` (`device_identifier`),
  CONSTRAINT `customer_device_device_identifier_FK` FOREIGN KEY (`device_identifier`) REFERENCES `device_identifier` (`identifier`),
  CONSTRAINT `fk_customer_device_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_device`
--

LOCK TABLES `customer_device` WRITE;
/*!40000 ALTER TABLE `customer_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `operating_system` varchar(255) DEFAULT NULL,
  `os_lowest` int(11) DEFAULT NULL,
  `os_highest` int(11) DEFAULT NULL,
  `first_seen` varchar(255) NOT NULL DEFAULT current_timestamp(),
  `cpu` varchar(255) DEFAULT NULL,
  `ram_size` int(11) DEFAULT NULL,
  `ram_speed` int(11) DEFAULT NULL,
  `storage` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `model` (`model`),
  KEY `fk_device_brand` (`brand`),
  KEY `fk_device_os` (`operating_system`),
  KEY `fk_device_os_high` (`os_highest`),
  KEY `fk_device_os_low` (`os_lowest`),
  KEY `fk_device_type` (`type`),
  CONSTRAINT `fk_device_brand` FOREIGN KEY (`brand`) REFERENCES `brand` (`name`),
  CONSTRAINT `fk_device_os` FOREIGN KEY (`operating_system`) REFERENCES `device_os` (`operating_system`),
  CONSTRAINT `fk_device_os_high` FOREIGN KEY (`os_highest`) REFERENCES `os_version` (`id`),
  CONSTRAINT `fk_device_os_low` FOREIGN KEY (`os_lowest`) REFERENCES `os_version` (`id`),
  CONSTRAINT `fk_device_type` FOREIGN KEY (`type`) REFERENCES `device_type` (`device_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES
(1,'Redmi','Redmi Note 13 Pro','Mobile','Xiaomi HyperOS',NULL,NULL,'2025-01-06 03:45:09',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_connectivity`
--

DROP TABLE IF EXISTS `device_connectivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_connectivity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device` varchar(255) NOT NULL,
  `connectivity_type` varchar(255) NOT NULL,
  `connectivity_chip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_device_connectivity` (`device`),
  KEY `fk_device_connectivity_chip` (`connectivity_chip`),
  KEY `fk_device_connectivity_type` (`connectivity_type`),
  CONSTRAINT `fk_device_connectivity` FOREIGN KEY (`device`) REFERENCES `device` (`model`),
  CONSTRAINT `fk_device_connectivity_chip` FOREIGN KEY (`connectivity_chip`) REFERENCES `connectivity_chip` (`name`),
  CONSTRAINT `fk_device_connectivity_type` FOREIGN KEY (`connectivity_type`) REFERENCES `connectivity_type` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_connectivity`
--

LOCK TABLES `device_connectivity` WRITE;
/*!40000 ALTER TABLE `device_connectivity` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_connectivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_identifier`
--

DROP TABLE IF EXISTS `device_identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_identifier` (
  `identifier` varchar(255) NOT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `id` (`identifier`),
  KEY `device_identifier_device_name_IDX` (`device_name`) USING BTREE,
  CONSTRAINT `device_identifier_device_FK` FOREIGN KEY (`device_name`) REFERENCES `device` (`model`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_identifier`
--

LOCK TABLES `device_identifier` WRITE;
/*!40000 ALTER TABLE `device_identifier` DISABLE KEYS */;
INSERT INTO `device_identifier` VALUES
('ASUS_I002D Build/SKQ1.210821.001',NULL),
('23090RA98G Build/UP1A.231005.007','Redmi Note 13 Pro');
/*!40000 ALTER TABLE `device_identifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_os`
--

DROP TABLE IF EXISTS `device_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_os` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operating_system` varchar(255) NOT NULL,
  `platform` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `operating_system` (`operating_system`),
  KEY `fk_device_os_platform` (`platform`),
  CONSTRAINT `fk_device_os_platform` FOREIGN KEY (`platform`) REFERENCES `device_platform` (`platform`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_os`
--

LOCK TABLES `device_os` WRITE;
/*!40000 ALTER TABLE `device_os` DISABLE KEYS */;
INSERT INTO `device_os` VALUES
(1,'Xiaomi HyperOS','Android');
/*!40000 ALTER TABLE `device_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_platform`
--

DROP TABLE IF EXISTS `device_platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `platform` (`platform`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_platform`
--

LOCK TABLES `device_platform` WRITE;
/*!40000 ALTER TABLE `device_platform` DISABLE KEYS */;
INSERT INTO `device_platform` VALUES
(1,'Android'),
(2,'GoogleTV'),
(3,'iOS');
/*!40000 ALTER TABLE `device_platform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_type`
--

DROP TABLE IF EXISTS `device_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `device_type` (`device_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_type`
--

LOCK TABLES `device_type` WRITE;
/*!40000 ALTER TABLE `device_type` DISABLE KEYS */;
INSERT INTO `device_type` VALUES
(1,'Mobile'),
(2,'Tablet');
/*!40000 ALTER TABLE `device_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error`
--

DROP TABLE IF EXISTS `error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `error_type` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fk_error_error_type` (`error_type`),
  CONSTRAINT `fk_error_error_type` FOREIGN KEY (`error_type`) REFERENCES `error_type` (`type`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error`
--

LOCK TABLES `error` WRITE;
/*!40000 ALTER TABLE `error` DISABLE KEYS */;
/*!40000 ALTER TABLE `error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_log`
--

DROP TABLE IF EXISTS `error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `error` varchar(255) NOT NULL,
  `log_id` int(11) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_error_log_error` (`error`),
  KEY `fk_session_error` (`session_id`),
  KEY `error_log_log_FK` (`log_id`),
  CONSTRAINT `error_log_log_FK` FOREIGN KEY (`log_id`) REFERENCES `log` (`id`),
  CONSTRAINT `fk_error_log_error` FOREIGN KEY (`error`) REFERENCES `error` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_session_error` FOREIGN KEY (`session_id`) REFERENCES `session` (`session_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_log`
--

LOCK TABLES `error_log` WRITE;
/*!40000 ALTER TABLE `error_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `error_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_uca1400_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`bamse`@`192.168.50.85`*/ /*!50003 TRIGGER new_error_trigger
BEFORE INSERT ON error_log
FOR EACH ROW
BEGIN
    -- Check if the parent row exists
    IF NOT EXISTS (
        SELECT 1
        FROM error
        WHERE name = NEW.error
    ) THEN
        -- Insert a new row into the parent table
        INSERT INTO error (name) VALUES (NEW.error);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `error_type`
--

DROP TABLE IF EXISTS `error_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_type`
--

LOCK TABLES `error_type` WRITE;
/*!40000 ALTER TABLE `error_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `error_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL,
  `active_stream` varchar(255) NOT NULL,
  `object_requested` varchar(255) DEFAULT NULL,
  `server_ip` varchar(100) NOT NULL,
  `current_stream_profile` int(11) DEFAULT NULL,
  `cpu_utilization` double DEFAULT NULL,
  `ram_utilization` double DEFAULT NULL,
  `datarate_local` double DEFAULT NULL,
  `datarate_wan` double DEFAULT NULL,
  `connection_type_identity` varchar(255) DEFAULT NULL,
  `signal_strength` decimal(10,0) DEFAULT NULL,
  `client_time` varchar(255) DEFAULT NULL,
  `server_time` varchar(255) NOT NULL DEFAULT current_timestamp(),
  `logged_errors` int(11) DEFAULT NULL,
  `cmcd_encoded_bitrate` int(11) DEFAULT NULL,
  `cmcd_buffer_length` int(11) DEFAULT NULL,
  `cmcd_buffer_starvation` tinyint(1) DEFAULT 0,
  `cmcd_content_id` varchar(255) DEFAULT NULL,
  `cmcd_object_duration` int(11) DEFAULT NULL,
  `cmcd_deadline` int(11) DEFAULT NULL,
  `cmcd_measured_throughput` int(11) DEFAULT NULL,
  `cmcd_next_object` varchar(255) DEFAULT NULL,
  `cmcd_next_range` varchar(255) DEFAULT NULL,
  `cmcd_object_type` varchar(255) DEFAULT NULL,
  `cmcd_playback_rate` decimal(10,0) DEFAULT NULL,
  `cmcd_requested_max_throughput` int(11) DEFAULT NULL,
  `cmcd_stream_format` varchar(255) DEFAULT NULL,
  `cmcd_session_id` varchar(255) DEFAULT NULL,
  `cmcd_stream_type` varchar(255) DEFAULT NULL,
  `cmcd_startup` tinyint(1) DEFAULT 0,
  `cmcd_top_bitrate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_log_session` (`session_id`),
  KEY `fk_log_connection_type` (`connection_type_identity`) USING BTREE,
  CONSTRAINT `FK_log_connectivity_type_identifier` FOREIGN KEY (`connection_type_identity`) REFERENCES `connectivity_type_identifier` (`identifier`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_log_session` FOREIGN KEY (`session_id`) REFERENCES `session` (`session_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES
(16,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_768x432_1500k/bbb_30fps_768x432_1500k_0.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:07:59:01 +0100',NULL,NULL,NULL,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',NULL,0,4300,NULL,NULL,'i',NULL,NULL,'d',NULL,'v',1,NULL),
(17,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_768x432_1500k/bbb_30fps_768x432_1500k_1.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:07:59:01 +0100',NULL,1884,0,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,0,4300,'..%2Fbbb_30fps_768x432_1500k_2.m4v','0-','v',NULL,NULL,'d',NULL,'v',1,4953),
(18,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_768x432_1500k/bbb_30fps_768x432_1500k_2.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:07:59:01 +0100',NULL,1884,4000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,4000,84500,'..%2Fbbb_30fps_768x432_1500k_3.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(19,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_768x432_1500k/bbb_30fps_768x432_1500k_3.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:07:59:01 +0100',NULL,1884,8000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,8000,193200,'..%2Fbbb_30fps_768x432_1500k_4.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(20,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_0.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:07:59:01 +0100',NULL,NULL,NULL,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',NULL,12000,193200,NULL,NULL,'i',NULL,NULL,'d',NULL,'v',0,NULL),
(21,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_4.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:07:59:01 +0100',NULL,4953,12000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,12000,193200,'..%2Fbbb_30fps_1280x720_4000k_5.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(22,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_5.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:07:59:01 +0100',NULL,4953,16000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,16000,373000,'..%2Fbbb_30fps_1280x720_4000k_6.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(23,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_6.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:07:59:01 +0100',NULL,4953,20000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,20000,480700,'..%2Fbbb_30fps_1280x720_4000k_7.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(24,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_7.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:07:59:01 +0100',NULL,4953,24000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,24000,524000,'..%2Fbbb_30fps_1280x720_4000k_8.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(25,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_8.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:07:59:01 +0100',NULL,4953,28000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,28000,615700,'..%2Fbbb_30fps_1280x720_4000k_9.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(26,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_9.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:07:59:01 +0100',NULL,4953,32000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,32000,649600,'..%2Fbbb_30fps_1280x720_4000k_10.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(27,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_10.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:07:59:01 +0100',NULL,4953,36000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,36000,664900,'..%2Fbbb_30fps_1280x720_4000k_11.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(28,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_11.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:07:59:01 +0100',NULL,4953,40000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,40000,700600,'..%2Fbbb_30fps_1280x720_4000k_12.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(29,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_12.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:07:59:02 +0100',NULL,4953,44000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,44000,686600,'..%2Fbbb_30fps_1280x720_4000k_13.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(30,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_13.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:07:59:02 +0100',NULL,4953,48000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,48000,731900,'..%2Fbbb_30fps_1280x720_4000k_14.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(31,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_14.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:07:59:51 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,685700,'..%2Fbbb_30fps_1280x720_4000k_15.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(32,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_15.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:07:59:55 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,367700,'..%2Fbbb_30fps_1280x720_4000k_16.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(33,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_16.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:07:59:59 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,357600,'..%2Fbbb_30fps_1280x720_4000k_17.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(34,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_17.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:00:03 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,308400,'..%2Fbbb_30fps_1280x720_4000k_18.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(35,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_18.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:00:07 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,345100,'..%2Fbbb_30fps_1280x720_4000k_19.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(36,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_19.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:00:11 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,399500,'..%2Fbbb_30fps_1280x720_4000k_20.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(37,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_20.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:00:15 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,284300,'..%2Fbbb_30fps_1280x720_4000k_21.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(38,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_21.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:00:19 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,369800,'..%2Fbbb_30fps_1280x720_4000k_22.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(39,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_22.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:00:23 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,375200,'..%2Fbbb_30fps_1280x720_4000k_23.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(40,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_23.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:00:27 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,293500,'..%2Fbbb_30fps_1280x720_4000k_24.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(41,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_24.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:00:31 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,337900,'..%2Fbbb_30fps_1280x720_4000k_25.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(42,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_25.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:00:35 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,293200,'..%2Fbbb_30fps_1280x720_4000k_26.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(43,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_26.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:00:39 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,297400,'..%2Fbbb_30fps_1280x720_4000k_27.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(44,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_27.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:00:43 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,294600,'..%2Fbbb_30fps_1280x720_4000k_28.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(45,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_28.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:00:47 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,298600,'..%2Fbbb_30fps_1280x720_4000k_29.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(46,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_29.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:00:51 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,266000,'..%2Fbbb_30fps_1280x720_4000k_30.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(47,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_30.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:00:55 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,335200,'..%2Fbbb_30fps_1280x720_4000k_31.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(48,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_31.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:00:59 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,249000,'..%2Fbbb_30fps_1280x720_4000k_32.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(49,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_32.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:01:03 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,347100,'..%2Fbbb_30fps_1280x720_4000k_33.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(50,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_33.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:01:07 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,299600,'..%2Fbbb_30fps_1280x720_4000k_34.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(51,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_34.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:01:11 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,292900,'..%2Fbbb_30fps_1280x720_4000k_35.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(52,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_35.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:01:15 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,363200,'..%2Fbbb_30fps_1280x720_4000k_36.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(53,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_36.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:01:19 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,352600,'..%2Fbbb_30fps_1280x720_4000k_37.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(54,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_37.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:01:23 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,352900,'..%2Fbbb_30fps_1280x720_4000k_38.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(55,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_38.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:01:27 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,308100,'..%2Fbbb_30fps_1280x720_4000k_39.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(56,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_39.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:01:31 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,331400,'..%2Fbbb_30fps_1280x720_4000k_40.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(57,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_40.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:01:35 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,240500,'..%2Fbbb_30fps_1280x720_4000k_41.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(58,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_41.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:01:39 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,317900,'..%2Fbbb_30fps_1280x720_4000k_42.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(59,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_42.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:01:43 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,231100,'..%2Fbbb_30fps_1280x720_4000k_43.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(60,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_43.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:01:47 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,317400,'..%2Fbbb_30fps_1280x720_4000k_44.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(61,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_44.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:01:51 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,234000,'..%2Fbbb_30fps_1280x720_4000k_45.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(62,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_45.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:01:55 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,233000,'..%2Fbbb_30fps_1280x720_4000k_46.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(63,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_46.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:01:59 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,228000,'..%2Fbbb_30fps_1280x720_4000k_47.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(64,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_47.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:02:03 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,326200,'..%2Fbbb_30fps_1280x720_4000k_48.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(65,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_48.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:02:07 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,287500,'..%2Fbbb_30fps_1280x720_4000k_49.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(66,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_49.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:02:11 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,249700,'..%2Fbbb_30fps_1280x720_4000k_50.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(67,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_50.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:02:15 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,232800,'..%2Fbbb_30fps_1280x720_4000k_51.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(68,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_51.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:02:19 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,368300,'..%2Fbbb_30fps_1280x720_4000k_52.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(69,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_52.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:02:23 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,247300,'..%2Fbbb_30fps_1280x720_4000k_53.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(70,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_53.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:02:27 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,223200,'..%2Fbbb_30fps_1280x720_4000k_54.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(71,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_54.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:02:31 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,253200,'..%2Fbbb_30fps_1280x720_4000k_55.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(72,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_55.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:02:35 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,251400,'..%2Fbbb_30fps_1280x720_4000k_56.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(73,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_56.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:02:39 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,196500,'..%2Fbbb_30fps_1280x720_4000k_57.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(74,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_57.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:02:43 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,258600,'..%2Fbbb_30fps_1280x720_4000k_58.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(75,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_58.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:02:47 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,321200,'..%2Fbbb_30fps_1280x720_4000k_59.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(76,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_59.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:02:51 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,229300,'..%2Fbbb_30fps_1280x720_4000k_60.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(77,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_60.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:02:55 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,329900,'..%2Fbbb_30fps_1280x720_4000k_61.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(78,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_61.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:02:59 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,344200,'..%2Fbbb_30fps_1280x720_4000k_62.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(79,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_62.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:03:03 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,246600,'..%2Fbbb_30fps_1280x720_4000k_63.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(80,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_63.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:03:07 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,381100,'..%2Fbbb_30fps_1280x720_4000k_64.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(81,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_64.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:03:11 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,315100,'..%2Fbbb_30fps_1280x720_4000k_65.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(82,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_65.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:03:15 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,256900,'..%2Fbbb_30fps_1280x720_4000k_66.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(83,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_66.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:03:19 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,281100,'..%2Fbbb_30fps_1280x720_4000k_67.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(84,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_67.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:03:23 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,299000,'..%2Fbbb_30fps_1280x720_4000k_68.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(85,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_68.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:03:27 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,261400,'..%2Fbbb_30fps_1280x720_4000k_69.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(86,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_69.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:03:31 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,271100,'..%2Fbbb_30fps_1280x720_4000k_70.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(87,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_70.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:03:35 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,290000,'..%2Fbbb_30fps_1280x720_4000k_71.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(88,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_71.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:03:39 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,199500,'..%2Fbbb_30fps_1280x720_4000k_72.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(89,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_72.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:03:43 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,310900,'..%2Fbbb_30fps_1280x720_4000k_73.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(90,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_73.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:03:47 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,271700,'..%2Fbbb_30fps_1280x720_4000k_74.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(91,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_74.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:03:51 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,277500,'..%2Fbbb_30fps_1280x720_4000k_75.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(92,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_75.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:03:55 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,228500,'..%2Fbbb_30fps_1280x720_4000k_76.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(93,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_76.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:03:59 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,304800,'..%2Fbbb_30fps_1280x720_4000k_77.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(94,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_77.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:04:03 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,204500,'..%2Fbbb_30fps_1280x720_4000k_78.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(95,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_78.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:04:07 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,285800,'..%2Fbbb_30fps_1280x720_4000k_79.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(96,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_79.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:04:11 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,262700,'..%2Fbbb_30fps_1280x720_4000k_80.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(97,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_80.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:04:15 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,301300,'..%2Fbbb_30fps_1280x720_4000k_81.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(98,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_81.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:04:19 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,359300,'..%2Fbbb_30fps_1280x720_4000k_82.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(99,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_82.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:04:23 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,284900,'..%2Fbbb_30fps_1280x720_4000k_83.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(100,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_83.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:04:27 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,255200,'..%2Fbbb_30fps_1280x720_4000k_84.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(101,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_84.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:04:31 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,248300,'..%2Fbbb_30fps_1280x720_4000k_85.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(102,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_85.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:04:35 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,265700,'..%2Fbbb_30fps_1280x720_4000k_86.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(103,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_86.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:04:39 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,269300,'..%2Fbbb_30fps_1280x720_4000k_87.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(104,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_87.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:04:43 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,248200,'..%2Fbbb_30fps_1280x720_4000k_88.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(105,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_88.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:04:47 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,303600,'..%2Fbbb_30fps_1280x720_4000k_89.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(106,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_89.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:04:51 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,424600,'..%2Fbbb_30fps_1280x720_4000k_90.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(107,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_90.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:04:55 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,301600,'..%2Fbbb_30fps_1280x720_4000k_91.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(108,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_91.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:04:59 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,367800,'..%2Fbbb_30fps_1280x720_4000k_92.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(109,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_92.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:05:03 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,243300,'..%2Fbbb_30fps_1280x720_4000k_93.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(110,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_93.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:05:07 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,290200,'..%2Fbbb_30fps_1280x720_4000k_94.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(111,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_94.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:05:11 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,371000,'..%2Fbbb_30fps_1280x720_4000k_95.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(112,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_95.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:05:15 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,316100,'..%2Fbbb_30fps_1280x720_4000k_96.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(113,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_96.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:05:19 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,233200,'..%2Fbbb_30fps_1280x720_4000k_97.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(114,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_97.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:05:23 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,264900,'..%2Fbbb_30fps_1280x720_4000k_98.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(115,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_98.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:05:27 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,355200,'..%2Fbbb_30fps_1280x720_4000k_99.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(116,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_99.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:05:31 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,341000,'..%2Fbbb_30fps_1280x720_4000k_100.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(117,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_100.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:05:35 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,387100,'..%2Fbbb_30fps_1280x720_4000k_101.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(118,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_101.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:05:39 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,348600,'..%2Fbbb_30fps_1280x720_4000k_102.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(119,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_102.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:05:43 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,304000,'..%2Fbbb_30fps_1280x720_4000k_103.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(120,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_103.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:05:47 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,264100,'..%2Fbbb_30fps_1280x720_4000k_104.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(121,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_104.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:05:51 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,248700,'..%2Fbbb_30fps_1280x720_4000k_105.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(122,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_105.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:05:55 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,274200,'..%2Fbbb_30fps_1280x720_4000k_106.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(123,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_106.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:05:59 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,422900,'..%2Fbbb_30fps_1280x720_4000k_107.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(124,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_107.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:06:03 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,421300,'..%2Fbbb_30fps_1280x720_4000k_108.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(125,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_108.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:06:07 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,270900,'..%2Fbbb_30fps_1280x720_4000k_109.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(126,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_109.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:06:11 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,387300,'..%2Fbbb_30fps_1280x720_4000k_110.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(127,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_110.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:06:15 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,310400,'..%2Fbbb_30fps_1280x720_4000k_111.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(128,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_111.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:06:19 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,354200,'..%2Fbbb_30fps_1280x720_4000k_112.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(129,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_112.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:06:23 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,355600,'..%2Fbbb_30fps_1280x720_4000k_113.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(130,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_113.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:06:27 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,364700,'..%2Fbbb_30fps_1280x720_4000k_114.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(131,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_114.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:06:31 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,324900,'..%2Fbbb_30fps_1280x720_4000k_115.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(132,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_115.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:06:35 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,363600,'..%2Fbbb_30fps_1280x720_4000k_116.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(133,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_116.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:06:39 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,374900,'..%2Fbbb_30fps_1280x720_4000k_117.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(134,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_117.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:06:43 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,380300,'..%2Fbbb_30fps_1280x720_4000k_118.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(135,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_118.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:06:47 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,352000,'..%2Fbbb_30fps_1280x720_4000k_119.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(136,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_119.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:06:51 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,317500,'..%2Fbbb_30fps_1280x720_4000k_120.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(137,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_120.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:06:55 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,217500,'..%2Fbbb_30fps_1280x720_4000k_121.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(138,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_121.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:06:59 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,244800,'..%2Fbbb_30fps_1280x720_4000k_122.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(139,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_122.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:07:03 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,290400,'..%2Fbbb_30fps_1280x720_4000k_123.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(140,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_123.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:07:07 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,240600,'..%2Fbbb_30fps_1280x720_4000k_124.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(141,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_124.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:07:11 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,195900,'..%2Fbbb_30fps_1280x720_4000k_125.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(142,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_125.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:07:15 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,350500,'..%2Fbbb_30fps_1280x720_4000k_126.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(143,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_126.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:07:19 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,255500,'..%2Fbbb_30fps_1280x720_4000k_127.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(144,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_127.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:07:23 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,267100,'..%2Fbbb_30fps_1280x720_4000k_128.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(145,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_128.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:07:27 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,275100,'..%2Fbbb_30fps_1280x720_4000k_129.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(146,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_129.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:07:31 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,243200,'..%2Fbbb_30fps_1280x720_4000k_130.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(147,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_130.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:07:35 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,235200,'..%2Fbbb_30fps_1280x720_4000k_131.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(148,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_131.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:07:39 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,278600,'..%2Fbbb_30fps_1280x720_4000k_132.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(149,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_132.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:07:43 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,222900,'..%2Fbbb_30fps_1280x720_4000k_133.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(150,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_133.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:07:47 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,301700,'..%2Fbbb_30fps_1280x720_4000k_134.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(151,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_134.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:07:51 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,317800,'..%2Fbbb_30fps_1280x720_4000k_135.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(152,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_135.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:07:55 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,279200,'..%2Fbbb_30fps_1280x720_4000k_136.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(153,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_136.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:07:59 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,341800,'..%2Fbbb_30fps_1280x720_4000k_137.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(154,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_137.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:08:03 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,309700,'..%2Fbbb_30fps_1280x720_4000k_138.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(155,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_138.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:08:07 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,321100,'..%2Fbbb_30fps_1280x720_4000k_139.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(156,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_139.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:08:11 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,341700,'..%2Fbbb_30fps_1280x720_4000k_140.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(157,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_140.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:08:15 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,290600,'..%2Fbbb_30fps_1280x720_4000k_141.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(158,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_141.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:08:19 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,277700,'..%2Fbbb_30fps_1280x720_4000k_142.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(159,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_142.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:08:23 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,330900,'..%2Fbbb_30fps_1280x720_4000k_143.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(160,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_143.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:08:27 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,234600,'..%2Fbbb_30fps_1280x720_4000k_144.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(161,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_144.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:08:31 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,268500,'..%2Fbbb_30fps_1280x720_4000k_145.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(162,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_145.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:08:35 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,216900,'..%2Fbbb_30fps_1280x720_4000k_146.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(163,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_146.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:08:39 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,255300,'..%2Fbbb_30fps_1280x720_4000k_147.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(164,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_147.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:08:43 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,323900,'..%2Fbbb_30fps_1280x720_4000k_148.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(165,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_148.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:08:47 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,234200,'..%2Fbbb_30fps_1280x720_4000k_149.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(166,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_149.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:08:51 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,240300,'..%2Fbbb_30fps_1280x720_4000k_150.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(167,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_150.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:08:55 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,266400,'..%2Fbbb_30fps_1280x720_4000k_151.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(168,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_151.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:08:59 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,236000,'..%2Fbbb_30fps_1280x720_4000k_152.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(169,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_152.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:03 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,222400,'..%2Fbbb_30fps_1280x720_4000k_153.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(170,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_153.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:07 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,246400,'..%2Fbbb_30fps_1280x720_4000k_154.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(171,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_154.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:11 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,183600,'..%2Fbbb_30fps_1280x720_4000k_155.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(172,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_155.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:15 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,183600,'..%2Fbbb_30fps_1280x720_4000k_156.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(173,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_156.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:19 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,219100,'..%2Fbbb_30fps_1280x720_4000k_157.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(174,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_157.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:23 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,379000,'..%2Fbbb_30fps_1280x720_4000k_158.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(175,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_158.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:27 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',4000,50000,245000,NULL,NULL,'v',NULL,NULL,'d',NULL,'v',0,4953),
(176,'43f5c979-5bac-410f-91dd-c114600e64a1','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_159.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:31 +0100',NULL,4953,50000,0,'bc624511-e180-4c9f-8ebd-03eafafcb564',2566,50000,323700,NULL,NULL,'v',NULL,NULL,'d',NULL,'v',0,4953),
(177,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_768x432_1500k/bbb_30fps_768x432_1500k_0.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:40 +0100',NULL,NULL,NULL,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',NULL,0,4300,NULL,NULL,'i',NULL,NULL,'d',NULL,'v',1,NULL),
(178,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_768x432_1500k/bbb_30fps_768x432_1500k_1.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:40 +0100',NULL,1884,0,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,0,4300,'..%2Fbbb_30fps_768x432_1500k_2.m4v','0-','v',NULL,NULL,'d',NULL,'v',1,4953),
(179,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_768x432_1500k/bbb_30fps_768x432_1500k_2.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:40 +0100',NULL,1884,4000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,4000,145700,'..%2Fbbb_30fps_768x432_1500k_3.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(180,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_768x432_1500k/bbb_30fps_768x432_1500k_3.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:40 +0100',NULL,1884,8000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,8000,136400,'..%2Fbbb_30fps_768x432_1500k_4.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(181,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_0.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:40 +0100',NULL,NULL,NULL,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',NULL,12000,145700,NULL,NULL,'i',NULL,NULL,'d',NULL,'v',0,NULL),
(182,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_4.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:40 +0100',NULL,4953,12000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,12000,145700,'..%2Fbbb_30fps_1280x720_4000k_5.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(183,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_5.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:41 +0100',NULL,4953,16000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,16000,244800,'..%2Fbbb_30fps_1280x720_4000k_6.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(184,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_6.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:41 +0100',NULL,4953,20000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,20000,302600,'..%2Fbbb_30fps_1280x720_4000k_7.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(185,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_7.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:41 +0100',NULL,4953,24000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,24000,393000,'..%2Fbbb_30fps_1280x720_4000k_8.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(186,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_8.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:41 +0100',NULL,4953,28000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,28000,446400,'..%2Fbbb_30fps_1280x720_4000k_9.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(187,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_9.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:41 +0100',NULL,4953,32000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,32000,544800,'..%2Fbbb_30fps_1280x720_4000k_10.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(188,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_10.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:41 +0100',NULL,4953,36000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,36000,569900,'..%2Fbbb_30fps_1280x720_4000k_11.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(189,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_11.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:41 +0100',NULL,4953,40000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,40000,413200,'..%2Fbbb_30fps_1280x720_4000k_12.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(190,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_12.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:41 +0100',NULL,4953,44000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,44000,465900,'..%2Fbbb_30fps_1280x720_4000k_13.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(191,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_13.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:41 +0100',NULL,4953,48000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,48000,555200,'..%2Fbbb_30fps_1280x720_4000k_14.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(192,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_14.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:46 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,606600,'..%2Fbbb_30fps_1280x720_4000k_15.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(193,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_15.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:50 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,234400,'..%2Fbbb_30fps_1280x720_4000k_16.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(194,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_16.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:54 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,209000,'..%2Fbbb_30fps_1280x720_4000k_17.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(195,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_17.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:09:58 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,156100,'..%2Fbbb_30fps_1280x720_4000k_18.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(196,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_18.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:10:02 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,197800,'..%2Fbbb_30fps_1280x720_4000k_19.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(197,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_19.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:10:06 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,188000,'..%2Fbbb_30fps_1280x720_4000k_20.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(198,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_20.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:10:10 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,135400,'..%2Fbbb_30fps_1280x720_4000k_21.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(199,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_21.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:10:14 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,175600,'..%2Fbbb_30fps_1280x720_4000k_22.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(200,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_22.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:10:18 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,241200,'..%2Fbbb_30fps_1280x720_4000k_23.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(201,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_23.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:10:22 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,157000,'..%2Fbbb_30fps_1280x720_4000k_24.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(202,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_24.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:10:26 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,173100,'..%2Fbbb_30fps_1280x720_4000k_25.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(203,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_25.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:10:30 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,219900,'..%2Fbbb_30fps_1280x720_4000k_26.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(204,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_26.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:10:34 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,221800,'..%2Fbbb_30fps_1280x720_4000k_27.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(205,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_27.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:10:38 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,156300,'..%2Fbbb_30fps_1280x720_4000k_28.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(206,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_28.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:10:42 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,214300,'..%2Fbbb_30fps_1280x720_4000k_29.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(207,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_29.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:10:46 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,221000,'..%2Fbbb_30fps_1280x720_4000k_30.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(208,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_30.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:10:50 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,154200,'..%2Fbbb_30fps_1280x720_4000k_31.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(209,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_31.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:10:54 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,225800,'..%2Fbbb_30fps_1280x720_4000k_32.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(210,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_32.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:10:58 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,260300,'..%2Fbbb_30fps_1280x720_4000k_33.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(211,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_33.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:11:02 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,164300,'..%2Fbbb_30fps_1280x720_4000k_34.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(212,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_34.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:11:06 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,152700,'..%2Fbbb_30fps_1280x720_4000k_35.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(213,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_35.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:11:10 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,339500,'..%2Fbbb_30fps_1280x720_4000k_36.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(214,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_36.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:11:14 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,180000,'..%2Fbbb_30fps_1280x720_4000k_37.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(215,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_37.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:11:18 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,180200,'..%2Fbbb_30fps_1280x720_4000k_38.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(216,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_38.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:11:22 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,206700,'..%2Fbbb_30fps_1280x720_4000k_39.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(217,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_39.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:11:26 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,169600,'..%2Fbbb_30fps_1280x720_4000k_40.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(218,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_40.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:11:30 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,192400,'..%2Fbbb_30fps_1280x720_4000k_41.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(219,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_41.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:11:34 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,307200,'..%2Fbbb_30fps_1280x720_4000k_42.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(220,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_42.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:11:38 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,159600,'..%2Fbbb_30fps_1280x720_4000k_43.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(221,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_43.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:11:42 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,212800,'..%2Fbbb_30fps_1280x720_4000k_44.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(222,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_44.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:11:46 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,184700,'..%2Fbbb_30fps_1280x720_4000k_45.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(223,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_45.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:11:50 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,167500,'..%2Fbbb_30fps_1280x720_4000k_46.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(224,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_46.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:11:54 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,180400,'..%2Fbbb_30fps_1280x720_4000k_47.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(225,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_47.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:11:58 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,177600,'..%2Fbbb_30fps_1280x720_4000k_48.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(226,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_48.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:12:02 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,222400,'..%2Fbbb_30fps_1280x720_4000k_49.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(227,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_49.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:12:06 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,169000,'..%2Fbbb_30fps_1280x720_4000k_50.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(228,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_50.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:12:10 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,171300,'..%2Fbbb_30fps_1280x720_4000k_51.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(229,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_51.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:12:14 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,177300,'..%2Fbbb_30fps_1280x720_4000k_52.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(230,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_52.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:12:18 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,169000,'..%2Fbbb_30fps_1280x720_4000k_53.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(231,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_53.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:12:22 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,165100,'..%2Fbbb_30fps_1280x720_4000k_54.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(232,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_54.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:12:26 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,193300,'..%2Fbbb_30fps_1280x720_4000k_55.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(233,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_55.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:12:30 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,182600,'..%2Fbbb_30fps_1280x720_4000k_56.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(234,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_56.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:12:34 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,222700,'..%2Fbbb_30fps_1280x720_4000k_57.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(235,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_57.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:12:38 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,168600,'..%2Fbbb_30fps_1280x720_4000k_58.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(236,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_58.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:12:42 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,95900,'..%2Fbbb_30fps_1280x720_4000k_59.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(237,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_59.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:12:46 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,193000,'..%2Fbbb_30fps_1280x720_4000k_60.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(238,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_60.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:12:50 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,171500,'..%2Fbbb_30fps_1280x720_4000k_61.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(239,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_61.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:12:54 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,214000,'..%2Fbbb_30fps_1280x720_4000k_62.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(240,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_62.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:12:58 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,199800,'..%2Fbbb_30fps_1280x720_4000k_63.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(241,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_63.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:13:02 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,179900,'..%2Fbbb_30fps_1280x720_4000k_64.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(242,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_64.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:13:06 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,198400,'..%2Fbbb_30fps_1280x720_4000k_65.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(243,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_65.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:13:10 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,182500,'..%2Fbbb_30fps_1280x720_4000k_66.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(244,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_66.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:13:14 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,173700,'..%2Fbbb_30fps_1280x720_4000k_67.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(245,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_67.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:13:18 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,182400,'..%2Fbbb_30fps_1280x720_4000k_68.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(246,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_68.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:13:22 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,153000,'..%2Fbbb_30fps_1280x720_4000k_69.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(247,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_69.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:13:26 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,182900,'..%2Fbbb_30fps_1280x720_4000k_70.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(248,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_70.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:13:30 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,185600,'..%2Fbbb_30fps_1280x720_4000k_71.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(249,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_71.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:13:34 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,185100,'..%2Fbbb_30fps_1280x720_4000k_72.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(250,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_72.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:13:38 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,178200,'..%2Fbbb_30fps_1280x720_4000k_73.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(251,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_73.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:13:42 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,160100,'..%2Fbbb_30fps_1280x720_4000k_74.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(252,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_74.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:13:46 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,181400,'..%2Fbbb_30fps_1280x720_4000k_75.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(253,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_75.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:13:50 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,164600,'..%2Fbbb_30fps_1280x720_4000k_76.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(254,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_76.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:13:54 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,202200,'..%2Fbbb_30fps_1280x720_4000k_77.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(255,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_77.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:13:58 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,196300,'..%2Fbbb_30fps_1280x720_4000k_78.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(256,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_78.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:14:02 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,198700,'..%2Fbbb_30fps_1280x720_4000k_79.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(257,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_79.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:14:06 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,217500,'..%2Fbbb_30fps_1280x720_4000k_80.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(258,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_80.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:14:10 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,163000,'..%2Fbbb_30fps_1280x720_4000k_81.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(259,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_81.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:14:14 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,257300,'..%2Fbbb_30fps_1280x720_4000k_82.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(260,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_82.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:14:18 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,202400,'..%2Fbbb_30fps_1280x720_4000k_83.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(261,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_83.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:14:22 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,202600,'..%2Fbbb_30fps_1280x720_4000k_84.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(262,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_84.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:14:26 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,198000,'..%2Fbbb_30fps_1280x720_4000k_85.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(263,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_85.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:14:30 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,235300,'..%2Fbbb_30fps_1280x720_4000k_86.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(264,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_86.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:14:34 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,242900,'..%2Fbbb_30fps_1280x720_4000k_87.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(265,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_87.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:14:38 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,134200,'..%2Fbbb_30fps_1280x720_4000k_88.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953),
(266,'76349556-332a-4b7b-aaee-c070054c34aa','/dash/bbb_30fps_akamai','/dash/bbb_30fps_akamai/bbb_30fps_1280x720_4000k/bbb_30fps_1280x720_4000k_88.m4v','192.168.50.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'05/Jan/2025:08:14:42 +0100',NULL,4953,50000,0,'eca60675-3eea-4e7f-bd91-32b3baeb9297',4000,50000,197000,'..%2Fbbb_30fps_1280x720_4000k_89.m4v','0-','v',NULL,NULL,'d',NULL,'v',0,4953);
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_uca1400_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`bamse`@`192.168.50.85`*/ /*!50003 TRIGGER new_log_trigger
BEFORE INSERT ON log
FOR EACH ROW
BEGIN
	-- Only process if NEW.customer_device_mac is NOT NULL
	IF NEW.connection_type_identity IS NOT NULL THEN
		-- Check if the parent row exists
		IF NOT EXISTS (
			SELECT 1
			FROM connectivity_type_identifier
			WHERE device_mac = NEW.connection_type_identity
		) THEN
		-- Insert a new row into the parent table if it doesn't exist
			INSERT INTO connectivity_type_identifier (identifier) VALUES (NEW.connection_type_identity);
		END IF;
	END IF;
	INSERT INTO session (last_active) VALUES (NEW.server_time);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `os_version`
--

DROP TABLE IF EXISTS `os_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `os_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `version_number_IDX` (`number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_version`
--

LOCK TABLES `os_version` WRITE;
/*!40000 ALTER TABLE `os_version` DISABLE KEYS */;
INSERT INTO `os_version` VALUES
(1,'Android 12',NULL),
(2,'Android 14',NULL);
/*!40000 ALTER TABLE `os_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_device_mac` varchar(50) DEFAULT NULL,
  `device_identity` varchar(255) NOT NULL,
  `os_version` varchar(255) DEFAULT NULL,
  `start_time` varchar(255) NOT NULL DEFAULT current_timestamp(),
  `last_active` varchar(255) NOT NULL DEFAULT 'current_timestamp()',
  `client_ip` varchar(255) DEFAULT NULL,
  `client_application` varchar(255) DEFAULT NULL,
  `application_version` varchar(255) DEFAULT NULL,
  `cmcd_version` int(11) DEFAULT 1,
  `http_user_agent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `session_id` (`session_id`),
  KEY `session_os_version_IDX` (`os_version`,`application_version`) USING BTREE,
  KEY `session_application_version_IDX` (`application_version`) USING BTREE,
  KEY `fk_session_customer` (`customer_id`),
  KEY `session_device_identifier_FK` (`device_identity`),
  KEY `customer_device_mac` (`customer_device_mac`),
  CONSTRAINT `session_customer_FK` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `session_customer_device_FK` FOREIGN KEY (`customer_device_mac`) REFERENCES `customer_device` (`device_mac`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `session_device_identifier_FK` FOREIGN KEY (`device_identity`) REFERENCES `device_identifier` (`identifier`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `session_os_version_FK` FOREIGN KEY (`os_version`) REFERENCES `os_version` (`number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES
(1,'43f5c979-5bac-410f-91dd-c114600e64a1',52394,NULL,'ASUS_I002D Build/SKQ1.210821.001','Android 12','2025-01-05 07:59:01','05/Jan/2025:08:14:42 +0100','192.168.50.70','Dalvik/2.1.0 ',NULL,1,'Dalvik/2.1.0 (Linux; U; Android 12; ASUS_I002D Build/SKQ1.210821.001)'),
(2,'76349556-332a-4b7b-aaee-c070054c34aa',57694,NULL,'23090RA98G Build/UP1A.231005.007','Android 14','2025-01-05 08:09:40','05/Jan/2025:08:14:42 +0100','192.168.50.93','Dalvik/2.1.0 ',NULL,1,'Dalvik/2.1.0 (Linux; U; Android 14; 23090RA98G Build/UP1A.231005.007)');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_uca1400_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`bamse`@`192.168.50.85`*/ /*!50003 TRIGGER `new_session_data_trigger` BEFORE INSERT ON `session` FOR EACH ROW BEGIN
    -- Check if the parent row exists
    IF NOT EXISTS (
        SELECT 1
        FROM device_identifier
        WHERE identifier = NEW.device_identity
    ) THEN
        -- Insert a new row into the parent table
        INSERT INTO device_identifier (identifier) VALUES (NEW.device_identity);
    END IF;
    -- Only process if NEW.os_version is NOT NULL
    IF NEW.os_version IS NOT NULL THEN
        -- Check if the parent row exists
        IF NOT EXISTS (
            SELECT 1
            FROM os_version
            WHERE number = NEW.os_version
        ) THEN
            -- Insert a new row into the parent table if it doesn't exist
            INSERT INTO os_version (number) VALUES (NEW.os_version);
        END IF;
    END IF;
        -- Only process if NEW.customer_id is NOT NULL
    IF NEW.customer_id IS NOT NULL THEN
        -- Check if the parent row exists
        IF NOT EXISTS (
            SELECT 1
            FROM customer
            WHERE id = NEW.customer_id
        ) THEN
            -- Insert a new row into the parent table if it doesn't exist
            INSERT INTO customer (id) VALUES (NEW.customer_id);
        END IF;
    END IF;
            -- Only process if NEW.customer_device_mac is NOT NULL
    IF NEW.customer_device_mac IS NOT NULL THEN
        -- Check if the parent row exists
        IF NOT EXISTS (
            SELECT 1
            FROM customer_device
            WHERE device_mac = NEW.customer_device_mac
        ) THEN
            -- Insert a new row into the parent table if it doesn't exist
            INSERT INTO customer_device (device_mac) VALUES (NEW.customer_device_mac);
        END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'p9'
--

--
-- Dumping routines for database 'p9'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `remove_trash` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_uca1400_ai_ci */ ;
DELIMITER ;;
CREATE DEFINER=`bamse`@`192.168.50.85` PROCEDURE `remove_trash`()
BEGIN
	-- Disable foreign key checks temporarily
	SET FOREIGN_KEY_CHECKS = 0;
	
	-- Delete data from all tables
	DELETE FROM log;
	ALTER TABLE log AUTO_INCREMENT = 1;
	
	DELETE FROM device_identifier;
	ALTER TABLE device_identifier AUTO_INCREMENT = 1;
	
	DELETE FROM os_version;
	ALTER TABLE os_version AUTO_INCREMENT = 1;
	
	DELETE FROM error_log;
	ALTER TABLE error_log AUTO_INCREMENT = 1;
	
	DELETE FROM error;
	ALTER TABLE error AUTO_INCREMENT = 1;
	
	DELETE FROM session;
	ALTER TABLE session AUTO_INCREMENT = 1;
    
	DELETE FROM customer;
	ALTER TABLE customer AUTO_INCREMENT = 1;
	
	-- Re-enable foreign key checks
	SET FOREIGN_KEY_CHECKS = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-01-07 14:31:33
