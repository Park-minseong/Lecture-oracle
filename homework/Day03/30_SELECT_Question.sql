--1) 각 학과별 학생 수를 검색하세요
SELECT MAJOR,
       COUNT(*)
    FROM  STUDENT
    GROUP BY MAJOR;

--2) 화학과와 생물학과 학생 4.5 환산 평점의 평균을 각각 검색하세요
SELECT ROUND(AVG(AVR*4.5/4),2),
       MAJOR
    FROM STUDENT
    WHERE MAJOR IN ('화학','생물')
    GROUP BY MAJOR;

--3) 부임일이 10년 이상 된 직급별(정교수, 조교수, 부교수) 교수의 수를 검색하세요
SELECT ORDERS,
       COUNT(*)
    FROM PROFESSOR
    WHERE SYSDATE-HIREDATE >= 3650
    GROUP BY ORDERS;

--4) 과목명에 화학이 포함된 과목의 학점수 총합을 검색하세요


--5) 과목명에 화학이 포함된 과목의 학점 총합을 검색하세요
SELECT SUM(ST_NUM)
    FROM COURSE
    WHERE CNAME LIKE '%화학%';
--6) 학과별 기말고사 평균을 성적순으로 검색하세요
SELECT AVG(A.RESULT),
       B.MAJOR
    FROM SCORE A,
         STUDENT B
    WHERE A.SNO = B.SNO
    GROUP BY B.MAJOR;


--7) 30번 부서의 업무별 연봉의 평균을 검색하세요(소수점 두자리까지 표시)
SELECT AVG(SAL)
    FROM EMP
    WHERE DNO = '30'
    GROUP BY DNO;

--8) 물리학과 학생 중에 학년별로 성적이 가장 우수한 학생의 평점을 검색하세요
SELECT A.SYEAR,
       A.SNAME,
       B.AVR
    FROM STUDENT A,
         (SELECT MAX(AVR) AS AVR,
                 SYEAR   
            FROM STUDENT
            WHERE MAJOR = '물리'
            GROUP BY SYEAR)B
    WHERE A.SYEAR = B.SYEAR
      AND A.AVR IN B.AVR
      AND MAJOR = '물리'
    ORDER BY A.SYEAR;        