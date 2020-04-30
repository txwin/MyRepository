
#select查询中可以使用表达式
SELECT @@auto_increment_increment
SELECT VERSION();
SELECT 100*3-1 AS 计算结果;
#学员考试成绩集体提分1分
SELECT studentno,studentresult+1 AS '提分后' FROM result;

