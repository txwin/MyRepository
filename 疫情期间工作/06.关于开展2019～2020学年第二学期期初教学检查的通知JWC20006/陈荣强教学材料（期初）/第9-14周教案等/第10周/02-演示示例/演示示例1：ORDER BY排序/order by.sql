
# 查询《数据库结构-1》的所有考试结果，并按成绩由高到低排列

SELECT studentresult,subjectname 
FROM result INNER JOIN SUBJECT
ON result.SubjectNo = subject.SubjectNo
WHERE subject.SubjectName='数据库结构-1'
ORDER BY studentresult DESC;
