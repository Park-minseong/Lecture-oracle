1) 학생의 학점 4.5 만점으로 환산된 정보를 검색할 수 있는 뷰를 생성하세요.
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
2) 각 과목별 평균 점수를 검색할 수 있는 뷰를 생성하세요.
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
3) 각 사원과 관리자의 이름을 검색할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW MA_MGR(
    ENAME,
    MGRNAE
)AS(SELECT A.ENAME,
           B.ENAME
        FROM EMP A,
             EMP B
        WHERE A.MGR = B.ENO
);        

4) 각 과목별 기말고사 평가 등급(A~F)까지와 해당 학생 정보를 검색할 수 있는 뷰를 생성하세요.
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

5) 물리학과 교수의 과목을 수강하는 학생의 명단을 검색할 뷰를 생성하세요.
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
                WHERE SECTION = '물리'
            )  
);    
        
SELECT * FROM  MA_STUDENT_LIST;