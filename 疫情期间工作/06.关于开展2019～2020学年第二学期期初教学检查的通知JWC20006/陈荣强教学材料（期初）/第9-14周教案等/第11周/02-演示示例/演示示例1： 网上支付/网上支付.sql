/*创建 shop  数据库*/
CREATE DATABASE IF NOT EXISTS `shop`;

/* 创建 账户表 */

CREATE TABLE IF NOT EXISTS  `account` (
  `id` int(11) not null auto_increment,
  `name` varchar(32) not null,
  `cash` decimal(9,2) not null,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
 

INSERT INTO  `account`   (`name`,`cash`) VALUES ('A',2000.00);
INSERT INTO  `account`   (`name`,`cash`) VALUES ('B',10000.00);



/* 事务处理*/

  select * from account;
  set autocommit= 0; 
  START TRANSACTION; 
  update account set cash = cash - 500  where name = 'A';
  select * from account; 
  ROLLBACK;  
  set autocommit = 1; 
  select * from account;
   

