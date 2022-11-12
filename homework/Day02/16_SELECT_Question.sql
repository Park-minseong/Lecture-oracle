--1) �۰� ������ �����ϴ� ������ �˻��Ѵ�
SELECT CNAME,
       CNO
    FROM COURSE
    WHERE PNO = (SELECT PNO
                    FROM PROFESSOR
                    WHERE PNAME = '�۰�');

--2) ȭ�� ���� ������ �����ϴ� ������ ����� �˻��Ѵ�
SELECT PNAME
    FROM PROFESSOR
    WHERE SECTION = 'ȭ��';

--3) ������ 2������ ����� �̸� �����ϴ� ������ �˻��Ѵ�
SELECT PNAME  
    FROM PROFESSOR 
    WHERE PNO IN (SELECT PNO
                    FROM COURSE 
                    WHERE ST_NUM = 2);

--4) ȭ�а� ������ �����ϴ� ������ �˻��Ѵ�
SELECT A.CNAME,
       B.PNAME
    FROM COURSE A,
         (SELECT PNO,
                 PNAME
            FROM PROFESSOR
            WHERE SECTION LIKE 'ȭ��') B
    WHERE A.PNO IN B.PNO;    

--5) ȭ�а� 1�г� �л��� �⸻��� ������ �˻��Ѵ�
SELECT A.RESULT,
       B.SNAME,
       C.CNAME
    FROM SCORE A,
         STUDENT B,
         COURSE C
    WHERE A.SNO = B.SNO
      AND A.CNO = C.CNO
      AND B.MAJOR = 'ȭ��'
      AND B.SYEAR = 1;
       

--6) �Ϲ�ȭ�� ������ �⸻��� ������ �˻��Ѵ�
SELECT A.RESULT,
       B.CNAME,
       C.SNAME
    FROM SCORE A,
         COURSE B,
         STUDENT C
    WHERE A.CNO = B.CNO
      AND A.SNO = C.SNO
      AND b.cname = '�Ϲ�ȭ��';


--7) ȭ�а� 1�г� �л��� �Ϲ�ȭ�� �⸻��� ������ �˻��Ѵ�
SELECT A.RESULT,
       B.CNAME,
       C.SNAME
    FROM SCORE A,
         COURSE B,
         STUDENT C
    WHERE A.CNO = B.CNO
      AND A.SNO = C.SNO
      AND C.SYEAR = 1
      AND b.cname = '�Ϲ�ȭ��';

--8) ȭ�а� 1�г� �л��� �����ϴ� ������ �˻��Ѵ�
SELECT DISTINCT B.CNAME
    FROM SCORE A,
         COURSE B,
         STUDENT C
    WHERE A.CNO = B.CNO
      AND A.SNO = C.SNO
      AND C.SYEAR = 1
      AND C.MAJOR = 'ȭ��';

--9) ����ȭ�� ������ �������� F�� �л��� ����� �˻��Ѵ�
SELECT A.SNAME,
       B.GRADE,
       C.CNAME
    FROM STUDENT A,
         SCGRADE B,
         (SELECT B.RESULT,
                 B.SNO,
                 A.CNAME
             FROM COURSE A,
                  SCORE B
             WHERE A.CNO = B.CNO
               AND A.CNAME = '����ȭ��') C
    WHERE A.SNO = C.SNO
      AND C.RESULT BETWEEN B.LOSCORE AND B.HISCORE
      AND B.GRADE = 'F';
    




