/*
1) ���� ������ ���� ���̺��� �����ϼ���.
FACTORY ���̺� - FNO NUMBER PK          : �����ȣ
                FNMAE VARCHAR2(50)      : �����̸�
                LOC VARCHAR2(10)        : ������ġ
GOODS ���̺� - GNO NUMBER PK            : ��ǰ��ȣ
              GNAME VARCHAR2(50)        : ��ǰ�̸�
              PRI NUMBER                : ��ǰ�ܰ�
              FNO NUMBER FK             : �����ȣ
PROD ���̺� - PNO NUMBER PK             : ��ǰ��ȣ
              GNO NUMBER FK             : ��ǰ��ȣ
              PRICE NUMBER              : ���ܰ�
              PDATE DATE                : ��������
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
2) ���� ������ ���� ���̺��� �����ϼ���.
PRODUCT ���̺� - PNO NUMBER PK              : ��ǰ��ȣ
                PNMAE VARCHAR2(50)          : ��ǰ�̸�
                PRI NUMBER                  : ��ǰ�ܰ�
PAYMENT ���̺� - MNO NUMBER PK              : ��ǥ��ȣ
                PDATE DATE NOT NULL         : �Ǹ�����
                CNAME VARCHAR2(50) NOT NULL : ����
                TOTAL NUMBER TOTAL > 0      : �Ѿ�
PAYMENT_DETAIL - MNO NUMBER PK FK           : ��ǥ��ȣ
                PNO NUMBER PK FK            : ��ǰ��ȣ
                AMOUNT NUMBER NOT NULL      : ����
                PRICE NUMBER NOT NULL       : �ܰ�
                TOTAL_PRICE NUMBER NOT NULL TOTAL_PRICE > 0 : �ݾ�
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
    
