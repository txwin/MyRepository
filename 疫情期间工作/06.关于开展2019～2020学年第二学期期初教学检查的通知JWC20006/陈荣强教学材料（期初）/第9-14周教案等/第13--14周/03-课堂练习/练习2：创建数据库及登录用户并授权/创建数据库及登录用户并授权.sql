/*-�������ݿ�bankDB-*/
DROP DATABASE IF EXISTS bankDB;
CREATE DATABASE  bankDB;
/*-������ͨ�û�bankMaster������������������¼MySQL���������������ݿ�bankDB������Ȩ�ޣ�����Ϊ1234-*/

#����һ���ȴ����û�����Ȩ
CREATE USER `bankMaster` IDENTIFIED BY '1234';
GRANT ALL ON bankDB.* TO 'bankMaster';

#�������������û�ͬʱ��Ȩ
GRANT ALL ON bankDB.* TO 'bankMaster' IDENTIFIED BY '1234';



