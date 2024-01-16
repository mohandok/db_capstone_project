-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_Capstone_Proj
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_Capstone_Proj
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_Capstone_Proj` DEFAULT CHARACTER SET utf8 ;
USE `db_Capstone_Proj` ;

-- -----------------------------------------------------
-- Table `db_Capstone_Proj`.`menuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_Capstone_Proj`.`menuItems` (
  `MenuItemsID` INT NOT NULL,
  `CourseName` VARCHAR(255) NULL,
  `StartersName` VARCHAR(255) NULL,
  `DessertName` VARCHAR(255) NULL,
  PRIMARY KEY (`MenuItemsID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_Capstone_Proj`.`menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_Capstone_Proj`.`menus` (
  `MenuID` INT NOT NULL,
  `MenuItemsID` INT NULL,
  `Name` VARCHAR(255) NULL,
  `Type` VARCHAR(100) NULL,
  `Price` DECIMAL(15,0) NULL,
  `Cuisine` VARCHAR(255) NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `fkmenuitemsid_idx` (`MenuItemsID` ASC) VISIBLE,
  CONSTRAINT `fkmenuitemsid`
    FOREIGN KEY (`MenuItemsID`)
    REFERENCES `db_Capstone_Proj`.`menuItems` (`MenuItemsID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_Capstone_Proj`.`customerdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_Capstone_Proj`.`customerdetails` (
  `CustomerID` INT NOT NULL,
  `Name` VARCHAR(100) NULL,
  `ContactNumber` VARCHAR(100) NULL,
  `Email` VARCHAR(100) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_Capstone_Proj`.`staffinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_Capstone_Proj`.`staffinfo` (
  `StaffID` INT NOT NULL,
  `Name` VARCHAR(100) NULL,
  `Role` VARCHAR(100) NULL,
  `Salary` DECIMAL(12,0) NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_Capstone_Proj`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_Capstone_Proj`.`orders` (
  `OrderID` INT NOT NULL,
  `CustomerID` INT NULL,
  `MenuItemID` INT NULL,
  `StaffID` INT NULL,
  `Date` DATETIME NULL,
  `Quantity` INT NULL,
  `TotalCost` DECIMAL(12,0) NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fkcustomerid_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `fkmenuitesid_idx` (`MenuItemID` ASC) VISIBLE,
  INDEX `fkstaffid_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `fkcustomerid`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `db_Capstone_Proj`.`customerdetails` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fkmenuitesid`
    FOREIGN KEY (`MenuItemID`)
    REFERENCES `db_Capstone_Proj`.`menuItems` (`MenuItemsID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fkstaffid`
    FOREIGN KEY (`StaffID`)
    REFERENCES `db_Capstone_Proj`.`staffinfo` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_Capstone_Proj`.`orderdeliverystatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_Capstone_Proj`.`orderdeliverystatus` (
  `DeliveryID` INT NOT NULL,
  `OrderID` INT NULL,
  `Date` DATETIME NULL,
  `Status` VARCHAR(255) NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `fkorderid_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fkorderid`
    FOREIGN KEY (`OrderID`)
    REFERENCES `db_Capstone_Proj`.`orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_Capstone_Proj`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_Capstone_Proj`.`Bookings` (
  `BookingID` INT NOT NULL,
  `CustomerID` INT NULL,
  `Date` DATETIME NULL,
  `TableNumber` INT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `fkcustid_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fkcustid`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `db_Capstone_Proj`.`customerdetails` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
