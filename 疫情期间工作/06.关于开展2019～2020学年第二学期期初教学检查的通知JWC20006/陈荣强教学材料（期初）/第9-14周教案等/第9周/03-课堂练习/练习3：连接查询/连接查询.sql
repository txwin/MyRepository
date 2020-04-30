#查询学生的学号，姓名和所在年级;
#左连接
SELECT s.StudentNo,s.StudentName,g.GradeName FROM student AS s LEFT JOIN grade AS g  ON s.GradeID = g.GradeID:
#右连接
SELECT s.StudentNo,s.StudentName,g.GradeName FROM student AS s RIGHT JOIN grade AS g  ON s.GradeID = g.GradeID:
#内连接
SELECT s.StudentNo,s.StudentName,g.GradeName FROM student AS s JOIN grade AS g  ON s.GradeID = g.GradeID:

