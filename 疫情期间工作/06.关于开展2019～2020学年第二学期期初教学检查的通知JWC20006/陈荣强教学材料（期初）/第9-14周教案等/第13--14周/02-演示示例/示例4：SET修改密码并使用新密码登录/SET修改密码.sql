/*-当登录用户为root时，使用SET命令将root密码修改为“0000”，将teacher账户密码修改为‘“8888”-*/
#修改当前登录账户密码
SET PASSWORD = PASSWORD(“0000”); 
#修改其他用户密码
SET PASSWORD  FOR `teacher`@`localhost`= PASSWORD(“8888”); 
