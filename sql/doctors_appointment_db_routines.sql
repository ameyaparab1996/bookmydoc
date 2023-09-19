CREATE DATABASE  IF NOT EXISTS `doctors_appointment_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `doctors_appointment_db`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: doctors_appointment_db
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Temporary view structure for view `doctors_experience`
--

DROP TABLE IF EXISTS `doctors_experience`;
/*!50001 DROP VIEW IF EXISTS `doctors_experience`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `doctors_experience` AS SELECT 
 1 AS `DoctorID`,
 1 AS `SpecialtyID`,
 1 AS `Experience`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `doctor_details`
--

DROP TABLE IF EXISTS `doctor_details`;
/*!50001 DROP VIEW IF EXISTS `doctor_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `doctor_details` AS SELECT 
 1 AS `DoctorID`,
 1 AS `FirstName`,
 1 AS `MiddleName`,
 1 AS `LastName`,
 1 AS `SpecialtyName`,
 1 AS `Credential`,
 1 AS `GraduationYear`,
 1 AS `Teleconsultation`,
 1 AS `PhoneNumber`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `secondary_specialties`
--

DROP TABLE IF EXISTS `secondary_specialties`;
/*!50001 DROP VIEW IF EXISTS `secondary_specialties`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `secondary_specialties` AS SELECT 
 1 AS `DoctorID`,
 1 AS `SecondarySpecialties`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `doctors_experience`
--

/*!50001 DROP VIEW IF EXISTS `doctors_experience`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `doctors_experience` AS select `e`.`DoctorID` AS `DoctorID`,`s`.`SpecialtyID` AS `SpecialtyID`,(year(now()) - `e`.`GraduationYear`) AS `Experience` from ((`education` `e` join `doctorspecialties` `dspl` on((`e`.`DoctorID` = `dspl`.`DoctorID`))) join `specialties` `s` on((`dspl`.`SpecialtyID` = `s`.`SpecialtyID`))) where (`s`.`SpecialtyName` <> '') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `doctor_details`
--

/*!50001 DROP VIEW IF EXISTS `doctor_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `doctor_details` AS select distinct `doc`.`DoctorID` AS `DoctorID`,`doc`.`FirstName` AS `FirstName`,`doc`.`MiddleName` AS `MiddleName`,`doc`.`LastName` AS `LastName`,`spl`.`SpecialtyName` AS `SpecialtyName`,`edu`.`Credential` AS `Credential`,`edu`.`GraduationYear` AS `GraduationYear`,`ser`.`Teleconsultation` AS `Teleconsultation`,`con`.`PhoneNumber` AS `PhoneNumber` from (((((`doctors` `doc` join `doctorspecialties` `docspl` on((`doc`.`DoctorID` = `docspl`.`DoctorID`))) join `specialties` `spl` on((`spl`.`SpecialtyID` = `docspl`.`SpecialtyID`))) join `education` `edu` on((`doc`.`DoctorID` = `edu`.`DoctorID`))) join `services` `ser` on((`doc`.`DoctorID` = `ser`.`DoctorID`))) join `contacts` `con` on((`doc`.`DoctorID` = `con`.`DoctorID`))) where (`docspl`.`IsPrimary` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `secondary_specialties`
--

/*!50001 DROP VIEW IF EXISTS `secondary_specialties`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `secondary_specialties` AS select `docspl`.`DoctorID` AS `DoctorID`,group_concat(distinct `spl`.`SpecialtyName` separator ', ') AS `SecondarySpecialties` from (`doctorspecialties` `docspl` join `specialties` `spl` on((`docspl`.`SpecialtyID` = `spl`.`SpecialtyID`))) where (`docspl`.`IsPrimary` = 0) group by `docspl`.`DoctorID` having (`SecondarySpecialties` <> '') */;
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

-- Dump completed on 2023-04-02 17:53:07
