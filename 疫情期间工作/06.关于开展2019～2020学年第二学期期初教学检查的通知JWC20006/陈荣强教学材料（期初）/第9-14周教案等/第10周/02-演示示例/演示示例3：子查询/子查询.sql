 #演示示例：子查询
 #查询课程为《高等数学-2》且分数不小于80分的学生的学号和姓名
SELECT    
s.StudentNo,StudentName  
FROM  student AS s  
WHERE   
studentNo  
IN 
 (  
    SELECT  
	StudentNO 
    FROM  
        result 
    WHERE  
	SubjectNo =  (SELECT SubjectNo FROM subject WHERE SubjectName = "高等数学-2") 
	AND   
	StudentResult  >=  80  
 );

 