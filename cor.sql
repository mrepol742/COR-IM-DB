/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 8.0.30 : Database - cor
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cor` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `cor`;

/*Table structure for table `cor` */

DROP TABLE IF EXISTS `cor`;

CREATE TABLE `cor` (
  `cor_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  `program_id` int DEFAULT NULL,
  PRIMARY KEY (`cor_id`),
  KEY `cor_student` (`student_id`),
  KEY `cor_section` (`section_id`),
  KEY `cor_program` (`program_id`),
  CONSTRAINT `cor_program` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`),
  CONSTRAINT `cor_section` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`),
  CONSTRAINT `cor_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cor` */

/*Table structure for table `f2f` */

DROP TABLE IF EXISTS `f2f`;

CREATE TABLE `f2f` (
  `f2f_id` int NOT NULL AUTO_INCREMENT,
  `section_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `days` varchar(200) DEFAULT NULL,
  `time` varchar(200) DEFAULT NULL,
  `room` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`f2f_id`),
  KEY `f2f_section` (`section_id`),
  KEY `f2f_subject` (`subject_id`),
  CONSTRAINT `f2f_section` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`),
  CONSTRAINT `f2f_subject` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `f2f` */

/*Table structure for table `ir_work` */

DROP TABLE IF EXISTS `ir_work`;

CREATE TABLE `ir_work` (
  `ir_work_id` int NOT NULL AUTO_INCREMENT,
  `section_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `days` varchar(200) DEFAULT NULL,
  `time` varchar(200) DEFAULT NULL,
  `room` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ir_work_id`),
  KEY `ir_work_subject` (`subject_id`),
  KEY `ir_work_section` (`section_id`),
  CONSTRAINT `ir_work_section` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`),
  CONSTRAINT `ir_work_subject` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ir_work` */

/*Table structure for table `program` */

DROP TABLE IF EXISTS `program`;

CREATE TABLE `program` (
  `program_id` int NOT NULL AUTO_INCREMENT,
  `section_id` int DEFAULT NULL,
  `program_name` varchar(200) DEFAULT NULL,
  `subject1` varchar(200) DEFAULT NULL,
  `subject2` varchar(200) DEFAULT NULL,
  `subject3` varchar(200) DEFAULT NULL,
  `subject4` varchar(200) DEFAULT NULL,
  `subject5` varchar(200) DEFAULT NULL,
  `subject6` varchar(200) DEFAULT NULL,
  `subject7` varchar(200) DEFAULT NULL,
  `subject8` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`program_id`),
  KEY `program_section` (`section_id`),
  CONSTRAINT `program_section` FOREIGN KEY (`section_id`) REFERENCES `program` (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `program` */

/*Table structure for table `section` */

DROP TABLE IF EXISTS `section`;

CREATE TABLE `section` (
  `section_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `academic_year` varchar(200) DEFAULT NULL,
  `program` varchar(200) DEFAULT NULL,
  `college` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `section` */

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `phone_number` varchar(200) DEFAULT NULL,
  `birthdate` varchar(200) DEFAULT NULL,
  `year_level` varchar(200) DEFAULT NULL,
  `registration_date` varchar(200) DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  `academic_year` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `student_section` (`section_id`),
  CONSTRAINT `student_section` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `student` */

/*Table structure for table `subject` */

DROP TABLE IF EXISTS `subject`;

CREATE TABLE `subject` (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `code` varchar(200) DEFAULT NULL,
  `credits` varchar(200) DEFAULT NULL,
  `f2f_id` int DEFAULT NULL,
  `ir_work_id` int DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  PRIMARY KEY (`subject_id`),
  KEY `subject_f2f` (`f2f_id`),
  KEY `subject_ir_work` (`ir_work_id`),
  KEY `subject_section` (`section_id`),
  CONSTRAINT `subject_f2f` FOREIGN KEY (`f2f_id`) REFERENCES `f2f` (`f2f_id`),
  CONSTRAINT `subject_ir_work` FOREIGN KEY (`ir_work_id`) REFERENCES `ir_work` (`ir_work_id`),
  CONSTRAINT `subject_section` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subject` */

/*Table structure for table `year_level` */

DROP TABLE IF EXISTS `year_level`;

CREATE TABLE `year_level` (
  `year_level_id` int NOT NULL AUTO_INCREMENT,
  `level` varchar(200) DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  PRIMARY KEY (`year_level_id`),
  KEY `year_section` (`section_id`),
  CONSTRAINT `year_section` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `year_level` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
