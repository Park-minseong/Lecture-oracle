--1) 화학과를 제외하고 학과별로 학생들의 평점 평균을 검색하세요
SELECT ROUND(AVG(AVR),2) AVR,
       MAJOR
    FROM STUDENT
    WHERE MAJOR != '화학'
    GROUP BY MAJOR;

--2) 화학과를 제외한 각 학과별 평균 평점 중에 평점이 2.0 이상인 정보를 검색하세요
SELECT AVR,
       MAJOR
    FROM (SELECT ROUND(AVG(AVR),2) AVR,
                 MAJOR
            FROM STUDENT
            WHERE MAJOR != '화학'
            GROUP BY MAJOR)
    WHERE AVR >= 2;

--3) 기말고사 평균이 60점 이상인 학생의 정보를 검색하세요
SELECT *
    FROM STUDENT A,
         (SELECT AVG(RESULT) AS RESULT,
                 SNO
             FROM SCORE
             GROUP BY SNO) B
WHERE A.SNO = B.SNO
  AND B.RESULT > 60;

--4) 강의 학점이 3학점 이상인 교수의 정보를 검색하세요
SELECT A.PNO,
       A.PNAME,
       A.SECTION,
       A.ORDERS,
       A.HIREDATE
    FROM PROFESSOR A,
         COURSE B
    WHERE A.PNO = B.PNO
      AND B.ST_NUM >= 3;

--5) 기말고사 평균 성적이 핵 화학과목보다 우수한 과목의 과목명과 담당 교수명을 검색하세요
SELECT A.CNAME,
       B.PNAME
    FROM COURSE A,
         PROFESSOR B,
         (SELECT AVG(RESULT) AS RESULT,
                CNO
               FROM SCORE
              GROUP BY CNO)C
    WHERE A.PNO = B.PNO
      AND A.CNO = C.CNO
      AND C.RESULT > (SELECT AVG(RESULT)
                    FROM SCORE
                    WHERE CNO = '2368'
                    GROUP BY CNO);

6) 근무 중인 직원이 4명 이상인 부서를 검색하세요
SELECT A.DNAME,
       B.COUNT
    FROM DEPT A,
        (SELECT COUNT(*) AS COUNT,
                DNO
            FROM EMP
            GROUP BY DNO) B
    WHERE A.DNO = B.DNO
      AND B.COUNT >=4;


7) 업무별 평균 연봉이 3000 이상인 업무를 검색하세요
SELECT ROUND(AVG(SAL), 0) AS SAL,
       JOB
    FROM EMP
    WHERE SAL>=3000
    GROUP BY JOB;

       

8) 각 학과의 학년별 인원중 인원이 5명 이상인 학년을 검색하세요
SELECT SYEAR,
       MAJOR,
       COUNT
    FROM (SELECT SYEAR,
                 MAJOR,
                 COUNT(*)AS COUNT
             FROM STUDENT
             GROUP BY MAJOR, SYEAR)
    WHERE COUNT>=5;
