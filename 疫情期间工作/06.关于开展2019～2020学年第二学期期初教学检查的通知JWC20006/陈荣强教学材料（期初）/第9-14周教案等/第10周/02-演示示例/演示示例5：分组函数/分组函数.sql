 
#按照不同的课程，分别算出其平均分、最高分和最低分，对于低于60分平均分的不予显示

 
SELECT 
	s.SubjectName as "课程名",MAX(StudentResult) as "最高分" ,  MIN(StudentResult) as "最低分" ,  AVG(StudentResult) AS "平均分" 
FROM 
	result  as r 
LEFT JOIN 
	subject as s ON s.SubjectNo = r.SubjectNo
GROUP BY  r.SubjectNo 
HAVING   AVG(StudentResult) >= 60 ;