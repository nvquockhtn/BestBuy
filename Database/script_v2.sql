SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `bestbuy` DEFAULT CHARACTER SET utf8 ;
USE `bestbuy` ;

-- -----------------------------------------------------
-- Table `bestbuy`.`accounttype`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bestbuy`.`accounttype` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`Id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bestbuy`.`account`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bestbuy`.`account` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT ,
  `FullName` VARCHAR(50) NULL DEFAULT NULL ,
  `Email` VARCHAR(100) NULL DEFAULT NULL ,
  `Address` VARCHAR(200) NULL DEFAULT NULL ,
  `PhoneNumber` VARCHAR(20) NULL DEFAULT NULL ,
  `Company` VARCHAR(100) NULL DEFAULT NULL ,
  `Username` VARCHAR(45) NULL DEFAULT NULL ,
  `Password` VARCHAR(60) NULL DEFAULT NULL ,
  `IsBlock` BIT(1) NULL DEFAULT b'0' ,
  `IsActive` BIT(1) NULL DEFAULT b'1' ,
  `TypeId` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`Id`) ,
  INDEX `fk_Account_AccountType1_idx` (`TypeId` ASC) ,
  CONSTRAINT `fk_Account_AccountType1`
    FOREIGN KEY (`TypeId` )
    REFERENCES `bestbuy`.`accounttype` (`Id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bestbuy`.`productstate`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bestbuy`.`productstate` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(200) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bestbuy`.`producttype`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bestbuy`.`producttype` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(100) NULL DEFAULT NULL ,
  PRIMARY KEY (`Id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bestbuy`.`product`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bestbuy`.`product` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(200) NULL DEFAULT NULL ,
  `Overview` TEXT NULL DEFAULT NULL ,
  `Specification` LONGTEXT NULL DEFAULT NULL ,
  `Price` INT(11) NULL DEFAULT NULL ,
  `Discount` FLOAT NULL DEFAULT NULL ,
  `ProductId` INT(11) NULL DEFAULT NULL ,
  `StateId` INT(11) NULL DEFAULT NULL ,
  `TypeId` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`Id`) ,
  INDEX `fk_Product_ProductState_idx` (`StateId` ASC) ,
  INDEX `fk_Product_ProductType1_idx` (`TypeId` ASC) ,
  CONSTRAINT `fk_Product_ProductState`
    FOREIGN KEY (`StateId` )
    REFERENCES `bestbuy`.`productstate` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_ProductType1`
    FOREIGN KEY (`TypeId` )
    REFERENCES `bestbuy`.`producttype` (`Id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bestbuy`.`comment`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bestbuy`.`comment` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT ,
  `Text` TEXT NULL DEFAULT NULL ,
  `CreateDate` DATE NULL DEFAULT NULL ,
  `ProductId` INT(11) NULL DEFAULT NULL ,
  `AccountId` INT(11) NULL DEFAULT NULL ,
  `Rating` FLOAT NULL DEFAULT NULL ,
  PRIMARY KEY (`Id`) ,
  INDEX `fk_Comment_Product1_idx` (`ProductId` ASC) ,
  INDEX `fk_Comment_Account1_idx` (`AccountId` ASC) ,
  CONSTRAINT `fk_Comment_Account1`
    FOREIGN KEY (`AccountId` )
    REFERENCES `bestbuy`.`account` (`Id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comment_Product1`
    FOREIGN KEY (`ProductId` )
    REFERENCES `bestbuy`.`product` (`Id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bestbuy`.`image`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bestbuy`.`image` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT ,
  `Text` VARCHAR(200) NULL DEFAULT NULL ,
  `Alt` VARCHAR(200) NULL DEFAULT NULL ,
  `Path` VARCHAR(300) NULL DEFAULT NULL ,
  `ProductId` INT(11) NULL DEFAULT NULL ,
  `TypeId` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`Id`) ,
  INDEX `fk_Image_Product1_idx` (`ProductId` ASC) ,
  CONSTRAINT `fk_Image_Product1`
    FOREIGN KEY (`ProductId` )
    REFERENCES `bestbuy`.`product` (`Id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bestbuy`.`orderstate`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bestbuy`.`orderstate` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`Id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bestbuy`.`receiver`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bestbuy`.`receiver` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT ,
  `FullName` VARCHAR(100) NULL DEFAULT NULL ,
  `Address` VARCHAR(100) NULL DEFAULT NULL ,
  `Company` VARCHAR(100) NULL DEFAULT NULL ,
  `Email` VARCHAR(100) NULL DEFAULT NULL ,
  `Phone` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`Id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bestbuy`.`order`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bestbuy`.`order` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT ,
  `CreateDate` DATE NULL DEFAULT NULL ,
  `ReceiverId` INT(11) NULL DEFAULT NULL ,
  `CreatorId` INT(11) NULL DEFAULT NULL ,
  `Total` INT(11) NULL DEFAULT NULL ,
  `StateId` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`Id`) ,
  INDEX `fk_Order_Receiver1_idx` (`ReceiverId` ASC) ,
  INDEX `fk_Order_Account1_idx` (`CreatorId` ASC) ,
  INDEX `fk_Order_OrderState1_idx` (`StateId` ASC) ,
  CONSTRAINT `fk_Order_Account1`
    FOREIGN KEY (`CreatorId` )
    REFERENCES `bestbuy`.`account` (`Id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_OrderState1`
    FOREIGN KEY (`StateId` )
    REFERENCES `bestbuy`.`orderstate` (`Id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Receiver1`
    FOREIGN KEY (`ReceiverId` )
    REFERENCES `bestbuy`.`receiver` (`Id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bestbuy`.`orderdetail`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bestbuy`.`orderdetail` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT ,
  `OrderId` INT(11) NULL DEFAULT NULL ,
  `ProductId` INT(11) NULL DEFAULT NULL ,
  `Quantity` INT(11) NULL DEFAULT NULL ,
  `UnitPrice` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`Id`) ,
  INDEX `fk_OrderDetail_Order1_idx` (`OrderId` ASC) ,
  INDEX `fk_OrderDetail_Product1_idx` (`ProductId` ASC) ,
  CONSTRAINT `fk_OrderDetail_Order1`
    FOREIGN KEY (`OrderId` )
    REFERENCES `bestbuy`.`order` (`Id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderDetail_Product1`
    FOREIGN KEY (`ProductId` )
    REFERENCES `bestbuy`.`product` (`Id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `bestbuy` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
