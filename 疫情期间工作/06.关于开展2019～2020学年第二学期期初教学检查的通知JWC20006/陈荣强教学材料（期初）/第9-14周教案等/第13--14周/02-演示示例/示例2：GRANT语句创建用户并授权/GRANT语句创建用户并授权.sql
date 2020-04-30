/*-创建本地用户xiaoming，密码123456，赋予myschool数据库中student表增加和查询权限-*/
GRANT INSERT,SELECT ON myschool.student TO `xiaoming`@`localhost` 
IDENTIFIED BY '123456';

/*-为student@localhost用户授予myschool数据库中view_student视图的查询权限-*/
GRANT SELECT ON myschool.view_student TO `student`@`localhost`;



