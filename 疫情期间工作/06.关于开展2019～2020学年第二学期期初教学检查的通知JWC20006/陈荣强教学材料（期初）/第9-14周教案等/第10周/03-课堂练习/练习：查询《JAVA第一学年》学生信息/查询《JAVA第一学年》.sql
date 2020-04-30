#查询课程为《JAVA第一学年》成绩前10名分数大于80的学生信息（学号，姓名，课程名，分数）
SELECT s.StudentNO "学号"，s.StudentName "姓名"，"JAVA第一学年"，r.StudentResult 
FROM result as r left join student as s on s.StudentNo = r.studentNo
WHERE r.SubjectNo = (SELECT SubjectNo FROM subject WHERE SubjectName = "JAVA第一学年") AND r.StudentResult >=80
ORDER BY r.StudentResult DESC
limit 0,10;