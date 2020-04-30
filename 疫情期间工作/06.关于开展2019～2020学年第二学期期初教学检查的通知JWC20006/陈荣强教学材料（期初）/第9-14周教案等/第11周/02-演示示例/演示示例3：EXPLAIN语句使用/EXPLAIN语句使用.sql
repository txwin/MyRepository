/* 创建一个表 aricles */
DROP TABLE IF   EXISTS  articles; 
CREATE TABLE  IF NOT EXISTS articles (
      id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
      title VARCHAR(200), 
      body TEXT,
      FULLTEXT (title,body)
 )ENGINE = MyISAM;

 
INSERT INTO articles (title,body) VALUES
     ('MySQL Tutorial','DBMS stands for DataBase ...'),
     ('How To Use MySQL Well','After you went through a ...'),
     ('Optimizing MySQL','In this tutorial we will show ...'),
     ('1001 MySQL Tricks','1. Never run mysqld as root. 2. ...'),
     ('MySQL vs. YourSQL','In the following database comparison ...'),
     ('MySQL Security','When configured properly, MySQL ...');


 INSERT INTO articles (title,body)  ( select title,body from articles);



/* 使用全文索引查询 */
SELECT * FROM articles  WHERE MATCH (title,body) AGAINST ('database');
   

/*EXPLAIN 函数 分析 select  语句*/

EXPLAIN SELECT * FROM articles  WHERE MATCH (title,body) AGAINST ('databa
se') \G

/*结果*/
/* 
mysql> EXPLAIN SELECT * FROM articles  WHERE MATCH (title,body) AGAINST ('databa
se') \G
*************************** 1. row ***************************
           id: 1
  select_type: SIMPLE
        table: articles
         type: fulltext
possible_keys: title
          key: title
      key_len: 0
          ref:
         rows: 1
        Extra: Using where
1 row in set (0.00 sec)
*/


/*不使用全文检索*/
 EXPLAIN SELECT * FROM articles  WHERE  title like '%databa%' or body like "%databa%" \G;

/*
*************************** 1. row ***************************
           id: 1
  select_type: SIMPLE
        table: articles
         type: ALL
possible_keys: NULL
          key: NULL
      key_len: NULL
          ref: NULL
         rows: 6
        Extra: Using where
1 row in set (0.00 sec)

ERROR:
No query specified


*/