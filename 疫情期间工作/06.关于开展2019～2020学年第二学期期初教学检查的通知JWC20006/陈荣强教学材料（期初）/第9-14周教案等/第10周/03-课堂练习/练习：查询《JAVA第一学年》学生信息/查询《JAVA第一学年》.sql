#��ѯ�γ�Ϊ��JAVA��һѧ�꡷�ɼ�ǰ10����������80��ѧ����Ϣ��ѧ�ţ��������γ�����������
SELECT s.StudentNO "ѧ��"��s.StudentName "����"��"JAVA��һѧ��"��r.StudentResult 
FROM result as r left join student as s on s.StudentNo = r.studentNo
WHERE r.SubjectNo = (SELECT SubjectNo FROM subject WHERE SubjectName = "JAVA��һѧ��") AND r.StudentResult >=80
ORDER BY r.StudentResult DESC
limit 0,10;