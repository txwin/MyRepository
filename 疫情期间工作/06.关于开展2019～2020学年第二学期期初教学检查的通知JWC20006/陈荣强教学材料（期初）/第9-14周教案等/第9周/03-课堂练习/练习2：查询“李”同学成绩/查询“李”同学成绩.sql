#��ѯ�����ա����ѧ�����гɼ�
SELECT StudentNo AS '"��"ͬѧ��ѧ��'��StudentResult AS '"��"ͬѧ�ĳɼ�'
FROM result
WHERE StudentNo IN
(SELECT StudentNo FROM student where StudentName like "��%");