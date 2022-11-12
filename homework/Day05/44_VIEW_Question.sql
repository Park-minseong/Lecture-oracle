1) �л��� ���� 4.5 �������� ȯ��� ������ �˻��� �� �ִ� �並 �����ϼ���.
CREATE OR REPLACE VIEW MAY_STUDENT(
    AVR,
    SNO,
    SNAME
)AS(
    SELECT AVR*4.5/4.0,
           SNO,
           SNAME
        FROM STUDENT    
);

SELECT * FROM MAY_STUDENT;
2) �� ���� ��� ������ �˻��� �� �ִ� �並 �����ϼ���.
CREATE OR REPLACE VIEW VIEW_STUDENT_AVR(
    CNAME,
    AVR
)AS(
    SELECT A.CNAME,
           AVG(B.RESULT)
        FROM COURSE A,
             SCORE B
        WHERE A.CNO = B.CNO
        GROUP BY A.CNAME
); 

SELECT * FROM VIEW_STUDENT_AVR;
3) �� ����� �������� �̸��� �˻��� �� �ִ� �並 �����ϼ���.
CREATE OR REPLACE VIEW MA_MGR(
    ENAME,
    MGRNAE
)AS(SELECT A.ENAME,
           B.ENAME
        FROM EMP A,
             EMP B
        WHERE A.MGR = B.ENO
);        

4) �� ���� �⸻��� �� ���(A~F)������ �ش� �л� ������ �˻��� �� �ִ� �並 �����ϼ���.
CREATE OR REPLACE VIEW MA_GRADE(
    SNO,
    SNAME,
    GRADE,
    CNAME
)AS(
    SELECT A.SNO,
           A.SNAME,     
           B.GRADE,
           B.CNAME
    FROM STUDENT A,       
        (
        SELECT A.SNO,
               A.CNO,
               B.GRADE,
               C.CNAME
            FROM SCORE A,
                 SCGRADE B,
                 COURSE C
            WHERE A.RESULT BETWEEN B.LOSCORE AND B.HISCORE   
              AND A.CNO = C.CNO
            )B
    WHERE A.SNO = B.SNO
);    

SELECT * FROM MA_GRADE;

5) �����а� ������ ������ �����ϴ� �л��� ����� �˻��� �並 �����ϼ���.
CREATE OR REPLACE VIEW MA_STUDENT_LIST(
    SNO,
    SNAME
)AS(
    SELECT SNO,
           SNAME
        FROM STUDENT
        NATURAL JOIN
             (SELECT SNO
                FROM SCORE
                NATURAL JOIN COURSE
                NATURAL JOIN PROFESSOR
                WHERE SECTION = '����'
            )  
);    
        
SELECT * FROM  MA_STUDENT_LIST;