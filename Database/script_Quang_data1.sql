CREATE DATABASE  IF NOT EXISTS `bestbuy` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bestbuy`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: bestbuy
-- ------------------------------------------------------
-- Server version	5.6.14

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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire E1 532 29552G50Mn_small.jpg',1,1),(2,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire E1 532 29552G50Mn_large.jpg',1,2),(19,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire E1 532 29552G50Mn_large1.jpg',1,2),(20,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire E1 532 29552G50Mn_large2.jpg',1,2),(21,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire E1 532 29552G50Mn_large3.jpg',1,2),(22,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire E1 571 2342G50Mn_small.jpg',2,1),(23,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire E1 571 2342G50Mn_large1.jpg',2,2),(24,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire E1 571 2342G50Mn_large2.jpg',2,2),(25,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire E1 571 2342G50Mn_large3.jpg',2,2),(27,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire V5 471G 33224G50Ma_small.jpg',3,1),(28,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire V5 471G 33224G50Ma_large.jpg',3,2),(29,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire V5 471G 33224G50Ma_large1.jpg',3,2),(30,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire V5 471G 33224G50Ma_large2.jpg',3,2),(31,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire V5 471G 33224G50Ma_large3.jpg',3,2),(32,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire V5 473 34014G50am_small.jpg',4,1),(33,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire V5 473 34014G50am_large.jpg',4,2),(34,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire V5 473 34014G50am_large1.jpg',4,2),(35,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire V5 473 34014G50am_large2.jpg',4,2),(36,NULL,NULL,'Acer/Laptop/Laptop Acer Aspire V5 473 34014G50am_large3.jpg',4,2),(37,NULL,NULL,'Apple/Laptop/Laptop Apple MacBook Air MD760_small.jpg',5,1),(38,NULL,NULL,'Apple/Laptop/Laptop Apple MacBook Air MD760_large.jpg',5,2),(39,NULL,NULL,'Apple/Laptop/Laptop Apple MacBook Air MD760_large1.jpg',5,2),(40,NULL,NULL,'Apple/Laptop/Laptop Apple MacBook Air MD760_large2.jpg',5,2),(41,NULL,NULL,'Apple/Laptop/Laptop Apple MacBook Air MD760_large3.jpg',5,2),(42,NULL,NULL,'Assus/Laptop/Laptop Asus K45A 2372G50_small.jpg',6,1),(43,NULL,NULL,'Assus/Laptop/Laptop Asus K45A 2372G50_large.jpg',6,2),(44,NULL,NULL,'Assus/Laptop/Laptop Asus K45A 2372G50_large1.jpg',6,2),(45,NULL,NULL,'Assus/Laptop/Laptop Asus K45A 2372G50_large2.jpg',6,2),(46,NULL,NULL,'Assus/Laptop/Laptop Asus K45A 2372G50_large3.jpg',6,2),(47,NULL,NULL,'Assus/Laptop/Laptop Asus X451CA 2112G50_small.jpg',7,1),(48,NULL,NULL,'Assus/Laptop/Laptop Asus X451CA 2112G50_large.jpg',7,2),(49,NULL,NULL,'Assus/Laptop/Laptop Asus X451CA 2112G50_large1.jpg',7,2),(50,NULL,NULL,'Assus/Laptop/Laptop Asus X451CA 2112G50_large2.jpg',7,2),(51,NULL,NULL,'Assus/Laptop/Laptop Asus X451CA 2112G50_large3.jpg',7,2),(52,NULL,NULL,'Assus/Laptop/Laptop Asus X451CA 10072G50_small.jpg',8,1),(53,NULL,NULL,'Assus/Laptop/Laptop Asus X451CA 10072G50_large.jpg',8,2),(54,NULL,NULL,'Assus/Laptop/Laptop Asus X451CA 10072G50_large1.jpg',8,2),(55,NULL,NULL,'Assus/Laptop/Laptop Asus X451CA 10072G50_large2.jpg',8,2),(56,NULL,NULL,'Assus/Laptop/Laptop Asus X451CA 10072G50_large3.jpg',8,2),(57,NULL,NULL,'Assus/Laptop/Laptop Asus X550CA 33212G50_small.jpg',9,1),(58,NULL,NULL,'Assus/Laptop/Laptop Asus X550CA 33212G50_large.jpg',9,2),(59,NULL,NULL,'Assus/Laptop/Laptop Asus X550CA 33212G50_large1.jpg',9,2),(60,NULL,NULL,'Assus/Laptop/Laptop Asus X550CA 33212G50_large2.jpg',9,2),(61,NULL,NULL,'Assus/Laptop/Laptop Asus X550CA 33212G50_large3.jpg',9,2),(62,NULL,NULL,'Dell/Laptop/Laptop Dell Inspiron 3521 33214G50_small.jpg',10,1),(63,NULL,NULL,'Dell/Laptop/Laptop Dell Inspiron 3521 33214G50_large.jpg',10,2),(64,NULL,NULL,'Dell/Laptop/Laptop Dell Inspiron 3521 33214G50_large1.jpg',10,2),(65,NULL,NULL,'Dell/Laptop/Laptop Dell Inspiron 3521 33214G50_large2.jpg',10,2),(66,NULL,NULL,'Dell/Laptop/Laptop Dell Inspiron 3521 33214G50_large3.jpg',10,2),(67,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 2420 2342G50W8_small.jpg',11,1),(68,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 2420 2342G50W8_large.jpg',11,2),(69,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 2420 2342G50W8_large1.jpg',11,2),(70,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 2420 2342G50W8_large2.jpg',11,2),(71,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 2420 2342G50W8_large3.jpg',11,2),(72,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 2420 33114G50_small.jpg',12,1),(73,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 2420 33114G50_large.jpg',12,2),(74,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 2420 33114G50_large1.jpg',12,2),(75,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 2420 33114G50_large2.jpg',12,2),(76,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 2420 33114G50_large3.jpg',12,2),(77,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 5470 54204G50G_small.jpg',13,1),(78,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 5470 54204G50G_large.jpg',13,2),(79,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 5470 54204G50G_large1.jpg',13,2),(80,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 5470 54204G50G_large2.jpg',13,2),(81,NULL,NULL,'Dell/Laptop/Laptop Dell Vostro 5470 54204G50G_large3.jpg',13,2),(82,NULL,NULL,'Acer/Tablet/Acer Iconia B1-A71 7 Wifi 16Gb_small.jpg',14,1),(83,NULL,NULL,'Acer/Tablet/Acer Iconia B1-A71 7  Wifi 16Gb_large.jpg',14,2),(84,NULL,NULL,'Acer/Tablet/Acer Iconia B1-A71 7  Wifi 16Gb_large1.jpg',14,2),(85,NULL,NULL,'Acer/Tablet/Acer Iconia B1-A71 7  Wifi 16Gb_large2.jpg',14,2),(86,NULL,NULL,'Acer/Tablet/Acer Iconia B1-A71 7  Wifi 16Gb_large3.jpg',14,2),(87,NULL,NULL,'Acer/Tablet/Acer Iconia Tab 8.1 Wifi 32Gb Win_small.jpg',15,1),(88,NULL,NULL,'Acer/Tablet/Acer Iconia Tab 8.1 Wifi 32Gb Win_large.jpg',15,2),(89,NULL,NULL,'Acer/Tablet/Acer Iconia Tab 8.1 Wifi 32Gb Win_large1.jpg',15,2),(90,NULL,NULL,'Acer/Tablet/Acer Iconia Tab 8.1 Wifi 32Gb Win_large2.jpg',15,2),(91,NULL,NULL,'Acer/Tablet/Acer Iconia Tab 8.1 Wifi 32Gb Win_large3.jpg',15,2),(92,NULL,NULL,'Apple/Tablet/Apple iPad Air Celllular 32GB_small.jpg',16,1),(93,NULL,NULL,'Apple/Tablet/Apple iPad Air Celllular 32GB_large.jpg',16,2),(94,NULL,NULL,'Apple/Tablet/Apple iPad Air Celllular 32GB_large1.jpg',16,2),(95,NULL,NULL,'Apple/Tablet/Apple iPad Air Celllular 32GB_large2.jpg',16,2),(96,NULL,NULL,'Apple/Tablet/Apple iPad Air Celllular 32GB_large3.jpg',16,2),(97,NULL,NULL,'Apple/Tablet/iPad mini Wi-Fi 16GB_small.jpg',17,1),(98,NULL,NULL,'Apple/Tablet/iPad mini Wi-Fi 16GB_large.jpg',17,2),(99,NULL,NULL,'Apple/Tablet/iPad mini Wi-Fi 16GB_large1.jpg',17,2),(100,NULL,NULL,'Apple/Tablet/iPad mini Wi-Fi 16GB_large2.jpg',17,2),(101,NULL,NULL,'Apple/Tablet/iPad mini Wi-Fi 16GB_large3.jpg',17,2);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
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
  CONSTRAINT `fk_Product_ProductState` FOREIGN KEY (`StateId`) REFERENCES `productstate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_ProductType1` FOREIGN KEY (`TypeId`) REFERENCES `producttype` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Manufacturer` FOREIGN KEY (`manufacturerId`) REFERENCES `manufacturer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Laptop Acer Aspire E1 532 29552G50Mn','Acer Aspire E1 532 với cấu hình mạnh, kiểu dáng hiện đại và năng động cùng mức giá rất hợp lý, sẽ là người bạn đồng hành lý tưởng trong công việc cũng như giải trí, với đặc điểm nổi bật:',NULL,6690000,0.09,NULL,3,1,NULL),(2,'Laptop Acer Aspire E1 571 2342G50Mn','Với mức giá rẻ, cấu hình vừa, màn hình rộng kết hợp bàn phím số chuyên dụng Acer Aspire E1 571 là một máy tính xách tay dành cho dân văn phòng hoặc những người có thu nhập thấp, muốn có một laptop để phục vụ công việc văn phòng của mình',NULL,8490000,0,NULL,3,1,NULL),(3,'Laptop Acer Aspire V5 471G 33224G50Ma','Acer Aspire V5 có thế mạnh về vẻ đẹp bề ngoài, tính di động cao nhờ thân máy được thiết kế khá mỏng, nhẹ kết hợp cùng cấu hình tốt bên trong và card màn hình rời giúp nâng cao chất lượng đồ họa',NULL,9990000,0,NULL,3,1,NULL),(4,'Laptop Acer Aspire V5 473 34014G50am','Bộ sản phẩm gồm: Máy, Pin, Sạc , Sách HD',NULL,10590000,0,NULL,1,1,NULL),(5,'Laptop Apple MacBook Air MD760',NULL,NULL,26990000,0,NULL,1,1,NULL),(6,'Laptop Asus K45A 2372G50','Với một mức giá tốt, cấu hình phải chăng, Asus K45A 2372G5  phù hợp cho dân văn phòng có thu nhập thấp hay những bạn sinh viên đang cần máy để học tập',NULL,9190000,0,NULL,1,1,NULL),(7,'Laptop Asus X451CA 2112G50','Asus X451CA là laptop giá rẻ rất hấp dẫn với kiểu dáng thiết kế thời trang, trẻ trung, cấu hình thế hệ mới của Intel, mang đến hiệu suất khá ổn định, thỏa mãn nhu cầu làm việc, học tập, xem phim, nghe nhạc và chơi game của bạn',NULL,6990000,0.06,NULL,1,1,NULL),(8,'Laptop Asus X451CA 10072G50',NULL,NULL,5990000,0.08,NULL,1,1,NULL),(9,'Laptop Asus X550CA 33212G50','Asus X550CA là một máy tính xách tay có mức giá vừa phải, cấu hình tốt, CPU tiết kiệm điện là lựa chọn phù họp cho người dùng văn phòng,',NULL,9790000,0,NULL,1,1,NULL),(10,'Laptop Dell Inspiron 3521 33214G50','Với cấu hình mạnh mẽ, mà lại có mức giá hợp lý cùng thiết kế chắc chắn, Dell Inspiron 3521 33214G50 sẽ là lựa chọn phù hợp với các bạn trẻ năng động cần trang bị một chiếc laptop hoạt động ổn định và dễ dàng sử dụng, thuận tiện mọi lúc mọi nơi',NULL,9990000,0.08,NULL,1,1,NULL),(11,'Laptop Dell Vostro 2420 2342G50W8','Dell Vostro 2420 là chiếc laptop chạy Windows 8 thích hợp với đa số người dùng, nhờ cấu hình mạnh mẽ và tốc độ ổn định, sản phẩm sẽ đáp ứng tốt các nhu cầu cá nhân từ giải trí nhẹ đến các công việc văn phòng hay chơi game',NULL,10690000,0.1,NULL,1,1,NULL),(12,'Laptop Dell Vostro 2420 33114G50','Dell Vostro V2420 là một sản phẩm tầm trung mang trong mình những nổi bật về cấu hình và khả năng giải trí tốt',NULL,9990000,NULL,NULL,1,1,NULL),(13,'Laptop Dell Vostro 5470 54204G50G','Tiếp nối thành công của dòng laptop Vostro 5460. Dell đã nâng cấp phiên bản mới với tên sản phẩm là Vostro 5470. Vẫn xu hướng laptop mỏng, nhẹ và được nâng cấp dùng Chip Intel thế hệ thứ 4 ( Haswell ) cho hiệu suất vượt trội cùng tiết kiệm pin tối đa',NULL,15490000,NULL,NULL,1,1,NULL),(14,'Acer Iconia B1-A71 7  Wifi 16Gb',NULL,NULL,2190000,0.13,NULL,1,1,NULL),(15,'Acer Iconia Tab 8.1 Wifi 32Gb Win','Acer Iconia W3 810 là một máy tính bảng có thiết kế đẹp, đa tính năng, bạn có thể giải trí hoặc có thể làm việc nhờ hệ điều hành Windows 8 và phần cứng có thể chuyển đổi sang laptop. Máy thích hợp cho những ai thường xuyên phải di chuyển, thích một thiết bị vừa có thể làm việc, vừa có thể giải trí',NULL,5990000,0.8,NULL,1,1,NULL),(16,'Máy tính bảng Apple iPad Air Celllular 32GB','Pad Air ra mắt có những nâng cấp lớn về thiết kế, cấu hình, hệ điều hành so với các thế hệ iPad trước của Apple. Mang lại những trãi nghiệm đột phá đầy thú vị',NULL,1000000,NULL,NULL,1,1,NULL),(17,'iiPad mini Wi-Fi 16GB','Nếu là một tín đồ của trái táo khuyết thì iPad Mini là một sản phẩm mà bạn không thể không trải nghiệm bởi thiết kế nhỏ gọn cũng như hệ điều hành cực tốt trên nó',NULL,7790000,NULL,NULL,1,1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productstate`
--

LOCK TABLES `productstate` WRITE;
/*!40000 ALTER TABLE `productstate` DISABLE KEYS */;
INSERT INTO `productstate` VALUES (1,'Còn hàng'),(2,'Hết hàng'),(3,'Mới');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producttype`
--

LOCK TABLES `producttype` WRITE;
/*!40000 ALTER TABLE `producttype` DISABLE KEYS */;
INSERT INTO `producttype` VALUES (1,'Laptop'),(2,'Tablet');
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

-- Dump completed on 2013-12-09 16:53:01
