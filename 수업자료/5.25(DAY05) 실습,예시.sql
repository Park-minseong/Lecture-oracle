--1~4번
--인덱스 생성
-- 학생 이름에 인덱스 생성
--수동 인덱스 생성(비 교유 인덱스)
--컬럼으로 인덱스 생성
CREATE INDEX STUDENT_SNAME_IDX
ON STUDENT(SNAME);

--복합 인덱스 생성
CREATE INDEX STUDENT_MAJOR_AVR_IDX
ON STUDENT(MAJOR, AVR);

--수식으로 인덱스 생성
--수식으로 지정한 인덱스는 인덱스 명으로 표시되지 않음
CREATE INDEX STUDENT_COAVR_IDX
ON STUDENT(AVR/4*4.5);

--생성된 인덱스 확인----------------------------------------------------------------------
SELECT B.INDEX_NAME,
       B.COLUMN_NAME,
       B.COLUMN_POSITION,
       A.UNIQUENESS
    FROM USER_INDEXES A,
         USER_IND_COLUMNS B
    WHERE A.INDEX_NAME = B.INDEX_NAME
      AND A.TABLE_NAME = 'STUDENT'
    ORDER BY B.INDEX_NAME, B.COLUMN_POSITION;
    
--수식으로 생성된 컬럼 확인
SELECT INDEX_NAME,
       COLUMN_EXPRESSION
    FROM USER_IND_EXPRESSIONS
    WHERE INDEX_NAME = 'STUDENT_COAVR_IDX';
----------------------------------------------------------------------------------------
--5번
--인덱스 삭제
DROP INDEX STUDENT_COAVR_IDX;
DROP INDEX STUDENT_MAJOR_AVR_IDX;
DROP INDEX STUDENT_SNAME_IDX;

--인덱스 자동생성(아래 만들고 위에 인덱스 확인 해보면 하나 생겨있음)
ALTER TABLE STUDENT
ADD CONSTRAINT STUDENT_SNO_PK PRIMARY KEY(SNO);




--6~8번
--뷰의 생성 
--(뷰도 테이블처럼 만들어서 관리하는거고 원천 테이블이 바뀌면 뷰도 자동으로 바뀜)

--과목의 학과별 기말고사 평균 뷰 생성
--CREATE 이후 (컬럼명)에는 이름, 타입은 상관없이 만들수 있다.
CREATE OR REPLACE VIEW MA_STUDENT (
    CNO,
    CNAME,
    MAJOR,
    AVG_RESULT
) AS (
    SELECT A.CNO
         , A.CNAME
         , B.MAJOR
         , ROUND(AVG(C.RESULT))
        FROM COURSE A
           , STUDENT B
           , SCORE C
        WHERE A.CNO = C.CNO
          AND B.SNO = C.SNO
        GROUP BY A.CNO, A.CNAME, B.MAJOR
);

SELECT * FROM MA_STUDENT;
SELECT * FROM COURSE;
--복합 뷰의 경우 원천테이블의 데이터 변경시 뷰의 데이터도 자동 갱신
UPDATE COURSE
    SET CNAME = '일반화학1'
    WHERE CNAME = '일반화학';
COMMIT;

UPDATE STUDENT
    SET MAJOR = '유공2'
    WHERE MAJOR = '유공';



--단순 뷰를 생성하되 CHECK OPTION으로 DML 구문이 사용 가능하게 생성
--단순 뷰를 생성
--1학년 학생의 정보 뷰
CREATE OR REPLACE VIEW ST_CH(
    SNO,
    SNAME,
    SYEAR,
    AVR
) AS (
    SELECT SNO,
           SNAME,
           SYEAR,
           AVR
        FROM STUDENT
        WHERE SYEAR = 1
);

SELECT * FROM ST_CH;

--단순 뷰에 INSERT INTO 구문으로 데이터 입력
INSERT INTO ST_CH VALUES (
    '9001',
    '홍길동',
    2,
    4.0
);
SELECT * FROM ST_CH
WHERE SNAME = '조병조';

--CHECK OPTION으로 DML 구문의 제한
--VIEW에서 조회 가능한 데이터는 1학년 정보이므로
--VIEW에서 조회가 안되는 2,3,4학년의 데이터는 입력할 수 없다.
CREATE OR REPLACE VIEW ST_CH(
    SNO,
    SNAME,
    SYEAR,
    AVR
) AS (
    SELECT SNO,
           SNAME,
           SYEAR,
           AVR
        FROM STUDENT
        WHERE SYEAR=1
)
WITH CHECK OPTION CONSTRAINT VIEW_ST_CH_CK;

SELECT * FROM ST_CH;

INSERT INTO ST_CH VALUES(
    '9003',
    '임꺽정1',
    4,
    3.8
);


--9번
--인라인 뷰(서브쿼리 부분에 셀렉트문으로 넣은 부분이 인라인 뷰임)
--각 부서별 최소 급여자 조회(사원번호, 사원이름, 부서번호, 급여)
SELECT DNO,
       MIN(SAL)
    FROM EMP
    GROUP BY DNO;
SELECT * FROM EMP;

--아래 이거 왜 에러나지?
SELECT A.ENO,
       A.ENAME,
       A.DNO,
       B.SAL
    FROM EMP A,
    (
    SELECT DNO,
       MIN(SAL)
    FROM EMP
    GROUP BY DNO
    ) B
    WHERE A.SAL = B.SAL;

--10번    
--ROWNUM 사용
SELECT ROWNUM,
        ENO,
        ENAME,
        SAL
    FROM (
            SELECT ENO,
                   ENAME,
                   SAL
                FROM EMP
                ORDER BY SAL DESC
    ) A
    WHERE ROWNUM <=3;

--잘못된 ROWNUM 사용
--정렬되기 전에 ROWNUM 부여하고
--ROWNUM에 조건을 주기 때문에
--전혀 다른 결과 값이 표출된다. 
--(위의 예시처럼 서브쿼리에서 정렬된 값이 아니라 
--정렬되기 전에 ROWNUM이 만들어져서 그런듯)
SELECT ROWNUM,
        ENO,
        ENAME,
        SAL
    FROM EMP
    WHERE ROWNUM <=3
    ORDER BY SAL DESC;
--11~14번
--시퀀스
DROP TABLE EMP2;
CREATE TABLE EMP2
AS (
    SELECT *
        FROM EMP
    );

CREATE TABLE DEPT2
AS (
        SELECT *
            FROM DEPT
    );
--시퀀스 생성
--오라클에서 START WITH로 시작하는 구문이 있어서 탭을 안 주면 START WITH 구문으로 인식
CREATE SEQUENCE EMP2_ENO_SEQ
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOMINVALUE
    NOCYCLE
CACHE 20;

--옵션 없는 시퀀스 생성
--기본 옵션으로 사용하려면 옵션 없이 생성하면 됨
CREATE SEQUENCE DEPT2_DNO_SEQ;


--생성된 시퀀스 조회----------------------------------------------------
SELECT SEQUENCE_NAME,
       MAX_VALUE,
       MIN_VALUE,
       INCREMENT_BY,
       CACHE_SIZE,
       LAST_NUMBER,
       CYCLE_FLAG
    FROM USER_SEQUENCES;
------------------------------------------------------------------------
SELECT * FROM EMP2;
--시퀀스 사용
DELETE FROM EMP2;
COMMIT;

INSERT INTO EMP2(
    ENO,
    ENAME
) VALUES (
    --시퀀스의 사용
    EMP2_ENO_SEQ.NEXTVAL,
    '첫 번째'
);
SELECT * FROM EMP2;
COMMIT;

--시퀀스는 테이블 명을 사용하긴 하지만 값을 할당받는다기보다 
--새로운 객체를 만든다고 보면 된다.

--현재까지 할당 받은 시퀀스 값 확인---------------------------------------------
SELECT EMP2_ENO_SEQ.CURRVAL
    FROM DUAL;
    
--시퀀스 생성 안 할 때는 아래 방법으로 많이 사용함
DELETE FROM DEPT2;

INSERT INTO DEPT2(
    DNO,
    DNAME
) VALUES (
    (
        SELECT NVL(MAX(DNO), 0) + 1
            FROM DEPT2
    ),
    '두 번째'
);


COMMIT;
SELECT * FROM DEPT2;

--15번
--NATURAL JOIN
--각 사원의 사원번호, 사원이름, 부서번호, 부서이름 조회
SELECT ENO,
       ENAME,
       DNO,
       DNAME
    FROM EMP 
    NATURAL JOIN DEPT;  --A의 DNO와 B의 서로 이름과 값이 같은 DNO가 자동으로 조인됨
    
SELECT A.ENO,
       A.ENAME,
       A.DNO,
       B.DNAME
    FROM EMP A,
         DEPT B
    WHERE A.DNO = B.DNO;
    
--NATURAL JOIN 이용해서
--광주에서 근무하는 사원의 사원번호, 사원이름, 부서번호, 부서이름, 부서지역 조회
SELECT ENO,
       ENAME,
       DNO,
       DNAME,
       LOC
    FROM EMP
    NATURAL JOIN DEPT
    WHERE LOC='광주';
    
--16번
--USING 조인
--화학과 2학년 학생들의 기말고사 점수를 조회(학생번호, 학생이름, 학과이름, 학년, 과목번호, 과목명, 점수)
SELECT SNO,
       SNAME,
       MAJOR,
       SYEAR,
       CNO,
       CNAME,
       RESULT
    FROM STUDENT
    JOIN SCORE USING(SNO)
    JOIN COURSE USING(CNO)
    WHERE SYEAR = 1
    AND MAJOR = '화학';

--17번
--다중 열의 IN 연산자
--손하늘 사원과 같은 관리자의 관리를 받으면서 업무도 동일한 사원 조회
SELECT ENO,
       ENAME,
       MGR,
       JOB
    FROM EMP
    WHERE (MGR, JOB) IN (   
                            SELECT MGR,
                                   JOB
                                FROM EMP
                                WHERE ENAME = '손하늘'
                        )
    AND ENAME !='손하늘';


--김연아 사원과 부서와 업무가 동일한 사원번호, 사원이름, 부서번호, 업무 조회
SELECT ENO,
       ENAME,
       DNO,
       JOB
    FROM EMP
    WHERE (JOB, DNO) IN (SELECT JOB,
                            DNO
                            FROM EMP
                            WHERE ENAME='김연아')
    AND ENAME!='김연아';




--화학과 학생과 같은 학년에서 평점이 동일한 학생번호, 학생이름, 학년, 학과 평점 조회(STUDENT 테이블 사용)
    
SELECT SNO,
       SNAME,
       SYEAR,
       MAJOR,
       AVR
    FROM STUDENT
    WHERE (SYEAR,AVR) IN (SELECT SYEAR,
                                  AVR
                            FROM STUDENT
                            WHERE MAJOR='화학') 
    AND MAJOR !='화학'
    ORDER BY SYEAR, AVR DESC; --IN(서브쿼리)에 SYEAR, AVR 한 행씩 나오는데 두개의 값이 모두 동일한 값만 찾음



    
--18~20번
--CASE WHEN, DECODE 구문 (자바 SWITCH랑 비슷한듯)
--모델링, 분석 업무는 20%인상 나머지 업무는 10%인상
SELECT ENO,
       ENAME,
       JOB,
       SAL,
       CASE JOB WHEN '모델링' THEN SAL*1.2
                WHEN '분석' THEN SAL*1.2
                ELSE SAL*1.1
        END AS UPSAL
    FROM EMP;



SELECT ENO,
       ENAME,
       JOB,
       DECODE(JOB, '모델링', SAL*1.2, '분석', SAL * 1.2, SAL*1.1) AS SAL
       FROM EMP;

--화학과 학생들만 4.5점으로 환산된 평점으로 조회(학생번호, 학생이름, 학과, 평점)
SELECT SNO,
       SNAME,
       MAJOR,
       AVR,
    CASE MAJOR WHEN '화학' THEN AVR/4*4.5
    END AS CAVR
    FROM STUDENT;

    
SELECT SNO,
       SNAME,
       MAJOR,
       AVR,
       DECODE(MAJOR, '화학', AVR/4*4.5,AVR) AS CAVR
    FROM STUDENT;

--조건을 이용한 CASE WHEN 구문
--연봉이 5000 이상은 A등급, 4000<=연봉<=5000은 B등급, 나머지는 C등급
--사원번호, 사원이름, 연봉, 등급 조회(CASE WHEN 구문 사용)
SELECT ENO,
       ENAME,
       SAL,
       CASE WHEN SAL > 5000 THEN 'A'
            WHEN SAL BETWEEN 4000 AND 5000 THEN 'B'
            ELSE 'C'
        END AS GRADE
    FROM EMP;


--21번
--START WITH ... CONNECT BY PRIOR
SELECT LEVEL
        , ENO
        , ENAME
        , MGR
        FROM EMP
        START WITH ENAME = '안영희'
        CONNECT BY PRIOR ENO = MGR  --MGR = ENO , ENO = MGR 순서에 따라 상향, 하향으로 조회(부모,자식)
        ORDER BY LEVEL;
        
--계층관계를 보기 편하게 표출(댓글 기능에 쓰일만한것)
SELECT LPAD(ENAME, LENGTHB (ENAME) + (LEVEL * 3) - 3, ' ') AS EMP_LEVEL
    FROM EMP
    START WITH ENAME = '안영희'
    CONNECT BY PRIOR ENO = MGR;