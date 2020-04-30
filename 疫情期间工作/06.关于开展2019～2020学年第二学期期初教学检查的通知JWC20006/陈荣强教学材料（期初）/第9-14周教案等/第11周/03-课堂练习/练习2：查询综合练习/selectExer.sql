/*查询密码长度不足6位的学员信息(学员编号、姓名、密码、年级名称)*/
SELECT studentNo AS 学员编号,StudentName AS 学员姓名, LoginPwd AS 学员密码 ,gradename AS 年级名称
FROM student INNER JOIN grade ON student.gradeid=grade.gradeid 
WHERE LENGTH(LoginPwd)<6

/*查找郑环环所有考试的成绩（科目名称、考试成绩）*/
SELECT SubjectName AS 科目名称,StudentResult AS 成绩 FROM Result 
INNER JOIN SUBJECT ON subject.SubjectId=result.SubJectId
INNER JOIN Student ON Student.StudentNo=Result.StudentNo
WHERE StudentName='郑环环'


/*使用表连接方式查询所有U1年级学员学号、姓名及年级名称*/
SELECT studentNo,StudentName,grade.Gradename FROM Student 
INNER JOIN Grade ON Grade.GradeId=Student.GradeId
WHERE GradeName='U1'

/*使用子查询方式查询所有U1年级学员学号、姓名、年级ID*/
#使用子查询此时是无法查询年级姓名的
/*SELECT studentNo,StudentName,Gradename FROM Student 
WHERE gradeId =(SELECT gradeId FROM grade WHERE GradeName='U1')*/
SELECT studentNo,StudentName,Gradeid FROM Student 
WHERE gradeId =(SELECT gradeId FROM grade WHERE GradeName='U1')


/*使用表连接方式查询“Java”课程至少一次考试刚好等于60分的学生姓名*/
SELECT StudentName FROM Student
INNER JOIN Result ON Result.StudentNo=Student.StudentNo
INNER JOIN SUBJECT ON Subject.SubjectId=Result.SubjectId
WHERE SubjectName='Java' AND StudentResult='60'

/*使用子查询方式查询“Java”课程至少一次考试刚好等于60分的学生*/
SELECT StudentName FROM Student WHERE StudentNo IN
(SELECT StudentNo FROM Result WHERE StudentResult='60' AND SubjectId=
(SELECT SubjectId FROM SUBJECT WHERE SubjectName='Java'))

/*使用子查询方式+表连接方式混合查询“Java”课程至少一次考试刚好等于60分的学生*/
SELECT StudentName FROM Student WHERE StudentNo IN
(SELECT StudentNo FROM Result 
INNER JOIN SUBJECT ON Subject.SubjectId=Result.SubjectId 
WHERE StudentResult='60' AND SubjectName='Java')