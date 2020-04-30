
 
USE bankDB;

DROP TABLE IF EXISTS `userInfo`;
CREATE TABLE `userInfo`  #用户信息表
(
  `customerID` INT(4) PRIMARY KEY AUTO_INCREMENT COMMENT '用户编号',
  `customerName` CHAR(8) NOT NULL COMMENT '用户编号',
  `PID` CHAR(18) UNIQUE NOT NULL COMMENT '身份证号',
  `telephone` CHAR(20) NOT NULL COMMENT '手机号码',
  `address` VARCHAR(50) COMMENT '居住地址'
)ENGINE = INNODB,COMMENT='用户表';

DROP TABLE IF EXISTS `cardInfo`;
CREATE TABLE `cardInfo`  #银行卡信息表
(
  `cardID`  CHAR(19) NOT NULL PRIMARY KEY COMMENT '卡号',
   `password` CHAR(6) NOT NULL DEFAULT "888888" COMMENT '密码',
  `curID`  VARCHAR(10) NOT NULL DEFAULT "RMB" COMMENT '币种',
  `savingID` INT NOT NULL COMMENT '存款类型',
  `openDate`  TIMESTAMP NOT NULL COMMENT '开户日期' ,
  `openMoney`  DECIMAL(20,2) NOT NULL DEFAULT 1 COMMENT '开户金额' ,
  `balance`  DECIMAL(20,2) NOT NULL DEFAULT 1 COMMENT '余额',
  `IsReportLoss` BIT  NOT NULL  DEFAULT 0 COMMENT '是否挂失',
  `customerID` INT NOT NULL
) ENGINE = INNODB,COMMENT='银行卡信息表';

DROP TABLE IF EXISTS `tradeInfo`;
CREATE TABLE `tradeInfo`  #交易信息表
(
  cardID  CHAR(16) NOT NULL COMMENT '卡号',
  tradeDate  TIMESTAMP NOT NULL  COMMENT '交易日期',
  tradeMoney  DECIMAL(20,2) NOT NULL COMMENT '实际交易金额',
  tradeType  CHAR(4) NOT NULL COMMENT '交易类型', 
  remark  TEXT COMMENT '备注'  
)ENGINE = INNODB,COMMENT='交易信息表';

DROP TABLE IF EXISTS `deposit`;
CREATE TABLE `deposit`  #存款类型表
(
  savingID  INT(4)  AUTO_INCREMENT PRIMARY KEY,
  savingName  VARCHAR(20) NOT NULL,
  descrip VARCHAR(50)
)ENGINE = INNODB,COMMENT='存款类型表';


/*--加约束--$*/

ALTER TABLE cardInfo     
   ADD CONSTRAINT  FK_customerID FOREIGN KEY(customerID) REFERENCES userInfo(customerID),
   ADD  CONSTRAINT  FK_savingID  FOREIGN KEY(savingID) REFERENCES deposit(savingID);

ALTER TABLE tradeInfo
  ADD CONSTRAINT  FK_cardID  FOREIGN KEY(cardID) REFERENCES cardInfo(cardID);
  
  




