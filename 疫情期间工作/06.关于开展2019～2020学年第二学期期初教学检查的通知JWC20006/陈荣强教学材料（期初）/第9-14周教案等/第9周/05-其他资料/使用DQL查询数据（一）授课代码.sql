#该表表类型（存储引擎）InnoDB
CREATE TABLE test(
	id INT(4) PRIMARY KEY AUTO_INCREMENT,
	col1 VARCHAR(20) NOT NULL
);

INSERT INTO test(col1) VALUES('row1'),('row2'),('row3');

#删除表全部数据(不带where条件的delete)
#自增当前值依然从原来基础上进行
DELETE FROM test;

#删除表全部数据(truncate)
#自增值恢复到初始值重新开始
TRUNCATE TABLE test;




#创建两个表，分别为InnoDB类型、MyISAM类型
CREATE TABLE tab1(
	id INT(4) PRIMARY KEY AUTO_INCREMENT,
	col1 VARCHAR(20) NOT NULL
)ENGINE=INNODB;

CREATE TABLE tab2(
	id INT(4) PRIMARY KEY AUTO_INCREMENT,
	col1 VARCHAR(20) NOT NULL
)ENGINE=MYISAM;

INSERT INTO tab1(col1) VALUES('row1'),('row2'),('row3');

INSERT INTO tab2(col1) VALUES('row1'),('row2'),('row3');

#清空表数据
DELETE FROM tab1;
DELETE FROM tab2;

#id-->6
#重启数据库服务后，tab1 ：1 2 3；tab2: 7 8 9 
#同样适用delete from清空表数据，重启数据库服务后，对于INNODB的表，自增列从初始值重新开始
#而MYISAM类型的表，自增列依然从上一个自增数据基础上开始

#启动 net start mysql  ;  停止服务  net stop mysql

#查询所有学生信息(所有列,效率低)
SELECT * FROM student;
#查询指定列（学号  姓名）
SELECT studentno,studentname FROM student;
#为列取别名(as,也可以省略)
SELECT studentno AS 学号,studentname AS 姓名 FROM student;

SELECT studentno 学号,studentname 姓名 FROM student;
#使用as也可以为表取别名
SELECT studentno 学号,studentname 姓名 FROM student AS s;
SELECT studentno 学号,studentname 姓名 FROM student s;

#使用as，为查询结果取一个新名字
SELECT CONCAT('姓名：',studentname) AS 新姓名 FROM student;

#查看哪些同学参加了考试（学号）-- 去除重复项(distinct，默认all)
SELECT DISTINCT studentno FROM result;

#select查询中可以使用表达式
SELECT @@auto_increment_increment
SELECT VERSION();
SELECT 100*3-1 AS 计算结果;
#学员考试成绩集体提分1分
SELECT studentno,studentresult+1 AS '提分后' FROM result;

#满足条件的查询（where） 考试成绩95-100
SELECT studentno,studentresult 
FROM result
WHERE studentresult>=95 AND studentresult<=100;
#模糊查询
SELECT studentno,studentresult 
FROM result
WHERE studentresult BETWEEN 95 AND 100;
#精确查询
SELECT studentno,studentresult 
FROM result
WHERE studentno=1000;
#或者写成&&
SELECT studentno,studentresult 
FROM result
WHERE studentresult>=95 && studentresult<=100;

#除了1000号同学，我要其他同学的考试成绩
SELECT studentno,studentresult 
FROM result
WHERE studentno!=1000;

SELECT studentno,studentresult 
FROM result
WHERE NOT studentno=1000;

#模糊查询 between and\   like  \in \ null
#查询姓李的同学的学号及姓名
#like结合使用的通配符：%（0到任意个字符）   _（一个字符）
SELECT studentno,studentname 
FROM student
WHERE studentname LIKE '李%';

#姓李的，但是名字中只有一个字
SELECT studentno,studentname 
FROM student
WHERE studentname LIKE '李_';
#姓李的，但是名字中只有两个字
SELECT studentno,studentname 
FROM student
WHERE studentname LIKE '李__';
#姓名中含有“文”字的同学 
SELECT studentno,studentname 
FROM student
WHERE studentname LIKE '%文%';

#模糊查询
SELECT studentno,studentname FROM student;
#like   %  _
INSERT  INTO `student`
(`StudentNo`,`LoginPwd`,`StudentName`,`Sex`,`GradeId`,`Phone`,`Address`,`BornDate`,`Email`,`IdentityCard`) 
VALUES (6666,'111111','小%',1,1,'13500000888','北京海淀区中关村大街1号','1986-12-11 00:00:00','test1@163.cn','450323198612111666'),
(6667,'123456','小_',1,2,'13500000666','河南洛阳','1981-12-31 00:00:00','test1@126.cn','450323198112311888')
#查询学员姓名中有“%”这个字的同学学号、姓名   转义符
SELECT studentno,studentname FROM student
WHERE studentname LIKE '%\%%';

SELECT studentno,studentname FROM student
WHERE studentname LIKE '%\_%';
#转义符\  能不能使用我自己的转义符呢？（:）
SELECT studentno,studentname FROM student
WHERE studentname LIKE '%:%%' ESCAPE ':';

#模糊查询：in     null
SELECT studentno,studentname 
FROM student
WHERE studentno=1000 OR studentno=1001 OR studentno=1002 OR studentno=1003;

SELECT studentno,studentname 
FROM student
WHERE studentno IN(1000,1001,1002,1003);


SELECT studentno,studentname 
FROM student
WHERE address IN('北京','南京','苏州','扬州');
#null 空
SELECT * FROM student;
INSERT  INTO `student`
(`StudentNo`,`LoginPwd`,`StudentName`,`Sex`,`GradeId`,`Phone`,`Address`,`BornDate`,`Email`,`IdentityCard`) 
VALUES (8888,'111111','小红',1,1,'13500000888','北京海淀区中关村大街1号',NULL,'test1@163.cn','450323198612111889'),
(8889,'123456','小花',1,2,'13500000666','河南洛阳',NULL,'test1@126.cn','450323198112311999')

#查询出生日期没有填写的同学  =NULL 是错误的  和null比较必须写is null
SELECT studentname FROM student
WHERE borndate IS NULL
#查询出生日期填写的同学
SELECT studentname FROM student
WHERE borndate IS NOT NULL

#区别空字符串与null
SELECT * FROM student;
#查询家庭住址没有写的同学
SELECT studentname FROM student 
WHERE address='' OR address IS NULL;

#连接查询
#内连接 inner join  查询两个表中的结果集中的交集
#外连接 outer join
	#左外连接   left join    以左表作为基准，右边表来一一匹配，匹配不上的，返回左表的记录，右表以null填充
	#右外连接   right join   以右表作为基准，左边表来一一匹配，匹配不上的，返回右表的记录，左表以null填充
#自连接
#等值连接   非等值连接

#查询参加了考试的同学信息（学号、学生姓名、科目编号、分数）
SELECT * FROM student;
SELECT * FROM result;
#思路：（1）分析需求，确定查询的列来源于两个表 student  result,连接查询
#（2）确定使用哪一种连接查询？ ---内连接
SELECT s.studentno,studentname,subjectno,studentresult
FROM student s
INNER JOIN result r
ON r.StudentNo=s.StudentNo

SELECT s.studentno,studentname,subjectno,studentresult
FROM student s
RIGHT JOIN result r
ON r.StudentNo=s.StudentNo

#等值连接
SELECT s.studentno,studentname,subjectno,studentresult
FROM student s,result r
WHERE r.StudentNo=s.StudentNo

#查询出了所有同学，不考试的也查出来
SELECT s.studentno,studentname,subjectno,studentresult
FROM student s
LEFT JOIN result r
ON r.StudentNo=s.StudentNo

#查一下缺考的同学
SELECT studentname
FROM student s
LEFT JOIN result r
ON r.StudentNo=s.StudentNo
WHERE studentresult IS NULL

#思考题:查询参加了考试的同学信息（学号、学生姓名、科目名、分数）
SELECT s.studentno,studentname,subjectno,studentresult
FROM student s
INNER JOIN result r
ON r.StudentNo=s.StudentNo

#自连接


#上次作业问题
SELECT subjectno,classhour,classhour/10 AS `均课时/10` FROM SUBJECT





