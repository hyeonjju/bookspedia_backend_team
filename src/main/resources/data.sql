-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: bookipedia.czeuaegaqnzs.ap-northeast-2.rds.amazonaws.com    Database: book
-- ------------------------------------------------------
-- Server version	8.0.35

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `CATEGORY`
--

DROP TABLE IF EXISTS `CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CATEGORY` (
                            `id` bigint NOT NULL AUTO_INCREMENT,
                            `name` varchar(20) DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORY`
--

LOCK TABLES `CATEGORY` WRITE;
/*!40000 ALTER TABLE `CATEGORY` DISABLE KEYS */;
INSERT INTO `CATEGORY` VALUES (1,'생활'),(2,'개그'),(3,'무협'),(4,'로맨스'),(5,'판타지');
/*!40000 ALTER TABLE `CATEGORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHAT`
--

DROP TABLE IF EXISTS `CHAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CHAT` (
                        `id` bigint NOT NULL AUTO_INCREMENT,
                        `livetalk_id` int DEFAULT NULL,
                        `member_id` bigint DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        KEY `FK4mqsur6b1rope60c0r111ltr8` (`livetalk_id`),
                        KEY `FKtko756cg9exnbfbeq64wmfj6e` (`member_id`),
                        CONSTRAINT `FK4mqsur6b1rope60c0r111ltr8` FOREIGN KEY (`livetalk_id`) REFERENCES `LIVETALK` (`id`),
                        CONSTRAINT `FKtko756cg9exnbfbeq64wmfj6e` FOREIGN KEY (`member_id`) REFERENCES `MEMBER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHAT`
--

LOCK TABLES `CHAT` WRITE;
/*!40000 ALTER TABLE `CHAT` DISABLE KEYS */;
/*!40000 ALTER TABLE `CHAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COLLECTION`
--

DROP TABLE IF EXISTS `COLLECTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COLLECTION` (
                              `id` bigint NOT NULL AUTO_INCREMENT,
                              `collectionTitle` varchar(200) DEFAULT NULL,
                              `createdAt` datetime(6) NOT NULL,
                              `updatedAt` datetime(6) DEFAULT NULL,
                              `Content_id` bigint DEFAULT NULL,
                              `Member_id` bigint DEFAULT NULL,
                              PRIMARY KEY (`id`),
                              KEY `FKctxj7t69rlfi1li6lpst3lb6b` (`Content_id`),
                              KEY `FKmltrm30xe5pr7qn8k5fby8ds6` (`Member_id`),
                              CONSTRAINT `FKctxj7t69rlfi1li6lpst3lb6b` FOREIGN KEY (`Content_id`) REFERENCES `CONTENT` (`id`),
                              CONSTRAINT `FKmltrm30xe5pr7qn8k5fby8ds6` FOREIGN KEY (`Member_id`) REFERENCES `MEMBER` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COLLECTION`
--

LOCK TABLES `COLLECTION` WRITE;
/*!40000 ALTER TABLE `COLLECTION` DISABLE KEYS */;
INSERT INTO `COLLECTION` VALUES (1,'심심할 때 보기 좋은 작품들','2024-02-02 05:54:21.222332','2024-02-02 05:54:21.222337',1,15),(2,'우울할 때 보기 좋은 웃긴 작품','2024-02-03 16:04:23.672772','2024-02-03 16:04:23.672783',2,21),(3,'로맨스 작품들','2024-02-03 16:04:56.860100','2024-02-03 16:04:56.860105',1,21),(4,'심심할 때 보기 좋은 작품들','2024-02-06 06:13:14.237455','2024-02-06 06:13:14.237470',2,1),(5,'abc','2024-02-06 06:23:15.979547','2024-02-06 06:23:15.979551',1,1),(6,'abc','2024-02-06 06:23:19.780719','2024-02-06 06:23:19.780723',2,1),(7,'조석 웹툰 모음집','2024-02-06 06:56:25.806049','2024-02-06 06:56:25.806053',1,15);
/*!40000 ALTER TABLE `COLLECTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMMENT`
--

DROP TABLE IF EXISTS `COMMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMMENT` (
                           `id` bigint NOT NULL AUTO_INCREMENT,
                           `comment` varchar(200) DEFAULT NULL,
                           `rate` int DEFAULT NULL,
                           `content_id` bigint DEFAULT NULL,
                           `member_id` bigint DEFAULT NULL,
                           PRIMARY KEY (`id`),
                           KEY `FKjlj3ly0vf9d3od68c4wpwumg2` (`content_id`),
                           KEY `FKrsiylx1pb16nh11306rpxmtcb` (`member_id`),
                           CONSTRAINT `FKjlj3ly0vf9d3od68c4wpwumg2` FOREIGN KEY (`content_id`) REFERENCES `CONTENT` (`id`),
                           CONSTRAINT `FKrsiylx1pb16nh11306rpxmtcb` FOREIGN KEY (`member_id`) REFERENCES `MEMBER` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMMENT`
--

LOCK TABLES `COMMENT` WRITE;
/*!40000 ALTER TABLE `COMMENT` DISABLE KEYS */;
INSERT INTO `COMMENT` VALUES (1,'asdfsadv',4,1,1),(2,'asdfsadv',4,1,1),(4,'테스트1',3,1,1),(5,'테스트1',3,1,1),(6,'우와와와와',4,1,1),(7,'우와와와와1',3,1,1),(8,'우와와와와2',5,1,1),(9,'우와와와와2',5,1,1),(10,'아주 재미있어요',4,1,15),(11,'최고!',5,2,15),(12,'123213213',3,2,1),(13,'123213213',4,2,1),(14,'123213213',4,3,1),(15,'12321222222213',1,3,1),(16,'123',1,4,1),(19,'sdsd',5,3,1),(20,'asdfasd',6,3,1),(21,'asdf',4,3,1),(22,'asdasd',7,3,1),(23,'asdasd',5,3,1),(24,'asdasdasd',5,4,1),(25,'asdasd',3,4,1),(26,'asdasd',5,3,1),(27,'123213',3,4,1),(28,'sdsdsdsd',6,4,1),(29,'넘 재밌어요',5,20,15),(30,'넘 재밌어요',5,4,21),(31,'너무 재밌어요 ',7,5,1),(32,'너무 재밌어요',9,6,1);
/*!40000 ALTER TABLE `COMMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CONTENT`
--

DROP TABLE IF EXISTS `CONTENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CONTENT` (
                           `id` bigint NOT NULL AUTO_INCREMENT,
                           `classify` bit(1) DEFAULT NULL,
                           `name` varchar(20) DEFAULT NULL,
                           `Category_id` bigint DEFAULT NULL,
                           `Writer_id` bigint DEFAULT NULL,
                           PRIMARY KEY (`id`),
                           KEY `FKc7no8ki98eiyc38sq5nxpm257` (`Category_id`),
                           KEY `FK7aal9qyraaxpvolhqb0h3suf9` (`Writer_id`),
                           CONSTRAINT `FK7aal9qyraaxpvolhqb0h3suf9` FOREIGN KEY (`Writer_id`) REFERENCES `WRITER` (`id`),
                           CONSTRAINT `FKc7no8ki98eiyc38sq5nxpm257` FOREIGN KEY (`Category_id`) REFERENCES `CATEGORY` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONTENT`
--

LOCK TABLES `CONTENT` WRITE;
/*!40000 ALTER TABLE `CONTENT` DISABLE KEYS */;
INSERT INTO `CONTENT` VALUES (1,_binary '','마음의 소리2',2,1),(2,_binary '','마루는 강쥐',2,2),(3,_binary '','하루만 네가 되고 싶어',4,5),(4,_binary '','집이 없어',2,4),(5,_binary '','신의탑',5,6),(6,_binary '','어린이집 다니는 구나',1,7),(7,_binary '','12시네점심',1,1),(15,_binary '','백수세끼',1,8),(16,_binary '','화산귀환',3,9),(17,_binary '','전지적 독자 시점',5,10),(18,_binary '','조조코믹스',4,11),(19,_binary '','선천적 얼간이들',1,12),(20,_binary '\0','환생무제',3,13),(21,_binary '','대학원 탈출일지',1,3),(22,_binary '','순정말고 순종',4,15),(25,_binary '\0','파란의 상속녀',4,16),(26,_binary '\0','사신빙의',3,17),(27,_binary '\0','소상단에 간 천마',3,18),(28,_binary '\0','천마신교 최강 막내제자',3,19),(29,_binary '\0','재능만렙 플레이어',5,20),(30,_binary '\0','환생한 암살자는 검술 천재',5,21),(31,_binary '\0','블랙기업조선',5,22),(32,_binary '\0','마법학교 마법사로 살아가는 법',5,23);
/*!40000 ALTER TABLE `CONTENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChatMessageEntity`
--

DROP TABLE IF EXISTS `ChatMessageEntity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ChatMessageEntity` (
                                     `id` bigint NOT NULL AUTO_INCREMENT,
                                     `message` varchar(255) DEFAULT NULL,
                                     `roomName` varchar(255) DEFAULT NULL,
                                     `sender` varchar(255) DEFAULT NULL,
                                     PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChatMessageEntity`
--

LOCK TABLES `ChatMessageEntity` WRITE;
/*!40000 ALTER TABLE `ChatMessageEntity` DISABLE KEYS */;
INSERT INTO `ChatMessageEntity` VALUES (38,'님이 입장했습니다.','마루는 강쥐',''),(39,'님이 입장했습니다.','마루는 강쥐',''),(40,'안녕하세요!','마루는 강쥐',''),(41,'안녕하세요~','마루는 강쥐',''),(42,'님이 입장했습니다.','마루는 강쥐',''),(43,'안녕','마루는 강쥐',''),(44,'님이 입장했습니다.','마루는 강쥐',''),(45,'안녕','마루는 강쥐',''),(46,'님이 입장했습니다.','마루는 강쥐',''),(47,'ddd','마루는 강쥐',''),(48,'ddd','마루는 강쥐',''),(49,'ddd','마루는 강쥐','');
/*!40000 ALTER TABLE `ChatMessageEntity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChatRooms`
--

DROP TABLE IF EXISTS `ChatRooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ChatRooms` (
                             `id` bigint NOT NULL AUTO_INCREMENT,
                             `roomId` varchar(255) DEFAULT NULL,
                             `roomName` varchar(255) DEFAULT NULL,
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChatRooms`
--

LOCK TABLES `ChatRooms` WRITE;
/*!40000 ALTER TABLE `ChatRooms` DISABLE KEYS */;
INSERT INTO `ChatRooms` VALUES (1,'c0464e37-e498-43a4-bcc6-7d1600946e33','마루는 강쥐'),(3,'608c337e-f35c-4ba4-9117-6430bdd3563e','집이 없어'),(6,'aa7d28c5-c5d3-46f4-ab0d-187e40529bf4','');
/*!40000 ALTER TABLE `ChatRooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContentImage`
--

DROP TABLE IF EXISTS `ContentImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ContentImage` (
                                `id` bigint NOT NULL AUTO_INCREMENT,
                                `filename` varchar(255) DEFAULT NULL,
                                `Content_id` bigint DEFAULT NULL,
                                PRIMARY KEY (`id`),
                                KEY `FKogdwwv1idj128q4pu2fxigwf0` (`Content_id`),
                                CONSTRAINT `FKogdwwv1idj128q4pu2fxigwf0` FOREIGN KEY (`Content_id`) REFERENCES `CONTENT` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContentImage`
--

LOCK TABLES `ContentImage` WRITE;
/*!40000 ALTER TABLE `ContentImage` DISABLE KEYS */;
INSERT INTO `ContentImage` VALUES (1,'https://image-comic.pstatic.net/webtoon/814543/thumbnail/thumbnail_IMAG21_df84a681-b7ef-4dda-8cef-25b219d35e3e.jpg',1),(2,'https://image-comic.pstatic.net/webtoon/796152/thumbnail/thumbnail_IMAG21_26b9c1d8-ca2d-4fc7-87ea-a3334634236a.jpg',2),(3,'https://image-comic.pstatic.net/webtoon/738487/thumbnail/thumbnail_IMAG21_e7291231-deea-4bc8-9479-ed6dbe42dc43.jpg',3),(4,'https://image-comic.pstatic.net/webtoon/721433/thumbnail/thumbnail_IMAG21_e14d8057-378c-4208-8531-e82e1dce8dd6.jpg',4),(5,'https://image-comic.pstatic.net/webtoon/183559/thumbnail/thumbnail_IMAG21_5f3fec31-5c95-4afe-a73f-3046288edb47.jpg',5),(6,'https://image-comic.pstatic.net/webtoon/817945/thumbnail/thumbnail_IMAG21_120ad315-8518-4430-bb30-739654b49635.jpg',6),(7,'https://image-comic.pstatic.net/webtoon/819217/thumbnail/thumbnail_IMAG21_2dd78d6c-ba3d-4d1d-8b98-30c13d90144d.jpg',7),(15,'https://image-comic.pstatic.net/webtoon/733074/thumbnail/thumbnail_IMAG21_80df3e76-47af-4007-b57c-e8f2830835e5.jpg',15),(16,'https://image-comic.pstatic.net/webtoon/769209/thumbnail/thumbnail_IMAG21_3511dcdd-6e33-4171-8839-598d6d266215.jpg',16),(17,'https://image-comic.pstatic.net/webtoon/747269/thumbnail/thumbnail_IMAG21_aabd9952-ff45-47a2-a543-33f19a5c6708.jpg',17),(18,'https://image-comic.pstatic.net/webtoon/774862/thumbnail/thumbnail_IMAG21_39b7c327-7234-4636-b608-401478abede3.jpg',18),(19,'https://image-comic.pstatic.net/webtoon/478261/thumbnail/thumbnail_IMAG21_7fbd8610-0a97-40e3-9c63-101ea07fc4b4.jpg',19),(20,'https://dn-img-page.kakao.com/download/resource?kid=3kNFd/hAd4B5riIr/y7Dkdkk8I1NEr3O9MaXwKK&filename=th3',20),(21,'https://image-comic.pstatic.net/webtoon/790713/thumbnail/thumbnail_IMAG21_3919364435331003700.jpg',21),(22,'https://image-comic.pstatic.net/webtoon/761461/thumbnail/thumbnail_IMAG21_e3c857a7-900b-4085-969a-75d9127b5a38.jpg',22),(25,'https://novel-phinf.pstatic.net/20231030_287/novel_1698659530649THckg_JPEG/ED8C8CEB9E80EC9D98%2BEC8381EC868DEB8580_ED919CECA78028EC.jpg?type=f200_276_2',25),(26,'https://novel-phinf.pstatic.net/20210930_158/novel_16329814613009dIdi_JPEG/EC82ACEC8BA0EBB999EC9D98_650_855_EC9BB9EC868CEC84A4EC9AA.jpg?type=f200_276_2',26),(27,'https://novel-phinf.pstatic.net/20230728_126/novel_1690530871238MtgiN_JPEG/EB85B8ED8380EC9DB4ED8B80_EC868CEC8381EB8BA8EC9790%2BEAB0.jpg?type=f200_276_2',27),(28,'https://novel-phinf.pstatic.net/20231130_277/novel_1701339573250F7BeR_JPEG/EB84A4EC9DB4EBB284_ECB29CEBA788EC8BA0EAB590-ECB59CEAB0.jpg?type=f200_276_2',28),(29,'https://dn-img-page.kakao.com/download/resource?kid=6ZejE/hAd4lBeCMR/u5cMxVQf41fMR44KzoNoMk&filename=th3',29),(30,'https://dn-img-page.kakao.com/download/resource?kid=qdtIY/hAd47cbVkJ/6KLhgHaYkntiD77HKe61pk&filename=th3',30),(31,'https://dn-img-page.kakao.com/download/resource?kid=bhky3V/hzCtbPocMt/2ZFnyedohYqxqbz6VYw70K&filename=th3',31),(32,'https://dn-img-page.kakao.com/download/resource?kid=XBAjG/hzR1XP2gzo/dKM09SlnZG313hl9WkLmr0&filename=th3',32);
/*!40000 ALTER TABLE `ContentImage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMAIL_AUTHENTICATION`
--

DROP TABLE IF EXISTS `EMAIL_AUTHENTICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMAIL_AUTHENTICATION` (
                                        `id` bigint NOT NULL AUTO_INCREMENT,
                                        `email` varchar(50) DEFAULT NULL,
                                        `jwt` varchar(200) DEFAULT NULL,
                                        `uuid` varchar(50) DEFAULT NULL,
                                        PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMAIL_AUTHENTICATION`
--

LOCK TABLES `EMAIL_AUTHENTICATION` WRITE;
/*!40000 ALTER TABLE `EMAIL_AUTHENTICATION` DISABLE KEYS */;
INSERT INTO `EMAIL_AUTHENTICATION` VALUES (33,'kkey1230@naver.com','eyJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6ImtrZXkxMjMwQG5hdmVyLmNvbSIsImlhdCI6MTcwNzE3OTUyNywiZXhwIjoxMDI0MzA3NzE4Mjg2MjAwfQ.iXzOu8bWtaJ_ONbOiKPgGR79RG0FUWxzUYuYJqLSy5I','3a09ed57-a2fb-4378-9e19-798fe7687dd1'),(34,'juhyeon0928@gmail.com','eyJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Imp1aHllb24wOTI4QGdtYWlsLmNvbSIsImlhdCI6MTcwNzE4MDIxNSwiZXhwIjoxMDI0MzA4MTMwODkxMjAwfQ.oi0graC9EGxHdkpWuoG9oASpQLQpYXjcFkIz_iGYmvo','a167056b-826c-413e-a9d6-9cbe3c5b20d2'),(35,'ininu@naver.com','eyJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6ImluaW51QG5hdmVyLmNvbSIsImlhdCI6MTcwNzE4MzU3NCwiZXhwIjoxMDI0MzEwMTQ2NDAxNjAwfQ.vnQR8ethXgtojljU_OtY-z7VIhNBSziGRiGk2aFjjiU','38e5216d-ef4e-493d-97ee-b065fbf77021'),(38,'juhyeon0928@gmail.com','eyJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Imp1aHllb24wOTI4QGdtYWlsLmNvbSIsImlhdCI6MTcwNzIwMTg5MSwiZXhwIjoxMDI0MzIxMTM2NjM3NjAwfQ.w9pyoZnkn7MYL5boBw_FKWgGM_9BrkwNk3pw8bRF45g','62186844-fb59-4568-a1d6-45ff0883288d'),(39,'ininu@naver.com','eyJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6ImluaW51QG5hdmVyLmNvbSIsImlhdCI6MTcwNzIwMTk5MCwiZXhwIjoxMDI0MzIxMTk2MjkyNjAwfQ.rhhdVSG9uHKA3R60hRi6-Bo5r5qXKOeaxqXNzq_AKuM','24a5cddb-4a60-4497-91ac-370b2e043422'),(40,'kimhyunkyun456@gmail.com','eyJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6ImtpbWh5dW5reXVuNDU2QGdtYWlsLmNvbSIsImlhdCI6MTcwNzIwMjEyNSwiZXhwIjoxMDI0MzIxMjc2OTY5ODAwfQ.KPGRPpkxP1l6r9SD1z64CIScuC_psoE9e1EEAjkFtJo','bb3967ab-6c03-4791-9638-384b06cd1a90');
/*!40000 ALTER TABLE `EMAIL_AUTHENTICATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FOLLOW`
--

DROP TABLE IF EXISTS `FOLLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FOLLOW` (
                          `id` bigint NOT NULL AUTO_INCREMENT,
                          `follower_id` bigint DEFAULT NULL,
                          `following_id` bigint DEFAULT NULL,
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FOLLOW`
--

LOCK TABLES `FOLLOW` WRITE;
/*!40000 ALTER TABLE `FOLLOW` DISABLE KEYS */;
INSERT INTO `FOLLOW` VALUES (1,15,1),(2,21,15),(3,2,1),(4,15,NULL),(5,15,NULL),(6,15,NULL),(7,15,NULL),(8,21,NULL);
/*!40000 ALTER TABLE `FOLLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LIVETALK`
--

DROP TABLE IF EXISTS `LIVETALK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LIVETALK` (
                            `id` int NOT NULL AUTO_INCREMENT,
                            `chatFrom` varchar(255) DEFAULT NULL,
                            `contentTitle` varchar(200) DEFAULT NULL,
                            `time` datetime(6) DEFAULT NULL,
                            `content_id` bigint DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            KEY `FKkdp75ioaummywb8er99fr2agf` (`content_id`),
                            CONSTRAINT `FKkdp75ioaummywb8er99fr2agf` FOREIGN KEY (`content_id`) REFERENCES `CONTENT` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LIVETALK`
--

LOCK TABLES `LIVETALK` WRITE;
/*!40000 ALTER TABLE `LIVETALK` DISABLE KEYS */;
/*!40000 ALTER TABLE `LIVETALK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MEMBER`
--

DROP TABLE IF EXISTS `MEMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MEMBER` (
                          `id` bigint NOT NULL AUTO_INCREMENT,
                          `authority` varchar(255) DEFAULT NULL,
                          `email` varchar(30) NOT NULL,
                          `image` varchar(200) DEFAULT NULL,
                          `nickname` varchar(20) DEFAULT NULL,
                          `password` varchar(100) NOT NULL,
                          `status` bit(1) DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          UNIQUE KEY `UK_c289a9yd2r43ketljjwtt16w7` (`email`),
                          UNIQUE KEY `UK_k856iwc11mlmy2kavyr2qwidg` (`image`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEMBER`
--

LOCK TABLES `MEMBER` WRITE;
/*!40000 ALTER TABLE `MEMBER` DISABLE KEYS */;
INSERT INTO `MEMBER` VALUES (1,'ROLE_USER','kimhyunkyun123@gmail.com','https://bookipedia.s3.ap-northeast-2.amazonaws.com/2024/02/05/29f3c159-92b9-467c-99bb-e303df6c87e5_cat1.webp','hkkim0001','{bcrypt}$2a$10$QUuYybq5xVR3pAgdzg4cQOf2j8GTXaMCorUhR8owLoWD8WqnhgnA6',_binary ''),(15,'ROLE_USER','guswn2801@gmail.com','https://bookipedia.s3.ap-northeast-2.amazonaws.com/2024/02/05/9ff2d031-bafd-4e37-ba87-a1bb3268e215_test.png','hyeonju','{bcrypt}$2a$10$s8drXFnVFQC9GdvtNFEq3eCT9IKbnpXyQ30sNKLYGcYahRG2GISV2',_binary ''),(21,'ROLE_USER','guswn1281@naver.com','https://bookipedia.s3.ap-northeast-2.amazonaws.com/2024/02/02/c47cd8d7-7327-4236-aea4-a83c62af1b93_img.jpeg','닉네임입니다','{bcrypt}$2a$10$oIyZ9tYVMd3DjW3aBj5OreJZ2bRK4BlHNlI.epL5oR0MNCApovxFq',_binary ''),(44,'ROLE_USER','kkey1230@naver.com',NULL,NULL,'{bcrypt}$2a$10$rOxlxp26tnBgpN0/6FBKN.PHcmqklI.3/EAxMkLVzAAeg6Icj4aHy',_binary ''),(50,'ROLE_USER','juhyeon0928@gmail.com',NULL,'주현','{bcrypt}$2a$10$gLgJwy0cRqUFlxyeEz.0hu42hgadSeSY2k05OXeihQQ03vz/8rCha',_binary ''),(51,'ROLE_USER','ininu@naver.com',NULL,'현주','{bcrypt}$2a$10$LcLE.YhhhQ32kCdNkdOxQOkDc6SH5QOYZ.qPdsYhF7nWeIVoT//U.',_binary ''),(52,'ROLE_USER','kimhyunkyun456@gmail.com',NULL,NULL,'{bcrypt}$2a$10$Ld1pnyfUoqpwez77yAIj0.Yk.ty3yDFJne1j3hPoM20okOdLOOm0G',_binary '');
/*!40000 ALTER TABLE `MEMBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MEMBERSHIP`
--

DROP TABLE IF EXISTS `MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MEMBERSHIP` (
                              `id` bigint NOT NULL AUTO_INCREMENT,
                              `authority` varchar(255) DEFAULT NULL,
                              `membershipPrice` int DEFAULT NULL,
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEMBERSHIP`
--

LOCK TABLES `MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WRITER`
--

DROP TABLE IF EXISTS `WRITER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WRITER` (
                          `id` bigint NOT NULL AUTO_INCREMENT,
                          `name` varchar(255) DEFAULT NULL,
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WRITER`
--

LOCK TABLES `WRITER` WRITE;
/*!40000 ALTER TABLE `WRITER` DISABLE KEYS */;
INSERT INTO `WRITER` VALUES (1,'조석'),(2,'모죠'),(3,'요다'),(4,'와난'),(5,'삼'),(6,'SIU'),(7,'구나'),(8,'치즈'),(9,'LICO / 비가'),(10,'UMI / 슬리피-C / 싱숑'),(11,'이동건'),(12,'가스파드'),(13,'하현준'),(15,'슈안'),(16,'해아한'),(17,'이루성'),(18,'손님온다'),(19,'리진'),(20,'비츄'),(21,'글개미'),(22,'국뽕'),(23,'글쓰는기계');
/*!40000 ALTER TABLE `WRITER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'book'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-08 15:26:47
