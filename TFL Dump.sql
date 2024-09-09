-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: tfl
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `journeys`
--

DROP TABLE IF EXISTS `journeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journeys` (
  `journey_id` int NOT NULL AUTO_INCREMENT,
  `station_id` int DEFAULT NULL,
  `destination_station_id` int DEFAULT NULL,
  `journey_time` time DEFAULT NULL,
  `fare` float DEFAULT NULL,
  `journey_date` date DEFAULT NULL,
  `ticket_type` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`journey_id`),
  KEY `fk_journeys_origin_station_id` (`station_id`),
  KEY `fk_journeys_destination_station_id` (`destination_station_id`),
  CONSTRAINT `fk_journeys_destination_station_id` FOREIGN KEY (`destination_station_id`) REFERENCES `stations` (`station_id`),
  CONSTRAINT `fk_journeys_origin_station_id` FOREIGN KEY (`station_id`) REFERENCES `stations` (`station_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journeys`
--

LOCK TABLES `journeys` WRITE;
/*!40000 ALTER TABLE `journeys` DISABLE KEYS */;
INSERT INTO `journeys` VALUES (1,1,2,'14:25:34',2.4,'2024-04-16','contactless card'),(2,3,4,'14:35:30',2.4,'2024-04-16','oyster card'),(3,5,6,'14:36:19',2.4,'2024-04-16','oyster card'),(4,7,8,'14:37:19',2.9,'2024-04-16','contactless card'),(5,9,10,'14:37:25',2.4,'2024-04-16','oyster card'),(6,11,12,'14:37:47',2.4,'2024-04-16','contactless card'),(7,13,14,'14:39:37',2.4,'2024-04-16','contactless card'),(8,15,16,'14:40:15',3.1,'2024-04-16','oyster card'),(9,17,18,'14:40:50',2.4,'2024-04-16','contactless card'),(10,19,20,'14:41:47',3.1,'2024-04-16','contactless card'),(11,2,3,'14:44:20',2.4,'2024-04-16','contactless card'),(12,4,5,'14:45:02',2.4,'2024-04-16','contactless card'),(13,6,7,'14:49:25',2.4,'2024-04-16','oyster card'),(14,8,9,'14:51:02',2.8,'2024-04-16','contactless card'),(15,10,11,'14:54:32',2.4,'2024-04-16','contactless card'),(16,12,13,'14:56:47',2.4,'2024-04-16','oyster card'),(17,14,15,'14:56:52',2.4,'2024-04-16','contactless card'),(18,16,17,'14:57:47',3.1,'2024-04-16','contactless card'),(19,18,19,'14:59:47',2.4,'2024-04-16','oyster card'),(20,20,1,'15:01:32',3.1,'2024-04-16','contactless card');
/*!40000 ALTER TABLE `journeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line`
--

DROP TABLE IF EXISTS `line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `line` (
  `line_id` int NOT NULL AUTO_INCREMENT,
  `line_name` varchar(55) NOT NULL,
  `colour` varchar(55) DEFAULT NULL,
  `operational_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`line_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line`
--

LOCK TABLES `line` WRITE;
/*!40000 ALTER TABLE `line` DISABLE KEYS */;
INSERT INTO `line` VALUES (1,'Bakerloo','brown',1),(2,'Central','red',1),(3,'Circle','yellow',1),(4,'District','green',1),(5,'Hammersmith & City','pink',1),(6,'Jubilee','grey',1),(7,'Metropolitan','maroon',1),(8,'Northen','black',1),(9,'Piccadilly','dark blue',1),(10,'Victoria','light blue',1),(11,'Waterloo & City','turquoise',1);
/*!40000 ALTER TABLE `line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger_count`
--

DROP TABLE IF EXISTS `passenger_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger_count` (
  `station_id` int DEFAULT NULL,
  `date_of_count` date DEFAULT NULL,
  `passenger_count` int DEFAULT NULL,
  KEY `fk_passenger_count_station_id` (`station_id`),
  CONSTRAINT `fk_passenger_count_station_id` FOREIGN KEY (`station_id`) REFERENCES `stations` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger_count`
--

LOCK TABLES `passenger_count` WRITE;
/*!40000 ALTER TABLE `passenger_count` DISABLE KEYS */;
INSERT INTO `passenger_count` VALUES (12,'2022-04-16',10843),(3,'2022-04-16',10962),(7,'2022-04-16',3329),(6,'2022-04-16',27094),(2,'2022-04-16',24576),(17,'2022-04-16',5806),(15,'2022-04-16',8788),(19,'2022-04-16',7456),(11,'2022-04-16',4792),(9,'2022-04-16',13939),(18,'2022-04-16',3707),(20,'2022-04-16',2286),(16,'2022-04-16',4170),(4,'2022-04-16',64669),(10,'2022-04-16',31865),(8,'2022-04-16',0),(1,'2024-04-17',1448);
/*!40000 ALTER TABLE `passenger_count` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_passenger_count` AFTER UPDATE ON `passenger_count` FOR EACH ROW UPDATE passenger_count SET station_id=new.station_id,
date_of_count=new.date_of_count,
passenger_count=new.passenger_count */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `station_lines`
--

DROP TABLE IF EXISTS `station_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station_lines` (
  `station_id` int DEFAULT NULL,
  `line_id` int DEFAULT NULL,
  KEY `fk_station_lines_station_id` (`station_id`),
  KEY `fk_station_lines_line_id` (`line_id`),
  CONSTRAINT `fk_station_lines_line_id` FOREIGN KEY (`line_id`) REFERENCES `line` (`line_id`),
  CONSTRAINT `fk_station_lines_station_id` FOREIGN KEY (`station_id`) REFERENCES `stations` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station_lines`
--

LOCK TABLES `station_lines` WRITE;
/*!40000 ALTER TABLE `station_lines` DISABLE KEYS */;
INSERT INTO `station_lines` VALUES (1,1),(1,6),(1,8),(1,11),(2,8),(3,2),(3,3),(3,4),(3,8),(3,11),(4,6),(4,2),(5,2),(5,9),(6,10),(7,5),(7,2),(7,7),(8,4),(9,4),(9,2),(10,2),(10,8),(11,4),(11,5),(12,3),(12,7),(13,8),(14,2),(15,8),(15,10),(16,6),(16,4),(16,5),(17,8),(18,8),(19,6),(20,8),(3,11);
/*!40000 ALTER TABLE `station_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations` (
  `station_id` int NOT NULL AUTO_INCREMENT,
  `station_name` varchar(55) NOT NULL,
  `zone` int NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES (1,'Waterloo',1,51.5033,-0.113109),(2,'Camden Town',2,51.54,-0.142452),(3,'Bank',1,51.5133,-0.089),(4,'Stratford',3,51.5419,-0.003397),(5,'Holborn',1,51.5172,-0.119841),(6,'Brixton',2,51.4633,-0.114183),(7,'Barbican',1,51.5202,-0.097722),(8,'Wimbledon',3,51.4213,-0.206383),(9,'Ealing Broadway',3,51.5148,-0.301752),(10,'Tottenham Court Road',1,51.5162,-0.13111),(11,'Whitechapel',2,51.5195,-0.059757),(12,'Aldgate',1,51.5143,-0.075627),(13,'Angel',1,51.533,-0.105581),(14,'Shepherds Bush',2,51.5045,-0.218519),(15,'Stockwell',2,51.4722,-0.122846),(16,'West Ham',3,51.5285,0.005431),(17,'Clapham Common',2,51.4618,-0.138315),(18,'East Finchley',3,51.5873,-0.164744),(19,'West Hampstead',2,51.5475,-0.191185),(20,'South Wimbledon',3,51.4154,-0.191975);
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `zone_1_stations`
--

DROP TABLE IF EXISTS `zone_1_stations`;
/*!50001 DROP VIEW IF EXISTS `zone_1_stations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `zone_1_stations` AS SELECT 
 1 AS `station_name`,
 1 AS `zone`,
 1 AS `line_name`,
 1 AS `colour`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `zone_2_stations`
--

DROP TABLE IF EXISTS `zone_2_stations`;
/*!50001 DROP VIEW IF EXISTS `zone_2_stations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `zone_2_stations` AS SELECT 
 1 AS `zone`,
 1 AS `line_name`,
 1 AS `colour`,
 1 AS `station_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'tfl'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `tube_closing` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `tube_closing` ON SCHEDULE EVERY 1 DAY STARTS '2024-04-16 00:30:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    UPDATE line
    SET operational_status = 0;
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `tube_opening` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `tube_opening` ON SCHEDULE EVERY 1 DAY STARTS '2024-04-16 05:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    UPDATE line
    SET operational_status = 1;
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'tfl'
--
/*!50003 DROP FUNCTION IF EXISTS `CalculateTotalFare` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CalculateTotalFare`(
    origin_zone INT,
    destination_zone INT,
    fare_type VARCHAR(55)
) RETURNS float
BEGIN
    DECLARE total_fare FLOAT; -- Changed the variable name from fare_amount to total_fare
    
    -- Retrieve fare amount based on origin and destination zones and ticket type
    SELECT fare_amount INTO total_fare
    FROM fares
    WHERE origin_zone = origin_zone
    AND destination_zone = destination_zone
  ;
    
    RETURN total_fare;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CheckLineOperational` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CheckLineOperational`(line_id INT) RETURNS tinyint(1)
BEGIN
    DECLARE is_operational BOOLEAN;

    -- Retrieve operational status of the line
SELECT CASE WHEN operational_status = 1 THEN TRUE ELSE FALSE END INTO is_operational
FROM line
WHERE line_id = 1;

    -- Return the operational status
    RETURN is_operational;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetAveragePassengerCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetAveragePassengerCount`(
    station_id_in INTEGER,
    date_of_count_in DATE
) RETURNS float
BEGIN
    DECLARE avg_passenger_count FLOAT;

    -- Calculate average passenger count for the specified station and date
    SELECT AVG(passenger_count) INTO avg_passenger_count
    FROM passenger_count
    WHERE station_id = station_id_in
    AND date_of_count = date_of_count_in;

    RETURN avg_passenger_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `station_name_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `station_name_id`()
BEGIN
SELECT station_name, station_id FROM stations;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `zone_1_stations`
--

/*!50001 DROP VIEW IF EXISTS `zone_1_stations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `zone_1_stations` AS select `stations`.`station_name` AS `station_name`,`stations`.`zone` AS `zone`,`line`.`line_name` AS `line_name`,`line`.`colour` AS `colour` from ((`station_lines` join `stations` on((`station_lines`.`station_id` = `stations`.`station_id`))) join `line` on((`station_lines`.`line_id` = `line`.`line_id`))) where (`stations`.`zone` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `zone_2_stations`
--

/*!50001 DROP VIEW IF EXISTS `zone_2_stations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `zone_2_stations` AS select `s`.`zone` AS `zone`,`l`.`line_name` AS `line_name`,`l`.`colour` AS `colour`,count(0) AS `station_count` from ((`station_lines` `sl` join `stations` `s` on((`sl`.`station_id` = `s`.`station_id`))) join `line` `l` on((`sl`.`line_id` = `l`.`line_id`))) where (`s`.`zone` = 2) group by `s`.`zone`,`l`.`line_name`,`l`.`colour` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-30 13:24:47
