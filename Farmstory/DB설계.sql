# 날짜 : 2023/08/16
# 이름 : 강나은
# 내용 : 팜스토리 프로젝트 데이터베이스 설계

# 데이터베이스 생성
CREATE DATABASE `Farmstory`;

# 회원테이블
CREATE TABLE `User`(
	`uid`		VARCHAR(20) PRIMARY KEY,
	`pass`		VARCHAR(255),
	`name`		VARCHAR(20),
	`nickname`	VARCHAR(20) UNIQUE,
	`email`		VARCHAR(50) UNIQUE,
	`hp`		CHAR(13) 	UNIQUE,
	`role`		VARCHAR(20) DEFAULT 'USER',
	`zip`		CHAR(5),
	`addr1`		VARCHAR(255),
	`addr2`		VARCHAR(255),
	`regip`		VARCHAR(100),
	`regdate`	DATETIME,
	`leaveDate` DATETIME
);

# 약관테이블
CREATE TABLE `Terms`(
	`terms`		TEXT NOT NULL,
	`privacy`	TEXT NOT NULL
);

# 게시물테이블
CREATE TABLE `Article`(
	`no`		INT 		 AUTO_INCREMENT PRIMARY KEY,
	`parent`	INT 		 DEFAULT 0,
	`comment`	INT 		 DEFAULT 0,
	`category`	VARCHAR(20)  DEFAULT 'free',
	`title`		VARCHAR(255),
	`content`	TEXT 		 NOT NULL,
	`file`		TINYINT 	 DEFAULT 0,
	`hit`		INT 		 DEFAULT 0,
	`writer`	VARCHAR(20)  NOT NULL,
	`regip`		VARCHAR(100) NOT NULL,
	`rdate`		DATETIME 	 NOT NULL,
	FOREIGN KEY(`writer`) REFERENCES `User`(`uid`)
);

# 파일테이블
CREATE TABLE `File`(
	`fno`		 INT			AUTO_INCREMENT PRIMARY KEY,
	`ano`		 INT			NOT NULL,
	`originName` VARCHAR(255) 	NOT NULL,
	`newName`	 VARCHAR(255) 	NOT NULL,
	`download`	 INT			DEFAULT 0,
	`rdate`		 DATETIME	  	NOT NULL,
	FOREIGN KEY(`ano`) REFERENCES `Article`(`no`)
);

# 상품테이블
CREATE TABLE `Product` (
	`pno`		INT AUTO_INCREMENT PRIMARY KEY,
	`category`	TINYINT 	 NOT NULL,
	`pName`		VARCHAR(100) NOT NULL,
	`price`		INT DEFAULT 0,
	`delivery`	INT DEFAULT 0,
	`stock`		INT DEFAULT 0,
	`sold`		INT DEFAULT 0,
	`thumb1`	VARCHAR(255) NOT NULL,
	`thumb2`	VARCHAR(255) NOT NULL,
	`thumb3`	VARCHAR(255) NOT NULL,
	`seller`	VARCHAR(20)  NOT NULL,
	`etc`		VARCHAR(255),
	`rdate`		DATETIME 	 NOT NULL,
	FOREIGN KEY(`seller`) REFERENCES `User`(`uid`)
);

# 주문테이블
CREATE TABLE `Order` (
	`orderNo`			INT AUTO_INCREMENT PRIMARY KEY,
	`orderProduct`		INT NOT NULL,
	`orderCount`		INT NOT NULL,
	`orderDelivery`		INT NOT NULL,
	`orderPrice`		INT NOT NULL,
	`orderTotal`		INT NOT NULL,
	`orderUser`			VARCHAR(20) NOT NULL,
	`orderDate`			DATETIME NOT NULL,
	FOREIGN KEY(`orderProduct`) REFERENCES `Product`(`pNo`),
	FOREIGN KEY(`orderUser`) REFERENCES `User`(`uid`)
);