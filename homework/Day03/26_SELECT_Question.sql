--<���� �� �Լ��� �̿��ϼ���>
--1) �������� ������ �޿� �ٹ��� �ϼ��� �� ������ �˻��ϼ���
SELECT PNAME,
       LAST_DAY(HIREDATE)-HIREDATE+1||'��'
    FROM PROFESSOR;

--2) �������� ���ñ��� �ٹ��� �ְ� �� ������ �˻��ϼ���
SELECT ROUND((SYSDATE-HIREDATE)/7,1)||'��',
       PNAME
    FROM PROFESSOR;   

--3) 1991�⿡�� 1995�� ���̿� ������ ������ �˻��ϼ���
SELECT PNAME,
       TO_CHAR(HIREDATE,'YYYY')
    FROM PROFESSOR
    WHERE TO_CHAR(HIREDATE,'YYYY') BETWEEN '1991' AND '1995';

--4) �л����� 4.5 ȯ�� ������ �˻��ϼ���(�� �Ҽ� ���� ��°�ڸ�����)
SELECT SNO,
       SNAME,
       ROUND(AVR*4.5/4,2)
    FROM STUDENT;   

--5) ������� ���ñ��� �ٹ� �Ⱓ�� �� �� �� ���� ��ĥ���� �˻��ϼ���
SELECT TRUNC(SYSDATE,'DD')-TRUNC(HDATE,'DD'),
       ENAME
    FROM EMP;