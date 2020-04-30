#1.创建视图：为了向客户显示信息友好,查询各表要求字段全为中文字段名。

DROP VIEW IF EXISTS vw_userInfo;

CREATE VIEW vw_userInfo #客户信息表视图
  AS 
    SELECT customerID AS 客户编号,customerName AS 开户名, PID AS 身份证号,
        telephone AS 电话号码,address AS 居住地址  FROM userInfo;

#使用视图
SELECT * FROM vw_userInfo;


#2.创建视图：查询银行卡信息
DROP VIEW IF EXISTS vw_cardInfo;

CREATE VIEW view_cardInfo  #银行卡信息表视图
  AS 
    SELECT c.cardID AS 卡号,u.customerName AS 客户,c.curID AS 货币种类, d.savingName AS 存款类型,c.openDate AS 开户日期,
       c.balance AS 余额,c.pass 密码,IsReportLoss AS 是否挂失
    FROM cardInfo c, deposit d,userinfo u
    WHERE c.savingID=d.savingID AND c.customerID=u.customerID;

#使用视图
SELECT * FROM view_cardInfo;
GO

#3.创建视图：查看交易信息
DROP VIEW IF EXISTS view_tradeInfo;

CREATE VIEW view_tradeInfo #交易信息表视图
  AS 
    SELECT tradeDate AS 交易日期,tradeType AS 交易类型, cardID AS 卡号,tradeMoney AS 交易金额,
      remark AS 备注  FROM tradeInfo ;

#使用视图
SELECT * FROM view_tradeInfo;