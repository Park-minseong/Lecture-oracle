1) 어제 만든 PAYMENT 테이블의 PDATE 컬럼에 INDEX를 추가하세요.
CREATE INDEX PAYMENT_PDATE_IDX
    ON PAYMENT(PDATE);

2) 어제 만든 PAYMENT_DETAIL 테이블의 AMOUNT, PRICE 컬럼에 INDEX를 추가하세요.
CREATE INDEX PAYMENT_DETAIL_AMOUNT_IDX
    ON PAYMENT_DETAIL(AMOUNT);
    
CREATE INDEX PAYMENT_DETAIL_PRICE_IDX
    ON PAYMENT_DETAIL(PRICE);
    



    

