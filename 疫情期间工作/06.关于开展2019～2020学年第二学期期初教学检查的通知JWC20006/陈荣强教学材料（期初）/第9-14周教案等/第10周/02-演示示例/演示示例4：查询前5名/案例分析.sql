/*
案例 ：查询《C语言1》的前5名学生成绩信息

MySQL 语句 
*/


SELECT s.StudentNo as "学号",s.StudentName as "姓名",r.StudentResult as "成绩"  
FROM `result` AS r  
LEFT JOIN  `student` AS s  ON r.StudentNo = s.StudentNo 
WHERE  r.SubjectNO  =  ( SELECT SubjectNO FROM subject WHERE subjectName = 'C语言-1' )
ORDER BY r.StudentResult DESC
LIMIT 0,5;

