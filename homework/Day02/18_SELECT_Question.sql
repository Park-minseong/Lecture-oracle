--1) �л��߿� ���������� �˻��Ѵ�
SELECT DISTINCT A.SNAME,
       A.SNO
    FROM STUDENT A,
         STUDENT B
    WHERE A.SNAME = B.SNAME
      AND A.SNO != B.SNO;


SELECT SNAME
    FROM STUDENT
    WHERE SNAME = '����';
--2) ��ü ���� ��ܰ� ������ ����ϴ� ������ �̸��� �а� ������ �˻��Ѵ�
SELECT A.PNAME,
       B.CNAME,
       A.SECTION
    FROM PROFESSOR A,
         COURSE B
    WHERE A.PNO = B.PNO(+)
    ORDER BY A.SECTION ASC;
         

--3) �̹� �б� ��ϵ� ��� ����� ��� ������ ���� ������ �˻��Ѵ�
SELECT A.CNAME,
       B.PNAME,
       A.ST_NUM
    FROM COURSE A,
         PROFESSOR B
    WHERE A.PNO = B.PNO(+)
    ORDER BY ST_NUM ASC;
