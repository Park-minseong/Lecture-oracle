--<���� �� �Լ��� ����ϼ���>
--1) �̸��� �� ������ �л��� �̸��� �˻��ϼ���
SELECT SNAME
    FROM STUDENT
    WHERE LENGTH(SNAME)=2;

--2) '��'�� ���� ���� �л��� �̸��� �˻��ϼ���
SELECT SNAME
    FROM STUDENT
    WHERE SNAME LIKE '��%';

--3) ������ ������ �ѱ��ڷ� �˻��ϼ���(ex. ������ -> ��)
SELECT SUBSTR(ORDERS, 1, 1),
       PNAME
    FROM PROFESSOR;

--4) �Ϲ� ������ ���� �������� �����ؼ� ��� ������ �˻��ϼ���
-- (ex. �Ϲ�ȭ�� -> ����ȭ��)
UPDATE COURSE
    SET CNAME = REPLACE(CNAME, '�Ϲ�','����');
SELECT * FROM COURSE;
   
--5) ���� �Է� �Ǽ��� student���̺��� sname�÷��� �����Ͱ� �Էµ� ��
--   ���ڿ� �������� ������ �߰��Ǿ��ٸ� �˻��� �� �̸� �����ϰ�
--   �˻��ϴ� SELECT ���� �ۼ��ϼ���
SELECT TRIM(SNAME)
    FROM STUDENT;