--1) 송강 교수가 강의하는 과목을 검색한다
SELECT CNAME,
       CNO
    FROM COURSE
    WHERE PNO = (SELECT PNO
                    FROM PROFESSOR
                    WHERE PNAME = '송강');

--2) 화학 관련 과목을 강의하는 교수의 명단을 검색한다
SELECT PNAME
    FROM PROFESSOR
    WHERE SECTION = '화학';

--3) 학점이 2학점인 과목과 이를 강의하는 교수를 검색한다
SELECT PNAME  
    FROM PROFESSOR 
    WHERE PNO IN (SELECT PNO
                    FROM COURSE 
                    WHERE ST_NUM = 2);

--4) 화학과 교수가 강의하는 과목을 검색한다
SELECT A.CNAME,
       B.PNAME
    FROM COURSE A,
         (SELECT PNO,
                 PNAME
            FROM PROFESSOR
            WHERE SECTION LIKE '화학') B
    WHERE A.PNO IN B.PNO;    

--5) 화학과 1학년 학생의 기말고사 성적을 검색한다
SELECT A.RESULT,
       B.SNAME,
       C.CNAME
    FROM SCORE A,
         STUDENT B,
         COURSE C
    WHERE A.SNO = B.SNO
      AND A.CNO = C.CNO
      AND B.MAJOR = '화학'
      AND B.SYEAR = 1;
       

--6) 일반화학 과목의 기말고사 점수를 검색한다
SELECT A.RESULT,
       B.CNAME,
       C.SNAME
    FROM SCORE A,
         COURSE B,
         STUDENT C
    WHERE A.CNO = B.CNO
      AND A.SNO = C.SNO
      AND b.cname = '일반화학';


--7) 화학과 1학년 학생의 일반화학 기말고사 점수를 검색한다
SELECT A.RESULT,
       B.CNAME,
       C.SNAME
    FROM SCORE A,
         COURSE B,
         STUDENT C
    WHERE A.CNO = B.CNO
      AND A.SNO = C.SNO
      AND C.SYEAR = 1
      AND b.cname = '일반화학';

--8) 화학과 1학년 학생이 수강하는 과목을 검색한다
SELECT DISTINCT B.CNAME
    FROM SCORE A,
         COURSE B,
         STUDENT C
    WHERE A.CNO = B.CNO
      AND A.SNO = C.SNO
      AND C.SYEAR = 1
      AND C.MAJOR = '화학';

--9) 유기화학 과목의 평가점수가 F인 학생의 명단을 검색한다
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
               AND A.CNAME = '유기화학') C
    WHERE A.SNO = C.SNO
      AND C.RESULT BETWEEN B.LOSCORE AND B.HISCORE
      AND B.GRADE = 'F';
    




