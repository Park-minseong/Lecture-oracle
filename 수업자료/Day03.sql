1. 단일 행 함수
    - 오라클에서 SQL쿼리문을 효율적으로 만드는 데 도움이 되기위한 함수들을 제공한다.
    - 단일 행 함수의 종류
        문자함수
        숫자함수
        날짜함수
        변환함수
        일반함수
    - 단일 행 함수는 SELECT, WHERE, HAVING 구문 어디든 사용가능
    - 단일 행 함수의 결과 값은 입력 값마다 하나씩 변환
2. 문자 함수
    - LOWER: 문자열을 영문자 소문자로 반환
    - UPPER: 문자열을 영문자 대문자로 반환
    - INITCAP: 문자열의 첫 글자만 대문자로 나머지는 소문자로 반환
    - 함수명(컬럼명)
3. 문자 연산 함수
    - CONCAT: 문자열 병합하여 반환
              CONCAT(문자열1, 문자열2)
    - SUBSTR: 문자열 잘라서 반환
              SUBSTR(문자열, 시작위치, 출력문자 개수)
    - LENGTH: 문자열의 길이 반환
              LENGTH(문자열)
    - LENGTHB: 문자열의 바이트 크기 반환
              LENGTHB(문자열)
    - INSTR: 지정된 문자의 위치 반환
             INSTR(문자열, 지정문자)
    - TRIM: 접두어나 접미사 잘라서 반환
            TRIM(leading | trailing | both FROM 문자열)
            TRIM(문자열): 공백제거
    - LPAD: 지정된 문자열의 길이만큼 빈부분 앞에서부터 문자 채워서 반환
            LPAD(문자열, 길이, 채울문자)
            ex) LPAD('20000', 10, '*') -> *****20000
    - RPAD: 지정된 문자열의 길이만큼 빈부분 뒤에서부터 문자 채워서 반환
            LPAD(문자열, 길이, 채울문자)
            ex) LPAD('20000', 10, '*') -> 20000*****
4. DUAL 테이블
    - 오라클에서 제공하는 기본 테이블
    - 현재날짜, 간단한 연산의 결과값을 출력할 때 사용
    - DUAL 테이블의 소유는 SYS계정이지만 모든 USER 에서 사용가능
5. 문자 치환 함수
    - TRANSLATE: 문자단위로 치환된 값 반환
                 TRANSLATE(문자열, 치환된 문자, 치환할 문자)
                 ex) TRANSLATE('ORACLE', 'A', '#') -> 'OR#CLE'
    - REPLACE: 문자열 단위로 치환된 값 변환
               REPLACE(문자열, 치환된 문자열, 치환할 문자열)
               ex) REPLACE('ORACLE','OR','##') -> '##ACLE'
6. 숫자 함수
    - ROUND: 반올림 값 반환
             ROUND(m,n): n자리까지 반올림
    - TRUNC: 버림 값 반환
             TRUNC(m,n): n자리 미만 버림
    - MOD: 나머지 값 반환
           MOD(m, n): m을 n으로 나눈 나머지 값
    - POWER: 승 계산 값 반환
             POWER(m, n): m의 n승 값
    - CEIL: 피연산자 이상인 제일 작은 정수 반환
            CEIL(m): m보다 큰 제일 작은 정수 반환
    - FLOOR: 피연산자 이하인 제일 큰 정수 반환
             FLOOR(m): m보다 작은 제일 큰 정수 반환
    - ABS: 절대 값 반환
           ABS(m): m의 절대 값
    - SQRT: 제곱근 값 반환
            SQRT(m): m의 제곱근 값
    - SIGN: 피연산자가 음수면 -1, 양수면 1, 0이면 0
            SIGN(m):m의 부호에 따라 -1,1,0 값중 하나 반환
7. 날짜 데이터 연산
    - 오라클에서 DATE(날짜형식) 아입은 6바이트로 계산
    - DATE(날짜형식) 타입은 'YYYY/MM/DD HH24:MI:SS'까지의 형식 갖고있음
    - 날짜의 출력형식 변경
      ALTER SESSION SET NLS_DAT_FORMAT = '출력할 날짜 형식 지정'
      ALTER SESSION: 현재 오라클에 연결된 세션 정보 변경
      NLS_DATE_FORMAT: 날짜 출력 형식
8. 날짜 연산
    - 날짜 + 숫자: 숫자 일 이후의 날짜 반환
                  ex) SYSDATE + 100: 100일 이후의 날짜
    - 날짜 - 숫자: 숫자 일 이전의 날짜 반환
                  ex) SYSDATE + 100: 100일 이전의 날짜
    - 날짜 + OR - 숫자 / 24: 시간을 더하거나 뺀 날짜 반환 
                  ex) SYSDATE - 100 /24: 100일의 시간을 뺀 날짜
    - 날짜 - 날짜: 두 날짜간의 차이 일수 반환
9. 날짜 함수
    - ROUND: 형식에 맞춰 반올림한 날짜 반환
             ROUND(날짜, 날짜 형식)
    - TRUNC: 형식에 맞춰 잘라낸 날짜 반한
             TRUNC(날짜, 날짜 형식)
    - MONTHS_BETWEEN: 두 날짜간의 기간을 개월수로 반환
                      MONTHS_BETWEEN(날짜1, 날짜2) -> 날짜1 - 날짜2의 차이를 개월 수로 반환
    - ADD_MONTHS: 날짜에 피연산자 달을 더한 날짜 반환
                 ADD_MONTHS(날짜, 숫자): 날짜 + 숫자 달인 날짜 반환
    - NEXT_DAY: 날짜 이후 지정된 요일에 해당하는 날짜 반환
                NEXT_DAY(날짜, 요일)
                요일에는 해당요일의 정수 값이나 SUN, 일요일 영문자나 한글 가능
    - LAST_DAY: 지정된 날짜가 포함된 월의 마지막 날짜 반환
                LAST_DAY(날짜)
            
10. 변환 함수
    - 문자를 숫자로, 숫자나 날짜를 문자료, 문자열을 날짜로 변환할 때 사용
    - TO_CHAR: 숫자나 날짜를 문자열로 변환
               TO_CHAR(숫자나 날짜, 출력 형식)
    - TO_NUMBER: 문자열을 숫자로 변환
                 TO_NUMBER(문자열,출력형식)
    - TO_DATE: 문자열을 날짜로 변환
               TO_DATE(문자열, 출력형식)
    - TO_CHAR에서 숫자가 입력됐을 때 지정할 수 있는 출력형식
      9: 숫자의 출력폭 지정
      0: 선행 0표시
      $: 화폐 표기
      L: 지역 화폐 표기
      ,: 쉼표 위치 지정
      .: 마침표 위치 지정
      MI: 음수 표기
      EEEE: 실수 표현법 사용
    - TO_CHAR 에 날짜 입력되거나 TO_DATE의 출력 형식
      YYYY: 년도를 네자리로 표현
      YY: 년도를 두자리로 표시
          앞 두자리는 현재의 앞 두자리
          '99'->'2099'
      RR: 년도를 두자리로 표시
          앞 두자리는 가까운 년도의 앞 두자리
          '99'->'1999'
      MM: 월 두자리로 표시
      MONTH: 월을 한글이나 영문으로 표시
             MARCH, 3월 ...
      MON: 월을 한글이나 영문의 약자로 표시(한글은 MONTH와 동일)
           MAR, 3월
      DAY: 영문이나 한글 요일로 표시
           MONDAY, SUNDAY, 월요일, 일요일
      DY: 일을 영문의 약자나 한글의 약자로 표시
          MON, SUN, 월, 일
      HH24: 시간을 1~24까지 표시
      HH: 시간을 1~12까지 표시
          정확한 표시를 위해 AM,PM 추가 권장
      MI: 분을 두자리로 표현
      SS: 초를 두자리로 표현
      SSSSSS: 하루를 초로 환산한 다음 표시(0 ~ 86399)
      AM/PM: 오전/오후를 표시
11. 그룹 함수
    - 여러 행에 대한 통계를 계산할 때 사용하는 함수
    - 그룹 함수는 여러 개의 결과 값 반환
    - MAX: 값들 중 최대 값
    - MIN: 값들 중 최소 값
    - AVG: 평균 값
    - COUNT: 행의 개수
    - SUM: 값의 총합
    - STDDEV: 값들의 표준 편차
    - VARIANCE: 값들의 분산 값
    - 그룹 함수는 GROUP BY 키워드 없이 사용 불가능
    - GROUP BY 컬럼: 입력된 컬럼의 공통된 값들을 묶어서 그룹화함
    - GROUP BY 주의점
        SELECT 구문에 포함된 컬럼들은 모두 GROUP BY로 묶어야됨
12. 그룹 함수와 HAVING 구문
    - GROUP BY 구문에 조건 추가할 때는 HAVING 구문 사용
    - HAVING 구문은 GROUP BY 에 의해 그룹화됨 컬럼의 조건만 지정 가능
    - 그룹화되지 않은 컬럼들은 WHERE구문으로 조건 적용

13. SELECT구문의 순서
    - SELECT 조회할 컬럼
        FROM 테이블 명
        WHERE 조건
        GROUP BY 그룹화될 컬럼
        HAVING 그룹화된 컬럼의 조건
        ORDER BY 순서

14. DML(Data Manipulation Language)
    - 데이터를 입력, 수정, 삭제하는 명령어를 뜻함
    - 오라클에서는 트랜재션이라는 명칭으로 일련의 작업들을 관리
    - 트랜잭션은 작업의 단위
    - 트랜잭션에서는 항상 작업완료 명령어가 필요함
    - 수정사항 저장 COMMIT
    - 수정사항 취소 ROLLBACK
    - 트랜잭션을 완료시키지 않으면 데드락 상태가 돼서 테이블 접근 불가능
15. 데이터를 입력하는 INSERT INTO 구문
    - 지정된 컬럼만 데이터 입력
    - 지정한 컬럼의 개수와 입력한 값의 개수가 일치해야 함
        INSERT INTO 테이블명(
            컬럼1,
            컬럼2,
            ...
        )VALUES(
            값1,
            값2,
            ...
        )
    - 모든 컬럼에 데이터 입력
    - 테이블의 컬럼의 개수와 입력한 값의 개수가 일치해야 함
        INSERT INTO 테이블명 VALUES(
            값1,
            값2,
            값3,
            ...
        )
16. 데이터의 값을 변경하는 UPDATE 구문
    - UPDATE 테이블 명
        SET 컬럼1 = 값1,
            컬럼2 = 값2,
            ...
      WHERE 조건;
17. 데이터의 값을 삭제하는 DELETE 구문
    - DELETE FROM 테이블 명
        WHERE 조건;