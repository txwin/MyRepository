CREATE DATABASE  IF NOT EXISTS `school`
USE `school`;


DROP TABLE IF EXISTS `grade`;

CREATE TABLE IF NOT EXISTS `grade` (
  `GradeId` INT(11) NOT NULL AUTO_INCREMENT,
  `GradeName` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`GradeId`)
) ;

INSERT  INTO `grade`(`GradeId`,`GradeName`) VALUES (1,'U1'),(2,'U2'),(3,'U3');


DROP TABLE IF EXISTS `subject`;

CREATE TABLE IF NOT EXISTS `subject` (
  `SubjectId` INT(11) NOT NULL AUTO_INCREMENT,
  `SubjectName` VARCHAR(20) NOT NULL,
  `ClassHour` INT(11) NOT NULL,
  `GradeId` INT(11) NOT NULL,
  PRIMARY KEY (`SubjectId`),
  KEY `FK_Subject` (`GradeId`),
  CONSTRAINT `FK_Subject` FOREIGN KEY (`GradeId`) REFERENCES `grade` (`GradeId`)
);


INSERT  INTO `subject`(`SubjectId`,`SubjectName`,`ClassHour`,`GradeId`) 
VALUES (1,'Java',78,1),(2,'OOP',40,2),(3,'Struts2',60,3),(4,'HTML',50,1),(5,'DataBase',90,2);


DROP TABLE IF EXISTS `student`;

CREATE TABLE IF NOT EXISTS `student` (
  `StudentNo` INT(11) NOT NULL,
  `LoginPwd` VARCHAR(20) NOT NULL,
  `StudentName` VARCHAR(50) NOT NULL,
  `Sex` CHAR(2) NOT NULL,
  `GradeId` INT(11) NOT NULL,
  `Phone` VARCHAR(255) NOT NULL,
  `Address` VARCHAR(255) DEFAULT NULL,
  `BornDate` DATETIME DEFAULT NULL,
  `Email` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (`StudentNo`),
  KEY `FK_Student` (`GradeId`),
  CONSTRAINT `FK_Student` FOREIGN KEY (`GradeId`) REFERENCES `grade` (`GradeId`)
);



INSERT  INTO `student`(`StudentNo`,`LoginPwd`,`StudentName`,`Sex`,`GradeId`,`Phone`,`Address`,`BornDate`,`Email`) 
VALUES (100001,'123456','王冬雪','男',1,'13618179368','王爷坟','1999-09-09 00:00:00','wangdongxue@sohu.com'),
(100002,'123456','王春雪','男',2,'13555555555','英家坟','2009-09-04 00:00:00','wangchunxue@sohu.com'),
(100003,'123456','王夏雪','男',3,'13444444444','八宝山','1989-09-19 00:00:00','wangxiaxue@sohu.com'),
(100004,'123456','王秋雪','男',1,'13333333333','公主坟','1899-09-29 00:00:00','wangqiuxue@sohu.com'),
(100005,'123456','王家训','女',2,'13222222222','八王坟','1979-09-19 00:00:00','wangjiaxun@sohu.com'),
(100007,'123','李四','男',3,'13911585602','朝阳路','2014-01-01 00:00:00','www.suho@.com'),
(100008,'123456','卢浩','男',2,'13911585603','丰台路','1990-01-01 00:00:00','www.qq2@.com'),
(100009,'123456','王旭东','男',2,'13911585604','昌平区','1996-01-01 00:00:00','www.qq3@.com'),
(100010,'123456','郑环环','男',2,'13911585605','中关村','1997-01-01 00:00:00','www.xinlang@.com'),
(100011,'123456','王丽丽','女',1,'13911585606','顺义区','1992-01-01 00:00:00','www.qq4@.com'),
(100012,'123456','冤大头','女',3,'13911585607','成府路','1993-01-01 00:00:00','www.qq5@.com'),
(100013,'123456','冤小头','女',1,'13911585608','中府村','1994-01-01 00:00:00','www.qq6@.com'),
(100014,'123456','乔峰','男',1,'13911585609','成义区','2014-01-01 00:00:00','www.qq7@.com'),
(100015,'123456','段誉','男',3,'13911585610','解台区','2013-01-01 00:00:00','www.qq8@.com'),
(100016,'123456','虚竹','男',1,'13911585611','丰阳区','2012-01-01 00:00:00','www.qq9@.com'),
(117006,'456','张三','男',1,'13911585601','解放路','2013-01-18 00:00:00','www.qq1@.com');


DROP TABLE IF EXISTS `result`;

CREATE TABLE `result` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `StudentNo` INT(50) NOT NULL,
  `SubJectId` INT(11) NOT NULL,
  `StudentResult` INT(11) DEFAULT NULL,
  `ExamDate` DATETIME DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Result` (`StudentNo`),
  KEY `FK_Result2` (`SubJectId`),
  CONSTRAINT `FK_Result2` FOREIGN KEY (`SubJectId`) REFERENCES `subject` (`SubjectId`),
  CONSTRAINT `FK_Result` FOREIGN KEY (`StudentNo`) REFERENCES `student` (`StudentNo`)
);



INSERT  INTO `result`(`Id`,`StudentNo`,`SubJectId`,`StudentResult`,`ExamDate`) 
VALUES (1,100011,3,60,'2014-05-01 00:00:00'),
(2,100012,1,70,'2014-01-01 00:00:00'),
(3,100013,4,100,'2014-07-01 00:00:00'),
(4,100014,5,100,'2014-08-01 00:00:00'),
(5,100015,4,100,'2014-09-01 00:00:00'),
(6,100016,2,0,'2014-04-01 00:00:00'),
(7,100007,1,0,'2014-01-10 00:00:00'),
(8,100008,3,97,'2014-03-01 00:00:00'),
(9,100009,2,78,'2014-02-01 00:00:00'),
(10,100010,1,87,'2014-01-01 00:00:00'),
(11,100005,2,100,'2014-11-01 00:00:00'),
(12,100011,1,60,'2014-05-01 00:00:00'),
(13,100012,1,60,'2014-05-01 00:00:00'),
(14,100013,3,70,'2014-05-01 00:00:00'),
(15,100015,3,75,'2014-05-01 00:00:00'),
(16,100014,3,72,'2014-05-01 00:00:00'),
(17,100016,3,68,'2014-05-01 00:00:00'),
(21,100010,3,69,'2014-05-01 00:00:00'),
(22,100011,3,61,'2014-05-01 00:00:00'),
(23,100010,3,81,'2014-05-01 00:00:00'),
(27,100016,3,82,'2014-05-01 00:00:00'),
(28,100015,3,52,'2014-05-01 00:00:00'),
(29,100014,3,53,'2014-05-01 00:00:00'),
(30,100013,3,58,'2014-05-01 00:00:00'),
(31,100012,3,78,'2014-05-01 00:00:00');