-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.8-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.1.0.6212
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE USER 'imp'@'localhost' IDENTIFIED BY 'root';
grant all privileges on imp.* to 'imp'@'localhost';

-- imp 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `imp` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `imp`;

-- 테이블 imp.authorities 구조 내보내기
CREATE TABLE IF NOT EXISTS `authorities` (
  `AUTHORITIES_MEMBER_ID` varchar(15) NOT NULL,
  `AUTHORITIES_MEMBER` varchar(20) NOT NULL,
  `AUTHORITIES_MANAGER` varchar(20) DEFAULT NULL,
  `AUTHORITIES_ADMIN` varchar(20) DEFAULT NULL,
  KEY `FK_AUTHORITIES_MEMBER_ID` (`AUTHORITIES_MEMBER_ID`),
  CONSTRAINT `FK_AUTHORITIES_MEMBER_ID` FOREIGN KEY (`AUTHORITIES_MEMBER_ID`) REFERENCES `member` (`MEMBER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 imp.authorities:~3 rows (대략적) 내보내기
DELETE FROM `authorities`;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` (`AUTHORITIES_MEMBER_ID`, `AUTHORITIES_MEMBER`, `AUTHORITIES_MANAGER`, `AUTHORITIES_ADMIN`) VALUES
	('tester', 'ROLE_MEMBER', 'ROLE_MANAGER', 'ROLE_ADMIN'),
	('member', 'ROLE_MEMBER', NULL, NULL),
	('admin1', 'ROLE_MEMBER', 'ROLE_MANAGER', 'ROLE_ADMIN');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;

-- 테이블 imp.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `MEMBER_ID` varchar(15) NOT NULL,
  `MEMBER_PW` char(60) NOT NULL,
  `MEMBER_NAME` varchar(20) NOT NULL,
  `MEMBER_REGDATE` date NOT NULL,
  `MEMBER_EMAIL` varchar(40) NOT NULL,
  `MEMBER_TEL` char(11) NOT NULL,
  `MEMBER_IMG_PATH` varchar(200) DEFAULT NULL,
  `MEMBER_IMG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MEMBER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 imp.member:~3 rows (대략적) 내보내기
DELETE FROM `member`;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`MEMBER_ID`, `MEMBER_PW`, `MEMBER_NAME`, `MEMBER_REGDATE`, `MEMBER_EMAIL`, `MEMBER_TEL`, `MEMBER_IMG_PATH`, `MEMBER_IMG`) VALUES
	('admin1', '$2a$10$5y8mvPeqLcAKIRO4rVaT0OSaL0rLW2rJo9/knxiUQ2QQlE4dX8Q5S', '관리자', '2021-01-25', 'lars523@naver.com', '01011111111', NULL, NULL),
	('member', '$2a$10$DvcSzcpsScg9.3h1GP4aausDkVZSTP16El0rBEKpt4lk7YKg0at8K', '멤버님', '2021-01-25', 'lars523@naver.com', '01011111111', NULL, NULL),
	('tester', '$2a$10$LO10M5Bg58jvW/rePsQeOu8SukAk8Btw8DOwu2GTbVJyCjPjeSIqW', '테스터', '2021-01-24', 'lars523@naver.com', '01011111111', NULL, NULL);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- 테이블 imp.photo 구조 내보내기
CREATE TABLE IF NOT EXISTS `photo` (
  `PHOTO_NUMBER` int(11) NOT NULL AUTO_INCREMENT,
  `PHOTO_DATE` date DEFAULT NULL,
  `PHOTO_MEMBER_ID` varchar(15) NOT NULL,
  `PHOTO_REGDATE` date NOT NULL,
  `PHOTO_IMG_PATH` varchar(200) NOT NULL,
  `PHOTO_IMG` varchar(100) NOT NULL,
  `PHOTO_THUMBNAIL` varchar(100) NOT NULL,
  `PHOTO_TITLE` varchar(50) NOT NULL,
  `PHOTO_CONTENT` text NOT NULL DEFAULT 'No Content',
  PRIMARY KEY (`PHOTO_NUMBER`),
  KEY `FK_PHOTO_MEMBER_ID` (`PHOTO_MEMBER_ID`),
  CONSTRAINT `FK_PHOTO_MEMBER_ID` FOREIGN KEY (`PHOTO_MEMBER_ID`) REFERENCES `member` (`MEMBER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- 테이블 데이터 imp.photo:~0 rows (대략적) 내보내기
DELETE FROM `photo`;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` (`PHOTO_NUMBER`, `PHOTO_DATE`, `PHOTO_MEMBER_ID`, `PHOTO_REGDATE`, `PHOTO_IMG_PATH`, `PHOTO_IMG`, `PHOTO_THUMBNAIL`, `PHOTO_TITLE`, `PHOTO_CONTENT`) VALUES
	(79, '2019-10-15', 'member', '2021-01-25', '\\resources\\img\\2021\\01\\25', '\\M_a0d599b5-b9f5-4eaf-bcb5-25fae63ed0e0_DSC09031.JPG', '\\T_a0d599b5-b9f5-4eaf-bcb5-25fae63ed0e0_DSC09031.JPG', '제주도', '에메랄드 바다\r\n                        '),
	(80, '2021-01-01', 'member', '2021-01-25', '\\resources\\img\\2021\\01\\25', '\\M_e5c711d7-2fd1-4e00-a57a-f5df04329799_DSC00268.JPG', '\\T_e5c711d7-2fd1-4e00-a57a-f5df04329799_DSC00268.JPG', '광화문', '광화문!\r\n                        '),
	(81, '2021-01-04', 'member', '2021-01-25', '\\resources\\img\\2021\\01\\25', '\\M_c5358fad-6b6b-4677-9957-b45be3716e49_DSC04935-2.JPG', '\\T_c5358fad-6b6b-4677-9957-b45be3716e49_DSC04935-2.JPG', '봄', '벚꽃\r\n                        '),
	(82, '2021-01-13', 'member', '2021-01-25', '\\resources\\img\\2021\\01\\25', '\\M_49032bd1-49d8-415a-9fd4-3faf078c01c2_DSC08817.JPG', '\\T_49032bd1-49d8-415a-9fd4-3faf078c01c2_DSC08817.JPG', '한가로운', '\r\n                        '),
	(83, '2021-01-14', 'member', '2021-01-25', '\\resources\\img\\2021\\01\\25', '\\M_ab582cb0-d10b-4c8f-a0b9-5a705202d5d4_DSC08274.JPG', '\\T_ab582cb0-d10b-4c8f-a0b9-5a705202d5d4_DSC08274.JPG', '제주도에서', '코로나 언제끝나냐~'),
	(84, '2021-01-01', 'member', '2021-01-25', '\\resources\\img\\2021\\01\\25', '\\M_9d002b2e-063c-4601-a797-911de5b4b13c_DSC08184.JPG', '\\T_9d002b2e-063c-4601-a797-911de5b4b13c_DSC08184.JPG', 'Untitled', '\r\n                        '),
	(85, '2021-01-01', 'member', '2021-01-25', '\\resources\\img\\2021\\01\\25', '\\M_ec934271-38bc-4915-bdc2-da782ca1d63f_DSC04750.JPG', '\\T_ec934271-38bc-4915-bdc2-da782ca1d63f_DSC04750.JPG', '일몰', '\r\n                        '),
	(86, '2021-01-02', 'member', '2021-01-25', '\\resources\\img\\2021\\01\\25', '\\M_3000e455-5777-4497-b68a-0042f9732984_DSC04388.JPG', '\\T_3000e455-5777-4497-b68a-0042f9732984_DSC04388.JPG', 'Untitled', '\r\n                        '),
	(87, '2020-12-15', 'member', '2021-01-25', '\\resources\\img\\2021\\01\\25', '\\M_ed8d2313-6638-4f7b-86d3-a5af0736d918_DSC04624.jpg', '\\T_ed8d2313-6638-4f7b-86d3-a5af0736d918_DSC04624.jpg', '자유', '\r\n                        '),
	(88, '2020-12-10', 'member', '2021-01-25', '\\resources\\img\\2021\\01\\25', '\\M_17b4c3f5-99fd-47c0-b2f5-109bcbab06d5_DSC08142.JPG', '\\T_17b4c3f5-99fd-47c0-b2f5-109bcbab06d5_DSC08142.JPG', 'Untitled', '\r\n                        '),
	(89, '2021-01-07', 'member', '2021-01-25', '\\resources\\img\\2021\\01\\25', '\\M_1b73ffa0-5cdd-4aee-b2e3-2b886fc03fa1_DSC02318.JPG', '\\T_1b73ffa0-5cdd-4aee-b2e3-2b886fc03fa1_DSC02318.JPG', 'Orange', '\r\n                        '),
	(90, '2021-01-05', 'member', '2021-01-25', '\\resources\\img\\2021\\01\\25', '\\M_8ed3f6dc-027e-4804-b55c-ff735e1e7a6d_DSC01058.JPG', '\\T_8ed3f6dc-027e-4804-b55c-ff735e1e7a6d_DSC01058.JPG', '밤과 경복궁', '궁은 밤에도 아름다워요\r\n                        '),
	(91, '2021-01-08', 'member', '2021-01-25', '\\resources\\img\\2021\\01\\25', '\\M_27f9925f-7de2-475c-a1f5-ae6f4b6811c0_DSC02499.JPG', '\\T_27f9925f-7de2-475c-a1f5-ae6f4b6811c0_DSC02499.JPG', '코르도바 메스키타', '이슬람과 카톨릭의 한지붕생활 - 스페인 코르도바의 메스키타의 기둥 -\r\n                        '),
	(92, '2021-01-01', 'member', '2021-01-25', '\\resources\\img\\2021\\01\\25', '\\M_9e6098bc-85b1-4e7d-a4a1-1df0f993934a_DSC02218.JPG', '\\T_9e6098bc-85b1-4e7d-a4a1-1df0f993934a_DSC02218.JPG', '주여', '\r\n                        '),
	(93, '2021-01-05', 'member', '2021-01-25', '\\resources\\img\\2021\\01\\25', '\\M_0c2b7d5c-b473-494c-befb-a0927c3e20cb_DSC04043.JPG', '\\T_0c2b7d5c-b473-494c-befb-a0927c3e20cb_DSC04043.JPG', '언제,어디서나,도도하게', '에펠탑'),
	(94, '2021-01-07', 'member', '2021-01-25', '\\resources\\img\\2021\\01\\25', '\\M_346c120c-1a66-4642-961d-4dd06c6ca36b_DSC01752.JPG', '\\T_346c120c-1a66-4642-961d-4dd06c6ca36b_DSC01752.JPG', '여행중 성당에서', '여행중에 잠시 들른 성당 -알무데나 대성당-'),
	(95, '2021-01-13', 'member', '2021-01-25', '\\resources\\img\\2021\\01\\25', '\\M_e67b055f-90b6-4852-bcd7-65db620038c6_DSC01531.JPG', '\\T_e67b055f-90b6-4852-bcd7-65db620038c6_DSC01531.JPG', '마리나베이센즈', '푸른하늘을 반사하는게 더욱 매력적이죠'),
	(96, '2021-01-06', 'member', '2021-01-25', '\\resources\\img\\2021\\01\\25', '\\M_06562c25-c51a-4b06-a13a-783670a81283_DSC03405.JPG', '\\T_06562c25-c51a-4b06-a13a-783670a81283_DSC03405.JPG', '사그라다파말리아', '완벽이라 말할수 있는 건축물\r\n                        '),
	(97, '2020-12-29', 'member', '2021-01-25', '\\resources\\img\\2021\\01\\25', '\\M_66753437-62cd-4184-ac77-4a65b6356059_DSC07536.JPG', '\\T_66753437-62cd-4184-ac77-4a65b6356059_DSC07536.JPG', '귀여운', '\r\n                 수달       '),
	(98, '2021-01-01', 'member', '2021-01-25', '\\resources\\img\\2021\\01\\25', '\\M_e11b915b-452d-4b32-8b6e-98e90bf69ad9_DSC02833.JPG', '\\T_e11b915b-452d-4b32-8b6e-98e90bf69ad9_DSC02833.JPG', '페트로나스 트윈 타워', '한 여름 말레이시아에서');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
