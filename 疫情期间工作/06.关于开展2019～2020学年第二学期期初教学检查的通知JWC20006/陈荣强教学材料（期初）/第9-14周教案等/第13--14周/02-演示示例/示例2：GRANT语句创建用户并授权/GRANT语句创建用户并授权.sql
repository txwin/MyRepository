/*-���������û�xiaoming������123456������myschool���ݿ���student�����ӺͲ�ѯȨ��-*/
GRANT INSERT,SELECT ON myschool.student TO `xiaoming`@`localhost` 
IDENTIFIED BY '123456';

/*-Ϊstudent@localhost�û�����myschool���ݿ���view_student��ͼ�Ĳ�ѯȨ��-*/
GRANT SELECT ON myschool.view_student TO `student`@`localhost`;



