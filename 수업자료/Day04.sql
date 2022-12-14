1. 서브쿼리를 이용한 INSERT INTO 구문
    - 기존 INSERT INTO 구문은 단일 행 입력만 가능
    - 서브쿼리를 이용하여 INSERT INTO 구문을 작성하면 여려개의 행 입력
    - INSERT INTO 테이블 명(
        컬럼1,
        컬럼2,
        컬럼3,
        ...
    )
    SELECT 구문;
    - 서브쿼리에서 조회한 컬럼개수와 INSERT INTO 구문의 컬럼 개수가 일치해야함
    - 서브쿼리에서 조회한 컬럼의 데이터 타입과 INSERT INTO 구문의 컬럼의 데이터 타입이 일치해야 됨
2. 서브쿼리를 이용한 UPDATE 구문
    - UPDATE 테이블명
        SET 컬럼1 = (SELECT 구문1),
            컬럽2 = (SELECT 구문2),
            ...
      WHERE 조건
    - 서브쿼리에 결과는 단일행, 단일열 즉 데이터가 하나 씩
    - 컬럼과 서브쿼리 결과의 데이터 타입이 일치해야됨
    - UPDATE 테이블 명
      SET (컬럼1, 컬럼2, 컬럼3, ...)=(SELECT 구문)
      WHERE 조건;
    - 컬럼의 개수와 서브쿼리 결과의 컬럼의 개수가 일치해야됨
    - 컬럼의 데이터타입과 서브쿼리의 데이터 타입도 일치해야 됨
    - 서브쿼리의 결과가 단일행이어야 됨
3. 트랜젝션(TRANSACTION)
    - 트랜잭션은 SQL문이 실행되는 최소한의 작업 단위
    - 항상 COMMIT과 ROLLBACK을 동반
    - 트랙잭션의 특징
        원자성: 트랜잭션은 전체가 처리되거나 취소될 수 있지만 일부만 처리, 취소는 불가능
        일반성: 트랜젝션이 실행된 후 데이터베이스는 무결성을 유지해야됨
        독립성: 트랜잭션이 여러개가 실행되도 각각의 트랜잭션에 영향을 끼칠 수 없음
        영속성: 트랜잭션의 결과는 반드시 데이터베이스에 반영
    - 트랜잭션의 시작
        DML(INSERT, UPDATE, DELETE)구문
        DDL(CREATE, ALTER, DROP, TRUNCATE)
        DCL(GRANT, REVOKE) 구문이 실행됐을 때 트랜잭션이 시작됨
    - 트랜잭션의 종류
        DML구문 실행 후 COMMIT, ROLLBACK 명령이 실행되면 트랜잭션 종료
        DDL, DCL구문 실행 후에는 자동으로 트랜잭션 종료
        사용자가 정상 종료 시 트랜잭션 종료
4. 테이블 생성과 데이터 타입과
    - 테이블 생성
        CREATE TABLE 테이블명(
            컬럼명1 데이터타입 (DEFAULT 값) 제약조건,
            컬럼명2 데이터타입 제약조건,
            ...
            테이블 단위의 제약조건
        )
        데이터타입: 컬럼에 입력될 데이터의 형식과 길이 지정
        DEFAULT: 입력값이 누락됐을 떄 기본적으로 입력되는 값
                 DEFAULT 설정하지 않고 입력 값을 누락하면 NULL 값이 입력
        컬럼 단위 제약조건: PK, FK, UK, CHECK, NOT NULL 설정
        테이블 단위 제약조건: PK, FK, UK, CHECK 설정
    - 테이블의 삭제
        DROP TABLE 테이블명
        (CASCADE CONSTRAINT);
        CASCADE CONSTRAINT: 다른 테이블들과 관련된 제약조건을 먼저 삭제하고 테이블 삭제
5. 데이터 타입과
    - 문자 타입 
        VARCHAR2: 가변 길이 문자타입(4000바이트까지 사용가능)
        CHAR: 고정 길이 문자타입(2000바이트까지 사용 가능)
    - 숫자 타입
        NUMBER(n, p): n은 숫자의 전체 자리수
                      p는 소수점 이하 자리수
                      소수점이하의 값이 없을 때는 자리수를 지정안하는 걸 권장
    - 날짜 타입
        DATE: 입출력 형식과 무관하게 YYYY/MM/DD:HH24:MI:SS 형식으로 저장
    - 이진타입
        BLUB: 4GB까지 저장가능한 이진 타입
              원본 파일의 이진 데이터를 저장하여 나중에 사용할 수 있음
6. CHAR와 VARCHAR2 의 차이
    - CHAR는 고정길이아서 어떤 데이터가 들어와도 생성할 때 지정한 크기만큼 차지
    - VARCHAR2는 가변길이라서 데이터의 크기에 따라 크기 변화
    - CHAR는 항상 고정된 값(사용여부, 삭제여부, 탈퇴여부) 등 1바이트를 표시
    - VARCHAR2는 데이터의 크기가 일정하지 않은(아이티, 글제목, 글내용) 등에 사용
7. 제약 조건
    - 테이블의 무결성을 보장해주는  규칙
    - 데이터의 입력, 수정, 삭제 등 변경이 일어났을 때 잘못된 트랜잭션이 수행되지 않도록 결함을 유발시켜서 작업을 방지
    - PK(Primary Key), FK(Foreign Key)이 RDB의 근간
    - 모든 테이블은 PK를 가져야되고 FK를 통해서 테이블들 간의 관계를 설정
8. PK(Primary Key)
    - 테이블의 모든 데이터를 유일하게 식별해주는 식별자
    - PK로 설정된 컬럼의 중복 데이터는 허용되지 않음
    - PK로 설정된 컬럼은 자동으로 NOT NULL이 설정됨
    - 테이블을 생성할 때 할상 PK를 지정
    - PK 지정 방식1 - 컬럼 단위에서 지정
        CREATE TABLE 테이블명(
            컬럼1 데이터타입 CONSTRAINT 제약조건이름 PRIMARY KEY,
            컬럼2 ...
        );
    - PK 지정 방식 2 - 테이블 단위에서 지정
        CREATE TABLE 테이블 명(
            컬럼1 데이터타입,
            컬럼2 데이터타입,
            컬럼3 ...
            CONSTRAINT 제약조건이름 PRIMARY KEY(PK로 지정할 컬럼명)
        );
9. FK(Foreign Key)
    - FK는 테이블 간의 관계를 뜻함
    - 다른 테이블에서 참조해오는 키 값
    - FK를 설정하면 테이블간의 종속성이 생성(부모, 자식관계)
    - FK 지정 방식1 - 컬럼 단위에서 지정
        CREATE TABLE 테이블 명(
            컬럼1 데이터타입 CONSTRAINT 제약조건이름 FOREIGN KEY
                                REFERENCES 참조할 테이블 명(참조할 컬럼명)
                                (ON DELETE CASCADE),
            컬럼2 ...
        );
    - FK 지정 방식2 - 테이블 단위에서 지정
        CREATE TABLE 테이블 명(
            컬럼1 데이터타입,
            컬럼2 데이터타입,
            컬럼3 ...
            CONSTRAINT 제약조건이름 FOREIGN KEY(컬럼명)
            REFERENCES 참조할 테이블명(참조할 컬럼명)
            (ON DELETE CASCADE)
        );
    - 부모의 테이블의 컬럼에 존재하는 값만 FK 값으로 입력가능
    - FK가 설정된 부모테이블의 데이터는 삭제가 불가능
    - 참조하는 컬럼과 FK 로 지정될 컬럼의 데이터타입이 일치해야됨
    - FK로 참조되는 부모테이블의 컬럼은 PK, UK여야됨
10. 다중 PK
    - CREATE TABLE 테이블 명(
            컬럼1 데이터타입,
            컬럼2 데이터타입,
            컬럼3 ...
            CONSTRAINT 제약조건이름 PRIMARY KEY(PK로 지정할 컬럼명1, 컬럼명2)
            );
    - 다중 PK를 설정하는 이유는 데이터의 구조때문이다.
      EX) B_FILE
          NO NUMBER FK
          FILE_NO PK
          FILE_NAME VARCHAR2(100)

          BOARD NO 1
          B_FILE FILE_NO 1 2 3 4
          BOARD NO 2
          B_FILE FILE_NO 1 2 3 4
          (컬럼1, 컬럼2)의 중복 값이 없으면 데이터 입력 허용

11. UK(Unique Key), NOT NULL, CHECK
    - UK는 중복된 값을 허용하지 않는 제약조건
    - 하지만 NULL값은 중복으로 여러개 입력 가능
    - UK 지정 방식1 - 컬럼 단위 지정
        CREATE TABLE 테이블명(
            컬럼1 데이터타입 CONSTRAINT 제약조건이름 UNIQUE,
            ...
        );
    - UK 지정 방식2 - 테이블 단위 지정
        CREATE TABLE 테이블명(
            컬럼1 데이터타입,
            컬럼2 데이터타입,
            ...
            CONSTRAINT 제약조건이름 UNIQUE(UK 지정할 컬럼명)
        );
    - NOT NULL은 테이블 단위에서 지정불가능
    - NOT NULL이 지정된 컬럼은 NULL값 입력이 불가능
    - NOT NULL 지정 방식
        CREATE TABLE 테이블면(
            컬럼1 데이터타입 NOT NULL,
            컬럼2 데이터타입,
            ...
        );
    - CHECK는 입력될 데이터에 조건 명시
    - CHECK로 선언된 컬럼에는 CHECK선언 시 명시된 데이터만 입력가능
    - CHECK조건 선언 방식은 WHERE 구문과 같다
    - CHECK 지정 방식1 - 컬럼 단위 지정
        CREATE TABLE 테이블명(
            컬럼1 데이터타입 CONSTRAINT 제약조건이름 CHECK (조건),
            ...
        );
    - CHECK 지정 방식2 - 테이블 단위 지정
        CREATE TABLE 테이블명(
            컬럼1 데이터타입,
            ...
            CONSTRAINT 제약조건이름 CHECK (조건)
        );