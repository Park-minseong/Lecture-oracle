<NATURAL JOIN�� USING ������ �̿��� ������ �� �� �����ϼ���.>
1) �۰� ������ �����ϴ� ������ �˻��ϼ���.
SELECT CNAME
    FROM COURSE
    NATURAL JOIN PROFESSOR
    WHERE PNAME = '�۰�';
    
SELECT CNAME
    FROM COURSE
    JOIN PROFESSOR USING(PNO)
    WHERE PNAME = '�۰�';

2) ������ 2������ ����� �̸� �����ϴ� ������ �˻��ϼ���.
SELECT CNAME,
       PNAME
    FROM COURSE
    NATURAL JOIN PROFESSOR
    WHERE ST_NUM = 2;
    
SELECT CNAME,
       PNAME
    FROM COURSE
    JOIN PROFESSOR USING(PNO)
    WHERE ST_NUM = 2;    

3) ȭ�а� 1�г� �л��� �⸻��� ������ �˻��ϼ���.
SELECT SNO,
       SNAME,
       CNAME,
       RESULT
    FROM STUDENT
    NATURAL JOIN SCORE
    NATURAL JOIN COURSE
    WHERE SYEAR = 1
      AND MAJOR = 'ȭ��'
    ORDER BY SNAME;
    
SELECT SNO,
       SNAME,
       CNAME,
       RESULT
    FROM STUDENT
    JOIN SCORE USING(SNO)
    JOIN COURSE USING(CNO)
    WHERE SYEAR = 1
      AND MAJOR = 'ȭ��'
    ORDER BY SNAME;
    


4) �Ϲ�ȭ�� ������ �⸻��� ������ �˻��ϼ���.
SELECT SNAME,
       RESULT
    FROM STUDENT
    NATURAL JOIN SCORE
    NATURAL JOIN COURSE
    WHERE CNAME = '�Ϲ�ȭ��1';