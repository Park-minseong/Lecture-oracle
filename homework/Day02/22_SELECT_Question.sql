--1) �� ������ ������ ��� ������ �������� �˻��϶�
SELECT A.CNO AS �����ȣ,
       A.CNAME AS �����,
       B.PNAME AS ��米��
    FROM COURSE A,
         PROFESSOR B
    WHERE A.PNO = B.PNO(+);     

--2) ȭ�а� �л��� �⸻��� ������ ��� �˻��϶�
SELECT A.SNAME,
       B.CNAME,
       C.RESULT
    FROM STUDENT A,
         COURSE B,
         SCORE C
    WHERE A.SNO = C.SNO
      AND B.CNO = C.CNO
      AND A.MAJOR = 'ȭ��'
    ORDER BY A.SNAME ASC, C.CNO ASC;
    

--3) ����ȭ�а��� �������� �⸻��� ���������� �˻��϶�
SELECT A.SNO,
       A.SNAME,
       C.RESULT
    FROM STUDENT A,
         COURSE B,
         SCORE C
    WHERE A.SNO = C.SNO
      AND B.CNO = C.CNO
      AND B.CNAME = '����ȭ��'
    ORDER BY A.SNAME ASC;

--4) ȭ�а� �л��� �����ϴ� ������ ����ϴ� ������ ����� �˻��϶�
SELECT DISTINCT A.CNO,
                A.CNAME
           FROM course A,
                STUDENT B,
                SCORE C
           WHERE A.CNO = C.CNO
           AND C.SNO = B.SNO;

SELECT A.PNAME,
       B.CNAME
    FROM PROFESSOR A,
         (SELECT DISTINCT A.CNO,
                          A.CNAME,
                          A.PNO
                     FROM course A,
                          STUDENT B,
                          SCORE C
                    WHERE A.CNO = C.CNO
                    AND C.SNO = B.SNO) B
    WHERE A.PNO = B.PNO;            
    

--5) ��� ������ ��ܰ� ��� ������ �˻��Ѵ�
SELECT A.PNAME,
       B.CNAME
    FROM PROFESSOR A,
         COURSE B
    WHERE A.PNO = B.PNO(+)
    ORDER BY PNAME ASC;


--6) ��� ������ ��ܰ� ��� ������ �˻��Ѵ�(�� ��� ���� ���� �˻��Ѵ�)
SELECT A.PNAME,
       B.CNAME
    FROM PROFESSOR A
    FULL OUTER JOIN COURSE B
                 ON A.PNO = B.PNO
                 ORDER BY PNAME ASC;
