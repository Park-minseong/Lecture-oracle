1) ������ ���� ���� �⵵ �λ� �޿��� �˻��ϼ���. (CASE, DECODE ���� �� ������ ��� ǥ��)
     �޿�          �λ���
   1000 ����   ->   15%
   1001~2000   ->   10%
   2001~3000   ->   5%
   3001~4000   ->   2%
   4000 �ʰ�   ->   ����
   
SELECT ENAME,
       SAL,
       CASE WHEN SAL<=1000 THEN SAL*1.15
            WHEN SAL BETWEEN 1001 AND 2000 THEN SAL*1.1
            WHEN SAL BETWEEN 2001 AND 3000 THEN SAL*1.05
            WHEN SAL BETWEEN 3001 AND 4000 THEN SAL*1.02
            ELSE SAL 
        END AS USAL
    FROM EMP
    ORDER BY USAL;   

SELECT ENAME,
       SAL,
       DECODE(CEIL(SAL/1000), 1, SAL*1.15,
                              2, SAL*1.1,
                              3, SAL*1.05,
                              4, SAL*1.02,
                              SAL) AS USAL
    FROM EMP
    ORDER BY USAL;


2) �л����� ��� ������ �˻��ϵ� ���� �縶�� �л��� ��� ������ 4.5������ ȯ���Ͽ� �˻��ϼ���.(DECODE ���� �̿�)
SELECT SNAME,
       DECODE(SUBSTR(SNAME,1,2), '�縶', AVR*4.5/4.0, AVR) AS AVR
    FROM STUDENT
    ORDER BY SNAME;
