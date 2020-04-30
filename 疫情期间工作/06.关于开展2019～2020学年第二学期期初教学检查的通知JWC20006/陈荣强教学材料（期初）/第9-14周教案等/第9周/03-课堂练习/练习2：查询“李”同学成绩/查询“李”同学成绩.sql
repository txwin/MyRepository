#查询所有姓“李”的学生所有成绩
SELECT StudentNo AS '"李"同学的学号'，StudentResult AS '"李"同学的成绩'
FROM result
WHERE StudentNo IN
(SELECT StudentNo FROM student where StudentName like "李%");