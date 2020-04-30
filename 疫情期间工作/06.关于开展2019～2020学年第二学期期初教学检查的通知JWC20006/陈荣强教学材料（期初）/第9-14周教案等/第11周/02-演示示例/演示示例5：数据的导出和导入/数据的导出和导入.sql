

#备份数据库myschool中的student表中的studentno及studentname列到文件myschool3.sql中
USE myschool;
SELECT  studentno,  studentname  INTO  OUTFILE  'e:/myschool3.sql'  FROM  student;

#恢复文件myschool3.sql中的数据到test数据库的t2表中来
USE test;
CREATE TABLE t2(
	id INT(4),
	sname VARCHAR(20)
)
LOAD  DATA  INFILE  'e:/myschool3.sql'  INTO  TABLE  t2(id, sname);

SELECT * FROM t2;






