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

