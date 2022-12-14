/*
1) 다음 구조를 갖는 테이블을 생성하세요.
FACTORY 테이블 - FNO NUMBER PK          : 공장번호
                FNMAE VARCHAR2(50)      : 공장이름
                LOC VARCHAR2(10)        : 공장위치
GOODS 테이블 - GNO NUMBER PK            : 제품번호
              GNAME VARCHAR2(50)        : 제품이름
              PRI NUMBER                : 제품단가
              FNO NUMBER FK             : 공장번호
PROD 테이블 - PNO NUMBER PK             : 상품번호
              GNO NUMBER FK             : 제품번호
              PRICE NUMBER              : 출고단가
              PDATE DATE                : 생산일자
*/

CREATE TABLE FACTORY(
    FNO NUMBER,
    FNAME VARCHAR2(50),
    LOC VARCHAR2(10),
    CONSTRAINT FACTORY_FNO_PK PRIMARY KEY(FNO)
);

CREATE TABLE GOODS(
    GNO NUMBER,
    GNAME VARCHAR2(20),
    PRI NUMBER,
    FNO NUMBER,
    CONSTRAINT GOODS_GNO_PK PRIMARY KEY(GNO),
    CONSTRAINT GOODS_FNO_FK FOREIGN KEY(FNO) REFERENCES FACTORY(FNO)
);  

CREATE TABLE PROD(
    PNO NUMBER,
    GNO NUMBER,
    PRICE NUMBER,
    PDATE DATE,
    CONSTRAINT PROD_PNO_PK PRIMARY KEY(PNO),
    CONSTRAINT PROD_GNO_FK FOREIGN KEY(GNO) REFERENCES GOODS(GNO)
);    

/*
2) 다음 구조를 갖는 테이블을 생성하세요.
PRODUCT 테이블 - PNO NUMBER PK              : 제품번호
                PNMAE VARCHAR2(50)          : 제품이름
                PRI NUMBER                  : 제품단가
PAYMENT 테이블 - MNO NUMBER PK              : 전표번호
                PDATE DATE NOT NULL         : 판매일자
                CNAME VARCHAR2(50) NOT NULL : 고객명
                TOTAL NUMBER TOTAL > 0      : 총액
PAYMENT_DETAIL - MNO NUMBER PK FK           : 전표번호
                PNO NUMBER PK FK            : 제품번호
                AMOUNT NUMBER NOT NULL      : 수량
                PRICE NUMBER NOT NULL       : 단가
                TOTAL_PRICE NUMBER NOT NULL TOTAL_PRICE > 0 : 금액
*/
CREATE TABLE PRODUCT(
    PNO NUMBER,
    PNAME VARCHAR2(50),
    PRI NUMBER,
    CONSTRAINT PRODUCT_PNO_PK PRIMARY KEY(PNO)
);   

CREATE TABLE PAYMENT(
    MNO NUMBER,
    PDATE DATE NOT NULL,
    CNAME VARCHAR2(50) NOT NULL,
    TOTAL NUMBER,
    CONSTRAINT PAYMENT_MNO_PK PRIMARY KEY(MNO),
    CONSTRAINT PAYMENT_TOTAL_CK CHECK(TOTAL >0)
); 

CREATE TABLE PAYMENT_DETAIL(
    MNO NUMBER,
    PNO NUMBER,
    AMOUNT NUMBER NOT NULL,
    PRICE NUMBER NOT NULL,
    TOTAL_PRICE NUMBER NOT NULL CONSTRAINT PAYMENT_DETAIL_TOTAL_PRICE_CK CHECK(TOTAL_PRICE > 0),
    CONSTRAINT PAYMENT_DETAIL_PK PRIMARY KEY(MNO, PNO),
    CONSTRAINT PAYMENT_DETAIL_MNO_FK FOREIGN KEY(MNO) REFERENCES PAYMENT(MNO),
    CONSTRAINT PAYMENT_DETAIL_PNO_FK FOREIGN KEY(PNO) REFERENCES PRODUCT(PNO)
);    
    
