-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`brand`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`brand` ;

CREATE TABLE IF NOT EXISTS `mydb`.`brand` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`engine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`engine` ;

CREATE TABLE IF NOT EXISTS `mydb`.`engine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `eng_vol` DOUBLE NOT NULL,
  `hp` DOUBLE NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `brand_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `engine_brand_id_idx` (`brand_id` ASC) VISIBLE,
  CONSTRAINT `engine_brand_id`
    FOREIGN KEY (`brand_id`)
    REFERENCES `mydb`.`brand` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`model`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`model` ;

CREATE TABLE IF NOT EXISTS `mydb`.`model` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `body_type` ENUM("sedan", "hatchback", "suv", "coupe") NOT NULL,
  `engine_id` INT NOT NULL,
  `brand_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `engine_id_idx` (`engine_id` ASC) VISIBLE,
  INDEX `model_brand_id_idx` (`brand_id` ASC) VISIBLE,
  CONSTRAINT `engine_id`
    FOREIGN KEY (`engine_id`)
    REFERENCES `mydb`.`engine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `model_brand_id`
    FOREIGN KEY (`brand_id`)
    REFERENCES `mydb`.`brand` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`location` ;

CREATE TABLE IF NOT EXISTS `mydb`.`location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `building` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`test_drive`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`test_drive` ;

CREATE TABLE IF NOT EXISTS `mydb`.`test_drive` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `location_id_idx` (`location_id` ASC) VISIBLE,
  CONSTRAINT `location_id`
    FOREIGN KEY (`location_id`)
    REFERENCES `mydb`.`location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`user` ;

CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`company` ;

CREATE TABLE IF NOT EXISTS `mydb`.`company` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`seller`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`seller` ;

CREATE TABLE IF NOT EXISTS `mydb`.`seller` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `kind` ENUM("dealer", "person") NOT NULL,
  `user_id` INT NOT NULL,
  `company_id` INT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `company_id_idx` (`company_id` ASC) VISIBLE,
  INDEX `location_id_idx` (`location_id` ASC) VISIBLE,
  CONSTRAINT `seller_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `company_id`
    FOREIGN KEY (`company_id`)
    REFERENCES `mydb`.`company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `seller_location_id`
    FOREIGN KEY (`location_id`)
    REFERENCES `mydb`.`location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`car`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`car` ;

CREATE TABLE IF NOT EXISTS `mydb`.`car` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `damage` ENUM("cosmetic_damage", "severely_damaged", "moderately_damaged", "excellent_condition") NOT NULL,
  `test_drive_id` INT NULL,
  `model_id` INT NOT NULL,
  `seller_id` INT NOT NULL,
  `price` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `model_id_idx` (`model_id` ASC) VISIBLE,
  INDEX `test_drive_id_idx` (`test_drive_id` ASC) VISIBLE,
  INDEX `seller_id_idx` (`seller_id` ASC) VISIBLE,
  CONSTRAINT `model_id`
    FOREIGN KEY (`model_id`)
    REFERENCES `mydb`.`model` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `test_drive_id`
    FOREIGN KEY (`test_drive_id`)
    REFERENCES `mydb`.`test_drive` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `seller_id`
    FOREIGN KEY (`seller_id`)
    REFERENCES `mydb`.`seller` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`timeslot`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`timeslot` ;

CREATE TABLE IF NOT EXISTS `mydb`.`timeslot` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `time` DATETIME NOT NULL,
  `test_drive_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `test_drive_id_idx` (`test_drive_id` ASC) VISIBLE,
  CONSTRAINT `timeslot_test_drive_id`
    FOREIGN KEY (`test_drive_id`)
    REFERENCES `mydb`.`test_drive` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`car_img`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`car_img` ;

CREATE TABLE IF NOT EXISTS `mydb`.`car_img` (
  `url` VARCHAR(512) NOT NULL,
  `car_id` INT NOT NULL,
  PRIMARY KEY (`url`),
  INDEX `car_id_idx` (`car_id` ASC) VISIBLE,
  CONSTRAINT `img_car_id`
    FOREIGN KEY (`car_id`)
    REFERENCES `mydb`.`car` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`feedback`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`feedback` ;

CREATE TABLE IF NOT EXISTS `mydb`.`feedback` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `comment` VARCHAR(200) NULL,
  `rating` INT(5) NOT NULL,
  `car_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `car_id_idx` (`car_id` ASC) VISIBLE,
  CONSTRAINT `feedback_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `feedback_car_id`
    FOREIGN KEY (`car_id`)
    REFERENCES `mydb`.`car` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
