--1) �� �а��� �л� ���� �˻��ϼ���
SELECT MAJOR,
       COUNT(*)
    FROM  STUDENT
    GROUP BY MAJOR;

--2) ȭ�а��� �����а� �л� 4.5 ȯ�� ������ ����� ���� �˻��ϼ���
SELECT ROUND(AVG(AVR*4.5/4),2),
       MAJOR
    FROM STUDENT
    WHERE MAJOR IN ('ȭ��','����')
    GROUP BY MAJOR;

--3) �������� 10�� �̻� �� ���޺�(������, ������, �α���) ������ ���� �˻��ϼ���
SELECT ORDERS,
       COUNT(*)
    FROM PROFESSOR
    WHERE SYSDATE-HIREDATE >= 3650
    GROUP BY ORDERS;

--4) ����� ȭ���� ���Ե� ������ ������ ������ �˻��ϼ���


--5) ����� ȭ���� ���Ե� ������ ���� ������ �˻��ϼ���
SELECT SUM(ST_NUM)
    FROM COURSE
    WHERE CNAME LIKE '%ȭ��%';
--6) �а��� �⸻��� ����� ���������� �˻��ϼ���
SELECT AVG(A.RESULT),
       B.MAJOR
    FROM SCORE A,
         STUDENT B
    WHERE A.SNO = B.SNO
    GROUP BY B.MAJOR;


--7) 30�� �μ��� ������ ������ ����� �˻��ϼ���(�Ҽ��� ���ڸ����� ǥ��)
SELECT AVG(SAL)
    FROM EMP
    WHERE DNO = '30'
    GROUP BY DNO;

--8) �����а� �л� �߿� �г⺰�� ������ ���� ����� �л��� ������ �˻��ϼ���
SELECT A.SYEAR,
       A.SNAME,
       B.AVR
    FROM STUDENT A,
         (SELECT MAX(AVR) AS AVR,
                 SYEAR   
            FROM STUDENT
            WHERE MAJOR = '����'
            GROUP BY SYEAR)B
    WHERE A.SYEAR = B.SYEAR
      AND A.AVR IN B.AVR
      AND MAJOR = '����'
    ORDER BY A.SYEAR;        