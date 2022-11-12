1) 4.5 ȯ�� ������ ���� ���� 3���� �л��� �˻��ϼ���.
SELECT ROWNUM,
       SNAME,
       AVR
    FROM (SELECT SNAME,
                 ROUND(AVR*4.5/4.0,2) AS AVR
            FROM STUDENT
            ORDER BY ROUND(AVR*4.5/4.0,2) DESC, SNAME
        )
    WHERE ROWNUM <=3;    
    

2) �⸻��� ���� ����� ���� 3������ �˻��ϼ���.
SELECT ROWNUM,
       CNAME,
       RESULT
    FROM (SELECT CNAME,
                 AVG(RESULT) AS RESULT
            FROM COURSE
            NATURAL JOIN SCORE
            GROUP BY CNAME
            ORDER BY RESULT DESC
        )
    WHERE ROWNUM <= 3;    

3) �а���, �г⺰, �⸻��� ����� ���� 3������ �˻��ϼ���.(�а�, �г�, ������� �˻�)
SELECT ROWNUM,
       MAJOR,
       RESULT
    FROM (
            SELECT MAJOR,
                   AVG(RESULT) AS RESULT
                FROM STUDENT
                NATURAL JOIN SCORE
                GROUP BY MAJOR, SYEAR
                ORDER BY RESULT DESC
        )
    WHERE ROWNUM <= 3;    


4) �⸻��� ������ ���� ������ ����ϴ� ���� 3���� �˻��ϼ���.(�����̸�, �����, ������� �˻�)
SELECT ROWNUM,
       PNAME,
       CNAME,
       RESULT
    FROM (
            SELECT PNAME,
                   CNAME,
                   AVG(RESULT) AS RESULT
                FROM SCORE
                NATURAL JOIN COURSE
                NATURAL JOIN PROFESSOR
                GROUP BY CNAME, PNAME
                ORDER BY RESULT DESC
        )
    WHERE ROWNUM <= 3;    

5) �������� ���� �������� �л��� ���� �˻��ϼ���.
SELECT PNO,
       PNAME,
       COUNT(*)
    FROM PROFESSOR
    NATURAL JOIN COURSE
    NATURAL JOIN SCORE
    GROUP BY PNO,PNAME;

        
                
