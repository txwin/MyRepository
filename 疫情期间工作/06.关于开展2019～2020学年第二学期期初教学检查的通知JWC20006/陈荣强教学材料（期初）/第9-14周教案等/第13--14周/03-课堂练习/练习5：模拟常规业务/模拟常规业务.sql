/*---------修改密码-----*/
#1.张三（卡号为1010 3576 1234 5678）修改银行卡密码为123456
#2.李四（卡号为1010 3576 1212 1134）修改银行卡密码为123123
UPDATE cardInfo SET pass='123456' WHERE cardID='1010357612345678'; 
UPDATE cardInfo SET pass='123123' WHERE cardID='1010357612121134'; 
#查询账户信息
SELECT * FROM cardInfo;


/*---------挂失帐号---------*/
#李四（卡号为1010 3576 1212 1134）因银行卡丢失，申请挂失
UPDATE cardInfo SET IsReportLoss=1 WHERE cardID='1010357612121134' 
SELECT * FROM cardInfo
GO

#查看修改密码和挂失结果
SELECT cardid 卡号,curID 货币,savingName 储蓄种类,opendate 开户日期,
openmoney 开户金额,balance 余额,pass 密码,
    IsReportLoss 是否挂失, 
    customerName 客户姓名
FROM cardInfo, deposit, userInfo
WHERE cardInfo.savingID=deposit.savingID AND cardInfo.customerID = userInfo.customerID


/*--------统计银行的资金流通余额和盈利结算------------------------------*/
#统计说明:存款代表资金流入,取款代表资金贷出.假定存款利率为千分之3,贷款利率为千分之8
/*--单一货币RMB--*/
SELECT * FROM tradeInfo; 

SELECT tradeType 资金流向, SUM(tradeMoney) 总金额 FROM tradeInfo GROUP BY tradeType;



/*--------查询本周开户的卡号,显示该卡相关信息-----------------*/
SELECT c.cardID 卡号,u.customerName 姓名,c.curID 货币,d.savingName 存款类型,c.openDate 开户日期,c.openMoney 开户金额,c.balance 存款余额,IsReportLoss 账户状态
FROM cardInfo c INNER JOIN userInfo u ON (c.customerID = u.customerID)
INNER JOIN deposit d ON (c.savingID = d.savingID )
WHERE WEEK(NOW()) = WEEK(openDate);

/*---------查询本月交易金额最高的卡号----------------------*/
SELECT * FROM tradeInfo;
SELECT DISTINCT cardID FROM tradeInfo WHERE  tradeMoney=
	(SELECT MAX(tradeMoney) FROM tradeInfo
	 WHERE MONTH(tradeDate)=MONTH(NOW())
		AND YEAR(tradeDate)=YEAR(NOW()));
	
		
/*---------查询挂失帐号的客户信息---------------------*/
SELECT customerName AS 客户姓名,telephone AS 联系电话 FROM userInfo 
    WHERE customerID IN (SELECT customerID FROM cardInfo WHERE IsReportLoss='挂失');
    
    
/*------催款提醒：例如某种业务的需要，每个月末，如果发现用户帐上余额少于200元，将致电催款。---*/
SELECT customerName AS 客户姓名,telephone AS 联系电话,balance AS 存款余额 
FROM userInfo INNER JOIN cardInfo ON  userInfo.customerID=cardInfo.customerID 
WHERE balance<200;