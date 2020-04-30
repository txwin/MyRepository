/*-创建数据库bankDB-*/
DROP DATABASE IF EXISTS bankDB;
CREATE DATABASE  bankDB;
/*-创建普通用户bankMaster，可以在任意主机登录MySQL服务器，具有数据库bankDB的所有权限，密码为1234-*/

#方法一：先创建用户再授权
CREATE USER `bankMaster` IDENTIFIED BY '1234';
GRANT ALL ON bankDB.* TO 'bankMaster';

#方法二：创建用户同时授权
GRANT ALL ON bankDB.* TO 'bankMaster' IDENTIFIED BY '1234';



