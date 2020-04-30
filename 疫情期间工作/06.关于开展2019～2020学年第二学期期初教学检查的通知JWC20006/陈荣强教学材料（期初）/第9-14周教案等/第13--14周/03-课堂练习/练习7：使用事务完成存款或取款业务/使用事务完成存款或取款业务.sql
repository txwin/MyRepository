/*-从卡号为“1010357612121134”的账户中转出300元给卡号为“1010357612345678”的账户-*/

BEGIN;
INSERT INTO tradeInfo(tradeType,cardID,tradeMoney) 
      VALUES('支取','1010357612121134',300);   
UPDATE cardInfo SET balance=balance-300 WHERE cardID='1010357612121134';
INSERT INTO tradeInfo(tradeType,cardID,tradeMoney) 
      VALUES('存入','1010357612345678',300);  
UPDATE cardInfo SET balance=balance+300 WHERE cardID='1010357612345678';
COMMIT;   #提交事务
#rollback; #回滚事务

/*--------检查测试数据是否正确---------*/
SELECT * FROM cardInfo;
SELECT * FROM tradeInfo;