#查询课程表
#LEFT JOIN 左连接

SELECT SubjectName,ClassHour,GradeName FROM subject as s left join grade as g  ON  g.GradeID = S.GradeID; 




#RIGHT JOIN 右连接

SELECT SubjectName,ClassHour,GradeName FROM subject as s Right join grade as g  ON  g.GradeID = S.GradeID; 
