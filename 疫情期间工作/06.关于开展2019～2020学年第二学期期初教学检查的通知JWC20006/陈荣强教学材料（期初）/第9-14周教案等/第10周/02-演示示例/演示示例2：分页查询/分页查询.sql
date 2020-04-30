 
#查询所有课程《数据库结构-2》的考试成绩，并按照由高到低的显示，同时把该成绩对应的学生的学号、姓名打印出来
#要求：
#第一次查询前10条记录
#第二次查询11-20条记录

SELECT s.studentno,s.studentname,c.subjectname,r.studentresult
FROM student s JOIN result r
ON s.StudentNo=r.StudentNo
JOIN SUBJECT c
ON r.SubjectNo=c.SubjectNo
WHERE c.subjectname="数据库结构-2"
ORDER BY r.StudentResult DESC LIMIT 0,5;  #limit 5,5