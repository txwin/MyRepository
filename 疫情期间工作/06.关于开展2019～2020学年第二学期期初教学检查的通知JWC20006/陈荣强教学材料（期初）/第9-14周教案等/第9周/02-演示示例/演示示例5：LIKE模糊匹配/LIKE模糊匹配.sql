 #查询包含“数学”的所有课程
	SELECT   *  FROM subject WHERE SubjectName  LIKE  "%数学%";
#查询所有姓名为“李**”三个字的学生信息
	 SELECT  StudentNo,StudentName FROM student  WHERE StudentName 
LIKE "李__";
