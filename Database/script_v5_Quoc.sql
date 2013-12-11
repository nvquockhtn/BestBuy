CREATE DATABASE  IF NOT EXISTS `bestbuy` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bestbuy`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: bestbuy
-- ------------------------------------------------------
-- Server version	5.6.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accessorydetail`
--

DROP TABLE IF EXISTS `accessorydetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accessorydetail` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductId` int(11) DEFAULT NULL,
  `AccessoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_MainProduct_idx` (`ProductId`),
  KEY `FK_Accessory_idx` (`AccessoryId`),
  CONSTRAINT `FK_Accessory` FOREIGN KEY (`AccessoryId`) REFERENCES `product` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_MainProduct` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessorydetail`
--

LOCK TABLES `accessorydetail` WRITE;
/*!40000 ALTER TABLE `accessorydetail` DISABLE KEYS */;
INSERT INTO `accessorydetail` VALUES (1,1,18),(2,1,19),(3,1,20),(4,1,21);
/*!40000 ALTER TABLE `accessorydetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Company` varchar(100) DEFAULT NULL,
  `Username` varchar(45) DEFAULT NULL,
  `Password` varchar(60) DEFAULT NULL,
  `IsBlock` bit(1) DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  `TypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Account_AccountType1_idx` (`TypeId`),
  CONSTRAINT `fk_Account_AccountType1` FOREIGN KEY (`TypeId`) REFERENCES `accounttype` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'Đặng văn Quang','vanquangtb101@gmail,com','Huế','01699578134','Vinh Quang Company','vanquang','vanquang','\0','',1),(2,'Nguyễn Văn Quốc','vanquoc@gmail.com','Bình Định','01234567899','No Name','vanquoc','vanquoc','\0','',1),(3,'Võ Thanh Quang','thanhquang@gmail.com','Long An','01112345678','Quang Quang','thanhquang','thanhquang','\0','',2),(4,'Hồ Xuân Cường','xuancuong@gmail.com','Huế','02832353424','Xuan Cuong','xuancuong','xuancuong','\0','',2),(5,'Trần Doanh','trandoanh@gmail.com','Huế','03245255454','Tran Doanh','trandoanh','trandoanh','\0','',2),(6,'Hoàng Oanh','hoangoanh@gmail.com','Huế','08979434343','Hoang Oanh','hoangoanh','hoangoanh','\0','',2);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounttype`
--

DROP TABLE IF EXISTS `accounttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounttype` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounttype`
--

LOCK TABLES `accounttype` WRITE;
/*!40000 ALTER TABLE `accounttype` DISABLE KEYS */;
INSERT INTO `accounttype` VALUES (1,'Admin'),(2,'Customer');
/*!40000 ALTER TABLE `accounttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Text` text,
  `CreateDate` date DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `AccountId` int(11) DEFAULT NULL,
  `Rating` float DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Comment_Product1_idx` (`ProductId`),
  KEY `fk_Comment_Account1_idx` (`AccountId`),
  CONSTRAINT `fk_Comment_Account1` FOREIGN KEY (`AccountId`) REFERENCES `account` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comment_Product1` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Text` varchar(200) DEFAULT NULL,
  `Alt` varchar(200) DEFAULT NULL,
  `Path` varchar(300) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `TypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Image_Product1_idx` (`ProductId`),
  CONSTRAINT `fk_Image_Product1` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire E1 532 29552G50Mn_small.jpg',1,1),(2,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire E1 532 29552G50Mn_large.jpg',1,2),(19,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire E1 532 29552G50Mn_large1.jpg',1,2),(20,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire E1 532 29552G50Mn_large2.jpg',1,2),(21,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire E1 532 29552G50Mn_large3.jpg',1,2),(22,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire E1 571 2342G50Mn_small.jpg',2,1),(23,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire E1 571 2342G50Mn_large1.jpg',2,2),(24,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire E1 571 2342G50Mn_large2.jpg',2,2),(25,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire E1 571 2342G50Mn_large3.jpg',2,2),(27,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire V5 471G 33224G50Ma_small.jpg',3,1),(28,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire V5 471G 33224G50Ma_large.jpg',3,2),(29,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire V5 471G 33224G50Ma_large1.jpg',3,2),(30,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire V5 471G 33224G50Ma_large2.jpg',3,2),(31,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire V5 471G 33224G50Ma_large3.jpg',3,2),(32,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire V5 473 34014G50am_small.jpg',4,1),(33,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire V5 473 34014G50am_large.jpg',4,2),(34,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire V5 473 34014G50am_large1.jpg',4,2),(35,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire V5 473 34014G50am_large2.jpg',4,2),(36,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire V5 473 34014G50am_large3.jpg',4,2),(37,NULL,NULL,'Apple/Laptop/Laptop Apple MacBook Air MD760_small.jpg',5,1),(38,NULL,NULL,'Apple/Laptop/Laptop Apple MacBook Air MD760_large.jpg',5,2),(39,NULL,NULL,'Apple/Laptop/Laptop Apple MacBook Air MD760_large1.jpg',5,2),(40,NULL,NULL,'Apple/Laptop/Laptop Apple MacBook Air MD760_large2.jpg',5,2),(41,NULL,NULL,'Apple/Laptop/Laptop Apple MacBook Air MD760_large3.jpg',5,2),(42,NULL,NULL,'Assus/Laptop/Laptop Asus K45A 2372G50_small.jpg',6,1),(43,NULL,NULL,'Assus/Laptop/Laptop Asus K45A 2372G50_large.jpg',6,2),(44,NULL,NULL,'Assus/Laptop/Laptop Asus K45A 2372G50_large1.jpg',6,2),(45,NULL,NULL,'Assus/Laptop/Laptop Asus K45A 2372G50_large2.jpg',6,2),(46,NULL,NULL,'Assus/Laptop/Laptop Asus K45A 2372G50_large3.jpg',6,2),(47,NULL,NULL,'Assus/Laptop/Laptop Asus X451CA 2112G50_small.jpg',7,1),(48,NULL,NULL,'Assus/Laptop/Laptop Asus X451CA 2112G50_large.jpg',7,2),(49,NULL,NULL,'Assus/Laptop/Laptop Asus X451CA 2112G50_large1.jpg',7,2),(50,NULL,NULL,'Assus/Laptop/Laptop Asus X451CA 2112G50_large2.jpg',7,2),(51,NULL,NULL,'Assus/Laptop/Laptop Asus X451CA 2112G50_large3.jpg',7,2),(52,NULL,NULL,'Assus/Laptop/Laptop Asus X451CA 10072G50_small.jpg',8,1),(53,NULL,NULL,'Assus/Laptop/Laptop Asus X451CA 10072G50_large.jpg',8,2),(54,NULL,NULL,'Assus/Laptop/Laptop Asus X451CA 10072G50_large1.jpg',8,2),(55,NULL,NULL,'Assus/Laptop/Laptop Asus X451CA 10072G50_large2.jpg',8,2),(56,NULL,NULL,'Assus/Laptop/Laptop Asus X451CA 10072G50_large3.jpg',8,2),(57,NULL,NULL,'Assus/Laptop/Laptop Asus X550CA 33212G50_small.jpg',9,1),(58,NULL,NULL,'Assus/Laptop/Laptop Asus X550CA 33212G50_large.jpg',9,2),(59,NULL,NULL,'Assus/Laptop/Laptop Asus X550CA 33212G50_large1.jpg',9,2),(60,NULL,NULL,'Assus/Laptop/Laptop Asus X550CA 33212G50_large2.jpg',9,2),(61,NULL,NULL,'Assus/Laptop/Laptop Asus X550CA 33212G50_large3.jpg',9,2),(62,NULL,NULL,'Dell/Laptop/Laptop Dell Inspiron 3521 33214G50_small.jpg',10,1),(63,NULL,NULL,'Dell/Laptop/Laptop Dell Inspiron 3521 33214G50_large.jpg',10,2),(64,NULL,NULL,'Dell/Laptop/Laptop Dell Inspiron 3521 33214G50_large1.jpg',10,2),(65,NULL,NULL,'Dell/Laptop/Laptop Dell Inspiron 3521 33214G50_large2.jpg',10,2),(66,NULL,NULL,'Dell/Laptop/Laptop Dell Inspiron 3521 33214G50_large3.jpg',10,2),(67,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 2420 2342G50W8_small.jpg',11,1),(68,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 2420 2342G50W8_large.jpg',11,2),(69,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 2420 2342G50W8_large1.jpg',11,2),(70,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 2420 2342G50W8_large2.jpg',11,2),(71,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 2420 2342G50W8_large3.jpg',11,2),(72,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 2420 33114G50_small.jpg',12,1),(73,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 2420 33114G50_large.jpg',12,2),(74,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 2420 33114G50_large1.jpg',12,2),(75,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 2420 33114G50_large2.jpg',12,2),(76,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 2420 33114G50_large3.jpg',12,2),(77,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 5470 54204G50G_small.jpg',13,1),(78,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 5470 54204G50G_large.jpg',13,2),(79,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 5470 54204G50G_large1.jpg',13,2),(80,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 5470 54204G50G_large2.jpg',13,2),(81,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 5470 54204G50G_large3.jpg',13,2),(82,NULL,NULL,'Acer/Tablet/Acer Iconia B1-A71 7 Wifi 16Gb_small.jpg',14,1),(83,NULL,NULL,'Acer/Tablet/Acer Iconia B1-A71 7  Wifi 16Gb_large.jpg',14,2),(84,NULL,NULL,'Acer/Tablet/Acer Iconia B1-A71 7  Wifi 16Gb_large1.jpg',14,2),(85,NULL,NULL,'Acer/Tablet/Acer Iconia B1-A71 7  Wifi 16Gb_large2.jpg',14,2),(86,NULL,NULL,'Acer/Tablet/Acer Iconia B1-A71 7  Wifi 16Gb_large3.jpg',14,2),(87,NULL,NULL,'Acer/Tablet/Acer Iconia Tab 8.1 Wifi 32Gb Win_small.jpg',15,1),(88,NULL,NULL,'Acer/Tablet/Acer Iconia Tab 8.1 Wifi 32Gb Win_large.jpg',15,2),(89,NULL,NULL,'Acer/Tablet/Acer Iconia Tab 8.1 Wifi 32Gb Win_large1.jpg',15,2),(90,NULL,NULL,'Acer/Tablet/Acer Iconia Tab 8.1 Wifi 32Gb Win_large2.jpg',15,2),(91,NULL,NULL,'Acer/Tablet/Acer Iconia Tab 8.1 Wifi 32Gb Win_large3.jpg',15,2),(92,NULL,NULL,'Apple/Tablet/Apple iPad Air Celllular 32GB_small.jpg',16,1),(93,NULL,NULL,'Apple/Tablet/Apple iPad Air Celllular 32GB_large.jpg',16,2),(94,NULL,NULL,'Apple/Tablet/Apple iPad Air Celllular 32GB_large1.jpg',16,2),(95,NULL,NULL,'Apple/Tablet/Apple iPad Air Celllular 32GB_large2.jpg',16,2),(96,NULL,NULL,'Apple/Tablet/Apple iPad Air Celllular 32GB_large3.jpg',16,2),(97,NULL,NULL,'Apple/Tablet/iPad mini Wi-Fi 16GB_small.jpg',17,1),(98,NULL,NULL,'Apple/Tablet/iPad mini Wi-Fi 16GB_large.jpg',17,2),(99,NULL,NULL,'Apple/Tablet/iPad mini Wi-Fi 16GB_large1.jpg',17,2),(100,NULL,NULL,'Apple/Tablet/iPad mini Wi-Fi 16GB_large2.jpg',17,2),(101,NULL,NULL,'Apple/Tablet/iPad mini Wi-Fi 16GB_large3.jpg',17,2),(102,NULL,NULL,'Accessory/120_Keyboard__Mouse_A4_TECH_3100N.jpg',18,1),(103,NULL,NULL,'Accessory/120_LogitechMk120.jpg',19,1),(104,NULL,NULL,'Accessory/120_Mouse_A4_TECH_G9_500.jpeg',20,1),(105,NULL,NULL,'Accessory/120_ZADEZ_M313.jpg',21,1);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1,'Apple'),(2,'Samsung'),(3,'Accer'),(4,'Dell'),(5,'Assus');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreateDate` date DEFAULT NULL,
  `ReceiverId` int(11) DEFAULT NULL,
  `CreatorId` int(11) DEFAULT NULL,
  `Total` int(11) DEFAULT NULL,
  `StateId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Order_Receiver1_idx` (`ReceiverId`),
  KEY `fk_Order_Account1_idx` (`CreatorId`),
  KEY `fk_Order_OrderState1_idx` (`StateId`),
  CONSTRAINT `fk_Order_Account1` FOREIGN KEY (`CreatorId`) REFERENCES `account` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_OrderState1` FOREIGN KEY (`StateId`) REFERENCES `orderstate` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Receiver1` FOREIGN KEY (`ReceiverId`) REFERENCES `receiver` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetail` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `OrderId` int(11) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `UnitPrice` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_OrderDetail_Order1_idx` (`OrderId`),
  KEY `fk_OrderDetail_Product1_idx` (`ProductId`),
  CONSTRAINT `fk_OrderDetail_Order1` FOREIGN KEY (`OrderId`) REFERENCES `order` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderDetail_Product1` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderstate`
--

DROP TABLE IF EXISTS `orderstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderstate` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstate`
--

LOCK TABLES `orderstate` WRITE;
/*!40000 ALTER TABLE `orderstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) DEFAULT NULL,
  `Overview` text,
  `Specification` longtext,
  `Price` int(11) DEFAULT NULL,
  `Discount` float DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `StateId` int(11) DEFAULT NULL,
  `TypeId` int(11) DEFAULT NULL,
  `manufacturerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Product_ProductState_idx` (`StateId`),
  KEY `fk_Product_ProductType1_idx` (`TypeId`),
  KEY `fk_Product_Manufacturer_idx` (`manufacturerId`),
  CONSTRAINT `fk_Product_Manufacturer` FOREIGN KEY (`manufacturerId`) REFERENCES `manufacturer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_ProductState` FOREIGN KEY (`StateId`) REFERENCES `productstate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_ProductType1` FOREIGN KEY (`TypeId`) REFERENCES `producttype` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Laptop Acer Aspire E1 532 29552G50Mn','Acer Aspire E1 532 với cấu hình mạnh, kiểu dáng hiện đại và năng động cùng mức giá rất hợp lý, sẽ là người bạn đồng hành lý tưởng trong công việc cũng như giải trí, với đặc điểm nổi bật:',NULL,6690000,0.09,NULL,3,1,3),(2,'Laptop Acer Aspire E1 571 2342G50Mn','Với mức giá rẻ, cấu hình vừa, màn hình rộng kết hợp bàn phím số chuyên dụng Acer Aspire E1 571 là một máy tính xách tay dành cho dân văn phòng hoặc những người có thu nhập thấp, muốn có một laptop để phục vụ công việc văn phòng của mình',NULL,8490000,0,NULL,3,1,3),(3,'Laptop Acer Aspire V5 471G 33224G50Ma','Acer Aspire V5 có thế mạnh về vẻ đẹp bề ngoài, tính di động cao nhờ thân máy được thiết kế khá mỏng, nhẹ kết hợp cùng cấu hình tốt bên trong và card màn hình rời giúp nâng cao chất lượng đồ họa',NULL,9990000,0,NULL,3,1,3),(4,'Laptop Acer Aspire V5 473 34014G50am','Bộ sản phẩm gồm: Máy, Pin, Sạc , Sách HD',NULL,10590000,0,NULL,1,1,3),(5,'Laptop Apple MacBook Air MD760',NULL,NULL,26990000,0,NULL,1,1,1),(6,'Laptop Asus K45A 2372G50','Với một mức giá tốt, cấu hình phải chăng, Asus K45A 2372G5  phù hợp cho dân văn phòng có thu nhập thấp hay những bạn sinh viên đang cần máy để học tập',NULL,9190000,0,NULL,1,1,5),(7,'Laptop Asus X451CA 2112G50','Asus X451CA là laptop giá rẻ rất hấp dẫn với kiểu dáng thiết kế thời trang, trẻ trung, cấu hình thế hệ mới của Intel, mang đến hiệu suất khá ổn định, thỏa mãn nhu cầu làm việc, học tập, xem phim, nghe nhạc và chơi game của bạn',NULL,6990000,0.06,NULL,1,1,5),(8,'Laptop Asus X451CA 10072G50',NULL,NULL,5990000,0.08,NULL,1,1,5),(9,'Laptop Asus X550CA 33212G50','Asus X550CA là một máy tính xách tay có mức giá vừa phải, cấu hình tốt, CPU tiết kiệm điện là lựa chọn phù họp cho người dùng văn phòng,',NULL,9790000,0,NULL,1,1,5),(10,'Laptop Dell Inspiron 3521 33214G50','Với cấu hình mạnh mẽ, mà lại có mức giá hợp lý cùng thiết kế chắc chắn, Dell Inspiron 3521 33214G50 sẽ là lựa chọn phù hợp với các bạn trẻ năng động cần trang bị một chiếc laptop hoạt động ổn định và dễ dàng sử dụng, thuận tiện mọi lúc mọi nơi',NULL,9990000,0.08,NULL,1,1,4),(11,'Laptop Dell Vostro 2420 2342G50W8','Dell Vostro 2420 là chiếc laptop chạy Windows 8 thích hợp với đa số người dùng, nhờ cấu hình mạnh mẽ và tốc độ ổn định, sản phẩm sẽ đáp ứng tốt các nhu cầu cá nhân từ giải trí nhẹ đến các công việc văn phòng hay chơi game',NULL,10690000,0.1,NULL,1,1,4),(12,'Laptop Dell Vostro 2420 33114G50','Dell Vostro V2420 là một sản phẩm tầm trung mang trong mình những nổi bật về cấu hình và khả năng giải trí tốt',NULL,9990000,NULL,NULL,1,1,4),(13,'Laptop Dell Vostro 5470 54204G50G','Tiếp nối thành công của dòng laptop Vostro 5460. Dell đã nâng cấp phiên bản mới với tên sản phẩm là Vostro 5470. Vẫn xu hướng laptop mỏng, nhẹ và được nâng cấp dùng Chip Intel thế hệ thứ 4 ( Haswell ) cho hiệu suất vượt trội cùng tiết kiệm pin tối đa',NULL,15490000,NULL,NULL,1,1,4),(14,'Acer Iconia B1-A71 7  Wifi 16Gb',NULL,NULL,2190000,0.13,NULL,1,2,3),(15,'Acer Iconia Tab 8.1 Wifi 32Gb Win','Acer Iconia W3 810 là một máy tính bảng có thiết kế đẹp, đa tính năng, bạn có thể giải trí hoặc có thể làm việc nhờ hệ điều hành Windows 8 và phần cứng có thể chuyển đổi sang laptop. Máy thích hợp cho những ai thường xuyên phải di chuyển, thích một thiết bị vừa có thể làm việc, vừa có thể giải trí',NULL,5990000,0.8,NULL,3,2,3),(16,'iPad Air Celllular 32GB','Pad Air ra mắt có những nâng cấp lớn về thiết kế, cấu hình, hệ điều hành so với các thế hệ iPad trước của Apple. Mang lại những trãi nghiệm đột phá đầy thú vị','\r <table cellpadding=\"10\" cellspacing=\"0\">\r   <tbody>\r     <tr bgcolor=\"#F3F3F3\">\r       <td>Màn hình</td>\r       <td>LED-backlit IPS LCD, 7.9 inch</td>\r     </tr>\r     <tr>\r       <td>Hệ điều hành</td>\r       <td>iOS 6</td>\r     </tr>\r     <tr bgcolor=\"#F3F3F3\">\r       <td>Vi xử lí CPU</td>\r       <td>Dual-core Cortex-A9, 1 GHz</td>\r     </tr>\r     <tr>\r       <td>RAM</td>\r       <td>512 MB</td>\r     </tr>\r     <tr bgcolor=\"#F3F3F3\">\r       <td>Bộ nhớ trong</td>\r       <td>16 GB</td>\r     </tr>\r     <tr>\r       <td>Camera</td>\r       <td>5 MP(2592 x 1944 pixels)</td>\r     </tr>\r     <tr bgcolor=\"#F3F3F3\">\r       <td>Kết nối</td>\r       <td>Có, Wifi chuẩn 802.11 b/g/n</td>\r     </tr>\r     <tr>\r       <td>Đàm thoại1</td>\r       <td>Không</td>\r     </tr>\r     <tr bgcolor=\"#F3F3F3\">\r       <td>Dung lượng pin</td>\r       <td>16.3Wh</td>\r     </tr>\r     <tr>\r       <td>Trọng lượng</td>\r       <td>312</td>\r     </tr>\r   </tbody>\r </table>\r ',1000000,NULL,NULL,3,2,1),(17,'iiPad mini Wi-Fi 16GB','Nếu là một tín đồ của trái táo khuyết thì iPad Mini là một sản phẩm mà bạn không thể không trải nghiệm bởi thiết kế nhỏ gọn cũng như hệ điều hành cực tốt trên nó','<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n  <tbody>\n    <tr>\n      <td rowspan=\"6\" valign=\"top\" bgcolor=\"#EAEAEA\"><div><strong>Màn hình</strong></div></td>\n      <td bgcolor=\"#F5F5F5\">Loại</td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2439_1\">LED-backlit IPS LCD</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Kích thước</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2440_1\">7.9 inch</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Độ phân giải</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c3019_1\">1024 x 768 pixels</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div onclick=\"ShowHelp(2441, 2);\" id=\"prop_2441\">Cảm ứng</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2441_1\">Điện dung,đa điểm</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Cảm biến</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c5019_1\">Gia tốc, Con quay hồi chuyển 3 chiều, La bàn</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Thông tin khác</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2443_1\">Màn hình 16 triệu màu</td>\n    </tr>\n    <tr>\n      <td rowspan=\"9\" valign=\"top\" bgcolor=\"#EAEAEA\"><div><strong>Vi xử lí &amp; Bộ nhớ</strong></div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"prop_2468\" onclick=\"ShowHelp(2468, 2);\">Loại CPU</td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2468_1\">Dual-core Cortex-A9</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Tốc độ</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2469_1\">1 GHz</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div onclick=\"ShowHelp(3059, 2);\" id=\"prop_3059\">Ram</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c3059_1\">512 MB</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Chipset</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c5039_1\">Apple A5X</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Xử lý đồ họa</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c5059_1\">PowerVR SGX543MP2</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div onclick=\"ShowHelp(3060, 2);\" id=\"prop_3060\">Bộ nhớ trong</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c3060_1\">16 GB</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div onclick=\"ShowHelp(2474, 2);\" id=\"prop_2474\">Thẻ nhớ ngoài</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2474_1\">Không</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Hỗ trợ thẻ tối đa</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c5079_1\">Không</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Thông tin khác</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c3040_1\">Không</td>\n    </tr>\n    <tr>\n      <td rowspan=\"11\" valign=\"top\" bgcolor=\"#EAEAEA\"><div><strong>Giải trí &amp; Ứng dụng</strong></div></td>\n      <td bgcolor=\"#F5F5F5\">Camera trước</td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2444_1\">1.2 MP</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Camera sau</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2445_1\">5 MP(2592 x 1944 pixels)</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Đặc tính camera</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c3020_1\">Tự động lấy nét,nhận diện khuôn mặt,HDR</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Quay phim</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2446_1\">Full HD 1080p(1920x1080 pixels)</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Xem phim</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2448_1\">MPEG-4, H.264, WAV, AAC</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Nghe nhạc</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c3021_1\">WAV, MP3, AAC</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Ghi âm</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c3022_1\">Không</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Radio FM</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c5099_1\">Không</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Văn phòng</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c3023_1\">Hỗ trợ Word, Excel, PPT,PDF, MSN</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Chỉnh sửa hình ảnh</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c3024_1\">Có</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Ứng dụng khác</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2481_1\">Lịch, Đồng hồ, Mail, Sổ tay</td>\n    </tr>\n    <tr>\n      <td rowspan=\"14\" valign=\"top\" bgcolor=\"#EAEAEA\"><div><strong>Kết nối dữ liệu</strong></div></td>\n      <td bgcolor=\"#F5F5F5\">Băng tần 2G</td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2458_1\">GSM 850/900/1800/1900</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Băng tần 3G</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2459_1\">HSDPA 850/900/1900/2100,băng tần 4G(LTE 700 MHz Class 17 / 2100)</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div onclick=\"ShowHelp(2460, 2);\" id=\"prop_2460\">Hỗ trợ sim</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2460_1\">Nano Sim</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Đàm thoại</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c3025_1\">Không</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Tin nhắn</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c5100_1\">Email, IM, iMessage, Push Email</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div onclick=\"ShowHelp(3099, 2);\" id=\"prop_3099\">3G</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c3099_1\">Có</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div onclick=\"ShowHelp(2454, 2);\" id=\"prop_2454\">WiFi</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2454_1\">802.11 b/g/n</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Trình duyệt</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c5101_1\">Safari</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div onclick=\"ShowHelp(2455, 2);\" id=\"prop_2455\">GPS</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2455_1\">A-GPS</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div onclick=\"ShowHelp(2456, 2);\" id=\"prop_2456\">Bluetooth</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2456_1\">4.0 with A2DP</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div onclick=\"ShowHelp(2451, 2);\" id=\"prop_2451\">HDMI</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2451_1\">Không</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Cổng USB</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2450_1\">Không</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Jack tai nghe</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c5119_1\">3.5 mm</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Kết nối khác</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2457_1\">Không</td>\n    </tr>\n    <tr>\n      <td rowspan=\"3\" valign=\"top\" bgcolor=\"#EAEAEA\"><div><strong>Nguồn</strong></div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"prop_2475\" onclick=\"ShowHelp(2475, 2);\">Loại pin</td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2475_1\">Lithium - Polymer</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Dung lượng pin</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c3039_1\">16.3Wh</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Thời gian sử dụng thường</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2476_1\">10 giờ</td>\n    </tr>\n    <tr>\n      <td rowspan=\"5\" valign=\"top\" bgcolor=\"#EAEAEA\"><div><strong>Thông tin chung</strong></div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"prop_2477\" onclick=\"ShowHelp(2477, 2);\">Hệ điều hành</td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2477_1\">iOS 6</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Nâng cấp</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c5139_1\">Đang cập nhật</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Ngôn ngữ</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2499_1\">Đa ngôn ngữ</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Kích thước (DxRxC)</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2479_1\">200 x 134,7 x 7,2</td>\n    </tr>\n    <tr>\n      <td bgcolor=\"#F5F5F5\"><div>Trọng lượng (g)</div></td>\n      <td bgcolor=\"#F5F5F5\" id=\"c2480_1\">312</td>\n    </tr>\n  </tbody>\n</table>',7790000,NULL,NULL,3,2,1),(18,'Mouse A4 TECH G9-500',NULL,NULL,370000,NULL,NULL,4,4,NULL),(19,'Mouse ZADEZ M313',NULL,NULL,400000,NULL,NULL,4,4,NULL),(20,'Keyboard + Mouse A4 TECH 3100N',NULL,NULL,300000,NULL,NULL,4,4,NULL),(21,'Keyboard + Mouse Logitech MK120',NULL,NULL,200000,NULL,NULL,4,4,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productstate`
--

DROP TABLE IF EXISTS `productstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productstate`
--

LOCK TABLES `productstate` WRITE;
/*!40000 ALTER TABLE `productstate` DISABLE KEYS */;
INSERT INTO `productstate` VALUES (1,'Còn hàng'),(2,'Hết hàng'),(3,'Mới'),(4,'Sale');
/*!40000 ALTER TABLE `productstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producttype`
--

DROP TABLE IF EXISTS `producttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producttype` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producttype`
--

LOCK TABLES `producttype` WRITE;
/*!40000 ALTER TABLE `producttype` DISABLE KEYS */;
INSERT INTO `producttype` VALUES (1,'Laptop'),(2,'Tablet'),(3,'Destop'),(4,'Accessory');
/*!40000 ALTER TABLE `producttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receiver`
--

DROP TABLE IF EXISTS `receiver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receiver` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(100) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Company` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receiver`
--

LOCK TABLES `receiver` WRITE;
/*!40000 ALTER TABLE `receiver` DISABLE KEYS */;
/*!40000 ALTER TABLE `receiver` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-11 13:19:51
