--1) 각 과목의 과목명과 담당 교수의 교수명을 검색하라
SELECT A.CNO AS 과목번호,
       A.CNAME AS 과목명,
       B.PNAME AS 담당교수
    FROM COURSE A,
         PROFESSOR B
    WHERE A.PNO = B.PNO(+);     

--2) 화학과 학생의 기말고사 성적을 모두 검색하라
SELECT A.SNAME,
       B.CNAME,
       C.RESULT
    FROM STUDENT A,
         COURSE B,
         SCORE C
    WHERE A.SNO = C.SNO
      AND B.CNO = C.CNO
      AND A.MAJOR = '화학'
    ORDER BY A.SNAME ASC, C.CNO ASC;
    

--3) 유기화학과목 수강생의 기말고사 시험점수를 검색하라
SELECT A.SNO,
       A.SNAME,
       C.RESULT
    FROM STUDENT A,
         COURSE B,
         SCORE C
    WHERE A.SNO = C.SNO
      AND B.CNO = C.CNO
      AND B.CNAME = '유기화학'
    ORDER BY A.SNAME ASC;

--4) 화학과 학생이 수강하는 과목을 담당하는 교수의 명단을 검색하라
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
    

--5) 모든 교수의 명단과 담당 과목을 검색한다
SELECT A.PNAME,
       B.CNAME
    FROM PROFESSOR A,
         COURSE B
    WHERE A.PNO = B.PNO(+)
    ORDER BY PNAME ASC;


--6) 모든 교수의 명단과 담당 과목을 검색한다(단 모든 과목도 같이 검색한다)
SELECT A.PNAME,
       B.CNAME
    FROM PROFESSOR A
    FULL OUTER JOIN COURSE B
                 ON A.PNO = B.PNO
                 ORDER BY PNAME ASC;
