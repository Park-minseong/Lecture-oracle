--1) 학생중에 동명이인을 검색한다
SELECT DISTINCT A.SNAME,
       A.SNO
    FROM STUDENT A,
         STUDENT B
    WHERE A.SNAME = B.SNAME
      AND A.SNO != B.SNO;


SELECT SNAME
    FROM STUDENT
    WHERE SNAME = '노육';
--2) 전체 교수 명단과 교수가 담당하는 과목의 이름을 학과 순으로 검색한다
SELECT A.PNAME,
       B.CNAME,
       A.SECTION
    FROM PROFESSOR A,
         COURSE B
    WHERE A.PNO = B.PNO(+)
    ORDER BY A.SECTION ASC;
         

--3) 이번 학기 등록된 모드 과목과 담당 교수의 학점 순으로 검색한다
SELECT A.CNAME,
       B.PNAME,
       A.ST_NUM
    FROM COURSE A,
         PROFESSOR B
    WHERE A.PNO = B.PNO(+)
    ORDER BY ST_NUM ASC;
