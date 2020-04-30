#要求：从subject和grade数据表查询课程名称和所属年级 名称

#非等值连接查询
SELECT SubjectName,GradeName FROM subject,grade;  

#等值查询
SELECT SubjectName,GradeName FROM subject,grade WHERE  subject.GradeID= grade.GradeID;  
