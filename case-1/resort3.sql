-- MySQL Workbench Synchronization
-- Generated: 2023-11-29 09:27
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: AD

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;

ALTER SCHEMA `resort`  DEFAULT CHARACTER SET utf8mb4  DEFAULT COLLATE utf8mb4_0900_ai_ci ;

ALTER TABLE `resort`.`attach_facility` 
CHARACTER SET = utf8mb4 , COLLATE = utf8mb4_0900_ai_ci ,
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `name` `name` NVARCHAR(45) NOT NULL ,
CHANGE COLUMN `cost` `cost` DOUBLE NOT NULL ,
CHANGE COLUMN `unit` `unit` VARCHAR(10) NOT NULL ,
CHANGE COLUMN `status` `status` VARCHAR(45) NULL DEFAULT NULL ;

CREATE TABLE IF NOT EXISTS `resort`.`contract` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `start_date` DATETIME NOT NULL,
  `end_date` DATETIME NOT NULL,
  `deposit` DOUBLE NOT NULL,
  `employee_id` INT(11) NULL DEFAULT NULL,
  `customer_id` INT(11) NULL DEFAULT NULL,
  `facility_id` INT(11) NULL DEFAULT NULL,
  `is_delete` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `customer_id` (`customer_id` ASC) VISIBLE,
  INDEX `employee_id_idx` (`employee_id` ASC) VISIBLE,
  INDEX `facility_id_idx` (`facility_id` ASC) VISIBLE,
  CONSTRAINT `contract_ibfk_1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `resort`.`customer` (`id`),
  CONSTRAINT `employee_id`
    FOREIGN KEY (`employee_id`)
    REFERENCES `resort`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `facility_id`
    FOREIGN KEY (`facility_id`)
    REFERENCES `resort`.`facility` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

ALTER TABLE `resort`.`contract_detail` 
CHARACTER SET = utf8mb4 , COLLATE = utf8mb4_0900_ai_ci ,
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `quantity` `quantity` INT(11) NOT NULL ,
ADD INDEX `contract_id_idx` (`contract_id` ASC) VISIBLE,
ADD INDEX `attract_facility_id_idx` (`attach_facility_id` ASC) VISIBLE;
;

CREATE TABLE IF NOT EXISTS `resort`.`customer` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_type_id` INT(11) NULL DEFAULT NULL,
  `name` NVARCHAR(50) NOT NULL,
  `gender` BIT(1) NOT NULL,
  `date_of_birth` VARCHAR(50) NOT NULL,
  `id_card` VARCHAR(12) NOT NULL,
  `phone_number` VARCHAR(12) NOT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `address` NVARCHAR(50) NULL DEFAULT NULL,
  `is_delete` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `customer_type_idx` (`customer_type_id` ASC) VISIBLE,
  CONSTRAINT `customer_type`
    FOREIGN KEY (`customer_type_id`)
    REFERENCES `resort`.`customer_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

ALTER TABLE `resort`.`customer_type` 
CHARACTER SET = utf8mb4 , COLLATE = utf8mb4_0900_ai_ci ,
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `name` `name` VARCHAR(50) NULL DEFAULT NULL ;

ALTER TABLE `resort`.`division` 
CHARACTER SET = utf8mb4 , COLLATE = utf8mb4_0900_ai_ci ,
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE `resort`.`education_degree` 
CHARACTER SET = utf8mb4 , COLLATE = utf8mb4_0900_ai_ci ,
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ;

CREATE TABLE IF NOT EXISTS `resort`.`employee` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` NVARCHAR(50) NOT NULL,
  `date_of_birth` VARCHAR(50) NOT NULL,
  `id_card` VARCHAR(12) NOT NULL,
  `salary` DOUBLE NOT NULL,
  `phone_number` VARCHAR(12) NOT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(50) NULL DEFAULT NULL,
  `position_id` INT(11) NULL DEFAULT NULL,
  `education_degree_id` INT(11) NULL DEFAULT NULL,
  `division_id` INT(11) NULL DEFAULT NULL,
  `user_name` VARCHAR(255) NULL DEFAULT NULL,
  `is_delete` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `position_id` (`position_id` ASC) VISIBLE,
  INDEX `education_degree_id` (`education_degree_id` ASC) VISIBLE,
  INDEX `division_id` (`division_id` ASC) VISIBLE,
  INDEX `user_name` (`user_name` ASC) VISIBLE,
  CONSTRAINT `employee_ibfk_1`
    FOREIGN KEY (`position_id`)
    REFERENCES `resort`.`position` (`id`),
  CONSTRAINT `employee_ibfk_2`
    FOREIGN KEY (`education_degree_id`)
    REFERENCES `resort`.`education_degree` (`id`),
  CONSTRAINT `employee_ibfk_3`
    FOREIGN KEY (`division_id`)
    REFERENCES `resort`.`division` (`id`),
  CONSTRAINT `employee_ibfk_4`
    FOREIGN KEY (`user_name`)
    REFERENCES `resort`.`user` (`user_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `resort`.`facility` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` NVARCHAR(50) NOT NULL,
  `area` INT(11) NULL DEFAULT NULL,
  `cost` DOUBLE NULL DEFAULT NULL,
  `max_people` INT(11) NULL DEFAULT NULL,
  `rent_type_id` INT(11) NULL DEFAULT NULL,
  `facility_type_id` INT(11) NULL DEFAULT NULL,
  `standard_room` VARCHAR(45) NULL DEFAULT NULL,
  `description_other_convenience` VARCHAR(45) NULL DEFAULT NULL,
  `pool_area` DOUBLE NULL DEFAULT NULL,
  `number_of_floors` INT(11) NULL DEFAULT NULL,
  `facility_free` TEXT NULL DEFAULT NULL,
  `is_delete` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `rent_type_id` (`rent_type_id` ASC) VISIBLE,
  INDEX `facility_type_id` (`facility_type_id` ASC) VISIBLE,
  CONSTRAINT `facility_ibfk_1`
    FOREIGN KEY (`rent_type_id`)
    REFERENCES `resort`.`rent_type` (`id`),
  CONSTRAINT `facility_ibfk_2`
    FOREIGN KEY (`facility_type_id`)
    REFERENCES `resort`.`facility_type` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

ALTER TABLE `resort`.`facility_type` 
CHARACTER SET = utf8mb4 , COLLATE = utf8mb4_0900_ai_ci ,
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE `resort`.`position` 
CHARACTER SET = utf8mb4 , COLLATE = utf8mb4_0900_ai_ci ,
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE `resort`.`rent_type` 
CHARACTER SET = utf8mb4 , COLLATE = utf8mb4_0900_ai_ci ,
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE `resort`.`role` 
CHARACTER SET = utf8mb4 , COLLATE = utf8mb4_0900_ai_ci ,
CHANGE COLUMN `role_id` `role_id` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE `resort`.`user` 
CHARACTER SET = utf8mb4 , COLLATE = utf8mb4_0900_ai_ci ,
CHANGE COLUMN `user_name` `user_name` VARCHAR(255) NOT NULL ,
CHANGE COLUMN `password` `password` VARCHAR(255) NULL DEFAULT NULL ;

CREATE TABLE IF NOT EXISTS `resort`.`user_role` (
  `role_id` INT(11) NOT NULL,
  `user_name` VARCHAR(255) NOT NULL,
  `is_delete` BIT(1) NULL DEFAULT NULL,
  INDEX `role_id` (`role_id` ASC) VISIBLE,
  INDEX `user_name` (`user_name` ASC) VISIBLE,
  PRIMARY KEY (`role_id`, `user_name`),
  CONSTRAINT `user_role_ibfk_1`
    FOREIGN KEY (`role_id`)
    REFERENCES `resort`.`role` (`role_id`),
  CONSTRAINT `user_role_ibfk_2`
    FOREIGN KEY (`user_name`)
    REFERENCES `resort`.`user` (`user_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

ALTER TABLE `resort`.`contract_detail` 
ADD CONSTRAINT `attract_facility_id`
  FOREIGN KEY (`attach_facility_id`)
  REFERENCES `resort`.`attach_facility` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `contract_id`
  FOREIGN KEY (`contract_id`)
  REFERENCES `resort`.`contract` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
