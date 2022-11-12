--1) ȭ�а��� �����ϰ� �а����� �л����� ���� ����� �˻��ϼ���
SELECT ROUND(AVG(AVR),2) AVR,
       MAJOR
    FROM STUDENT
    WHERE MAJOR != 'ȭ��'
    GROUP BY MAJOR;

--2) ȭ�а��� ������ �� �а��� ��� ���� �߿� ������ 2.0 �̻��� ������ �˻��ϼ���
SELECT AVR,
       MAJOR
    FROM (SELECT ROUND(AVG(AVR),2) AVR,
                 MAJOR
            FROM STUDENT
            WHERE MAJOR != 'ȭ��'
            GROUP BY MAJOR)
    WHERE AVR >= 2;

--3) �⸻��� ����� 60�� �̻��� �л��� ������ �˻��ϼ���
SELECT *
    FROM STUDENT A,
         (SELECT AVG(RESULT) AS RESULT,
                 SNO
             FROM SCORE
             GROUP BY SNO) B
WHERE A.SNO = B.SNO
  AND B.RESULT > 60;

--4) ���� ������ 3���� �̻��� ������ ������ �˻��ϼ���
SELECT A.PNO,
       A.PNAME,
       A.SECTION,
       A.ORDERS,
       A.HIREDATE
    FROM PROFESSOR A,
         COURSE B
    WHERE A.PNO = B.PNO
      AND B.ST_NUM >= 3;

--5) �⸻��� ��� ������ �� ȭ�а��񺸴� ����� ������ ������ ��� �������� �˻��ϼ���
SELECT A.CNAME,
       B.PNAME
    FROM COURSE A,
         PROFESSOR B,
         (SELECT AVG(RESULT) AS RESULT,
                CNO
               FROM SCORE
              GROUP BY CNO)C
    WHERE A.PNO = B.PNO
      AND A.CNO = C.CNO
      AND C.RESULT > (SELECT AVG(RESULT)
                    FROM SCORE
                    WHERE CNO = '2368'
                    GROUP BY CNO);

6) �ٹ� ���� ������ 4�� �̻��� �μ��� �˻��ϼ���
SELECT A.DNAME,
       B.COUNT
    FROM DEPT A,
        (SELECT COUNT(*) AS COUNT,
                DNO
            FROM EMP
            GROUP BY DNO) B
    WHERE A.DNO = B.DNO
      AND B.COUNT >=4;


7) ������ ��� ������ 3000 �̻��� ������ �˻��ϼ���
SELECT ROUND(AVG(SAL), 0) AS SAL,
       JOB
    FROM EMP
    WHERE SAL>=3000
    GROUP BY JOB;

       

8) �� �а��� �г⺰ �ο��� �ο��� 5�� �̻��� �г��� �˻��ϼ���
SELECT SYEAR,
       MAJOR,
       COUNT
    FROM (SELECT SYEAR,
                 MAJOR,
                 COUNT(*)AS COUNT
             FROM STUDENT
             GROUP BY MAJOR, SYEAR)
    WHERE COUNT>=5;
