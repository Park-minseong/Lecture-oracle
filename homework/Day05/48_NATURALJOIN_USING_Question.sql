<NATURAL JOIN과 USING 구문을 이용한 쿼리를 두 개 생성하세요.>
1) 송강 교수가 강의하는 과목을 검색하세요.
SELECT CNAME
    FROM COURSE
    NATURAL JOIN PROFESSOR
    WHERE PNAME = '송강';
    
SELECT CNAME
    FROM COURSE
    JOIN PROFESSOR USING(PNO)
    WHERE PNAME = '송강';

2) 학점이 2학점인 과목과 이를 강의하는 교수를 검색하세요.
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

3) 화학과 1학년 학생의 기말고사 성적을 검색하세요.
SELECT SNO,
       SNAME,
       CNAME,
       RESULT
    FROM STUDENT
    NATURAL JOIN SCORE
    NATURAL JOIN COURSE
    WHERE SYEAR = 1
      AND MAJOR = '화학'
    ORDER BY SNAME;
    
SELECT SNO,
       SNAME,
       CNAME,
       RESULT
    FROM STUDENT
    JOIN SCORE USING(SNO)
    JOIN COURSE USING(CNO)
    WHERE SYEAR = 1
      AND MAJOR = '화학'
    ORDER BY SNAME;
    


4) 일반화학 과목의 기말고사 점수를 검색하세요.
SELECT SNAME,
       RESULT
    FROM STUDENT
    NATURAL JOIN SCORE
    NATURAL JOIN COURSE
    WHERE CNAME = '일반화학1';