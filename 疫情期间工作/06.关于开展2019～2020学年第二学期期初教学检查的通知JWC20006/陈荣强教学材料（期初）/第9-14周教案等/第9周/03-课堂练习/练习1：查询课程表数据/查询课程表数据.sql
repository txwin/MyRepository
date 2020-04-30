#查询课程名称、总课时及每天10课时计算的天数
SELECT subjectName as "课程名称"，ClassHour as "总课时"，（ClassHour/10） as "均课时/天"  FROM subject;