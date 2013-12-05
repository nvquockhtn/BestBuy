SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `bestbuy` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `bestbuy` ;

-- -----------------------------------------------------
-- Table `bestbuy`.`ProductState`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bestbuy`.`ProductState` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(200) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bestbuy`.`ProductType`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bestbuy`.`ProductType` (
  `Id` INT NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(100) NULL ,
  PRIMARY KEY (`Id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bestbuy`.`Product`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bestbuy`.`Product` (
  `Id` INT NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(200) NULL ,
  `Overview` TEXT NULL ,
  `Specification` LONGTEXT NULL ,
  `Price` INT NULL ,
  `Discount` FLOAT NULL ,
  `ProductId` INT NULL ,
  `StateId` INT NOT NULL ,
  `TypeId` INT NOT NULL ,
  PRIMARY KEY (`Id`) ,
  INDEX `fk_Product_ProductState_idx` (`StateId` ASC) ,
  INDEX `fk_Product_ProductType1_idx` (`TypeId` ASC) ,
  CONSTRAINT `fk_Product_ProductState`
    FOREIGN KEY (`StateId` )
    REFERENCES `bestbuy`.`ProductState` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_ProductType1`
    FOREIGN KEY (`TypeId` )
    REFERENCES `bestbuy`.`ProductType` (`Id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bestbuy`.`Image`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bestbuy`.`Image` (
  `Id` INT NOT NULL AUTO_INCREMENT ,
  `Text` VARCHAR(200) NULL ,
  `Alt` VARCHAR(200) NULL ,
  `Path` VARCHAR(300) NULL ,
  `ProductId` INT NOT NULL ,
  `TypeId` INT NULL ,
  PRIMARY KEY (`Id`) ,
  INDEX `fk_Image_Product1_idx` (`ProductId` ASC) ,
  CONSTRAINT `fk_Image_Product1`
    FOREIGN KEY (`ProductId` )
    REFERENCES `bestbuy`.`Product` (`Id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bestbuy`.`AccountType`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bestbuy`.`AccountType` (
  `Id` INT NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(45) NULL ,
  PRIMARY KEY (`Id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bestbuy`.`Account`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bestbuy`.`Account` (
  `Id` INT NOT NULL AUTO_INCREMENT ,
  `FullName` VARCHAR(50) NULL ,
  `Email` VARCHAR(100) NULL ,
  `Address` VARCHAR(200) NULL ,
  `PhoneNumber` VARCHAR(20) NULL ,
  `Company` VARCHAR(100) NULL ,
  `Username` VARCHAR(45) NULL ,
  `Password` VARCHAR(60) NULL ,
  `IsBlock` BIT NULL ,
  `IsActive` BIT NULL ,
  `TypeId` INT NOT NULL ,
  PRIMARY KEY (`Id`) ,
  INDEX `fk_Account_AccountType1_idx` (`TypeId` ASC) ,
  CONSTRAINT `fk_Account_AccountType1`
    FOREIGN KEY (`TypeId` )
    REFERENCES `bestbuy`.`AccountType` (`Id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bestbuy`.`Comment`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bestbuy`.`Comment` (
  `Id` INT NOT NULL AUTO_INCREMENT ,
  `Text` TEXT NULL ,
  `CreateDate` DATE NULL ,
  `ProductId` INT NOT NULL ,
  `AccountId` INT NOT NULL ,
  `Rating` FLOAT NULL ,
  PRIMARY KEY (`Id`) ,
  INDEX `fk_Comment_Product1_idx` (`ProductId` ASC) ,
  INDEX `fk_Comment_Account1_idx` (`AccountId` ASC) ,
  CONSTRAINT `fk_Comment_Product1`
    FOREIGN KEY (`ProductId` )
    REFERENCES `bestbuy`.`Product` (`Id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comment_Account1`
    FOREIGN KEY (`AccountId` )
    REFERENCES `bestbuy`.`Account` (`Id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bestbuy`.`OrderState`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bestbuy`.`OrderState` (
  `Id` INT NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(45) NULL ,
  PRIMARY KEY (`Id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bestbuy`.`Receiver`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bestbuy`.`Receiver` (
  `Id` INT NOT NULL AUTO_INCREMENT ,
  `FullName` VARCHAR(100) NULL ,
  `Address` VARCHAR(100) NULL ,
  `Company` VARCHAR(100) NULL ,
  `Email` VARCHAR(100) NULL ,
  `Phone` VARCHAR(45) NULL ,
  PRIMARY KEY (`Id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bestbuy`.`Order`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bestbuy`.`Order` (
  `Id` INT NOT NULL AUTO_INCREMENT ,
  `CreateDate` DATE NULL ,
  `ReceiverId` INT NOT NULL ,
  `CreatorId` INT NOT NULL ,
  `Total` INT NULL ,
  `StateId` INT NOT NULL ,
  PRIMARY KEY (`Id`) ,
  INDEX `fk_Order_Receiver1_idx` (`ReceiverId` ASC) ,
  INDEX `fk_Order_Account1_idx` (`CreatorId` ASC) ,
  INDEX `fk_Order_OrderState1_idx` (`StateId` ASC) ,
  CONSTRAINT `fk_Order_Receiver1`
    FOREIGN KEY (`ReceiverId` )
    REFERENCES `bestbuy`.`Receiver` (`Id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Account1`
    FOREIGN KEY (`CreatorId` )
    REFERENCES `bestbuy`.`Account` (`Id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_OrderState1`
    FOREIGN KEY (`StateId` )
    REFERENCES `bestbuy`.`OrderState` (`Id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bestbuy`.`OrderDetail`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bestbuy`.`OrderDetail` (
  `Id` INT NOT NULL AUTO_INCREMENT ,
  `OrderId` INT NOT NULL ,
  `ProductId` INT NOT NULL ,
  `Quantity` INT NULL ,
  `UnitPrice` INT NULL ,
  PRIMARY KEY (`Id`) ,
  INDEX `fk_OrderDetail_Order1_idx` (`OrderId` ASC) ,
  INDEX `fk_OrderDetail_Product1_idx` (`ProductId` ASC) ,
  CONSTRAINT `fk_OrderDetail_Order1`
    FOREIGN KEY (`OrderId` )
    REFERENCES `bestbuy`.`Order` (`Id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderDetail_Product1`
    FOREIGN KEY (`ProductId` )
    REFERENCES `bestbuy`.`Product` (`Id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `bestbuy` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
