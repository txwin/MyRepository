
#数据备份与恢复
#方式一：mysql命令方式

#备份DOS：
#备份myschool数据库的student及result表
mysqldump -uroot -pbdqn myschool student result>h:/myschool.sql

#恢复1:
mysql -uroot -pbdqn;
USE test;
source h:/myschool.sql;

#恢复2:
mysql -uroot -pbdqn test<h:/myschool.sql;

#方式二：工具方式
选择需要备份的数据库，右键-》备份/导出-》以SQL转储文件备份数据库

选择需要恢复的数据库，右键-》导入-》从sql转储文件导入数据库


