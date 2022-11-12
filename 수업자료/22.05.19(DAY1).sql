--SELECT ����
--������ �÷��� �����͸� ��ȸ
SELECT ENO,
    ENAME
    FROM EMP;

--��� �÷��� ������ ��ȸ
-- * Ű���� �̿�
SELECT *
    FROM EMP;
    
--��ȸ�ϴ� �÷��̳� ���̺� ��Ī ���̱�(AS��������)
SELECT ENO AS �����ȣ,
       ENAME AS ����̸�
    FROM EMP;

SELECT ENO,
       ENAME,
       (SAL / 12) AS MONTHPAY
    FROM EMP;
    
--NVL    
SELECT ENO,
       ENAME,
       COMM
    FROM EMP;
    
SELECT ENO,
       ENAME,
       --COMM�÷��� �����Ͱ� null�� ��� 0���� ǥ��
       NVL(COMM, 0) AS COMM
    FROM EMP;
    
--���Ῥ����(||)
SELECT ENO || '-' || ENAME || '-' || SAL AS �����������
    FROM EMP;
    
SELECT ENO || '-' || ENAME || '-' ||(NVL(SAL, 0)/12) AS �����������
    FROM EMP;
    
--�ߺ�������(DISTINCT)
SELECT * FROM EMP;

SELECT JOB FROM EMP;

SELECT DISTINCT JOB
    FROM EMP;
    
SELECT DISTINCT *
    FROM EMP;    

--������ �� ����ϴ� ORDER BY ����
SELECT * FROM EMP
    ORDER BY SAL ASC;
    
SELECT * FROM EMP
    ORDER BY SAL DESC;
    
--ORDER BY�� ���� ���� �˻�
SELECT ENO,
       ENAME,
       JOB
    FROM EMP
    ORDER BY JOB;
    
--ORDER BY�� ���� ���� �÷� ����
SELECT ENO,
       ENAME,
       JOB
    FROM EMP
    ORDER BY JOB, ENO;

--���� ���� �÷� ������ ���ļ��� ����
--�μ���ȣ�� ��������, ������ �������� ����
SELECT DNO,
       ENAME,
       SAL
    FROM EMP
    ORDER BY DNO ASC, SAL DESC;
   
--��ȸ�ϴ� �÷��� ��Ī�� �ο��� ���� ��Ī���� ���ı����� ���� �� ����
SELECT DNO AS �μ���ȣ,
       ENAME AS ����̸�,
       SAL AS ����
    FROM EMP
    ORDER BY �μ���ȣ ASC, ���� DESC;
    
--���ǰ˻� WHERE ����
--ENO 9999�� ��� �˻�
--WHERE ���� ������ �ڷ��� ���缭 ��
--TO_CHAR(������)�� �����Ͱ��� varchar�������� ��ȯ
SELECT * FROM EMP
    WHERE ENO = '9999';
    
--SAL�� 3000 �̻��� ����� �����ȣ, ����̸�, ���� �˻�
--ORDER BY�� WHERE ���� �ڿ� ���
--WHERE ������ ��Ī �ٱ����� �����ϹǷ� ��Ī���� ��� �Ұ���
SELECT ENO AS �����ȣ,
       ENAME AS ����̸�,
       SAL AS ����
    FROM EMP
    WHERE SAL>=3000
    ORDER BY ���� DESC;
    
--SAL�� 3000�̻��̸鼭 DNO�� 30�� �����ȣ, ����̸�, ����, �μ���ȣ ��ȸ
SELECT ENO AS �����ȣ,
       ENAME AS ����̸�,
       SAL AS ����,
       DNO AS �μ���ȣ
    FROM EMP
    WHERE SAL>=3000
    AND DNO = 30;
    
--IS NULL
--�μ���ȣ�� null����� �����ȣ, �̸�, �μ���ȣ �˻�
SELECT DISTINCT ENO,
       ENAME,
       DNO
    FROM EMP
    WHERE DNO IS NULL;
    
SELECT DISTINCT ENO,
       ENAME,
       DNO
    FROM EMP
    WHERE DNO IS NOT NULL;
    
--OR ����
--DNO�� 30�̰ų� SAL 3000�̻��� ����� �����ȣ, �̸�, ����, �μ���ȣ ��ȸ
SELECT ENO,
       ENAME,
       SAL,
       DNO
    FROM EMP
    WHERE DNO = '30'
       OR SAL >= 3000;
       
--DNO�� 10�̰ų� SAL�� 1600 �̻� ��� �� COMM�� 600�̻��� �����
--�����ȣ, ����̸�, ����, ���ʽ�, �μ���ȣ �˻�
--AND�� �켱������ ���Ƽ� OR�� ()��� ���
SELECT ENO,
       ENAME,
       SAL,
       COMM,
       DNO
    FROM EMP
    WHERE (DNO = '10' OR SAL >= 1600)
       AND COMM >=600;
       
--���ڿ� �˻� LIKE
--EMP ���̺��� �达���� ���� ����� ������ ��� ���
SELECT *
    FROM EMP
    WHERE ENAME LIKE '��%';
    
--����̸��� �ϴ÷� ������ ��� ������ ��� ���
SELECT *
    FROM EMP
    WHERE ENAME LIKE '%�ϴ�';

--����̸��� 4������ ����� ������ ��� ���

SELECT *
    FROM EMP
    WHERE ENAME LIKE '____';

--BETWEEN AND ����    
--SAL�� 2000�̻� 3000������ ����� ������ ��� ���
--SAL�� 2000�̻� 3000�̸��� ����� ������ ��� ����� AND �� ���
SELECT *
    FROM EMP
    WHERE SAL >= 2000
      AND SAL < 3000;

SELECT *
    FROM EMP
    WHERE SAL BETWEEN 2000 AND 3000;

--�Ի����� 92�⿡�� 96���� ��� �˻�
--��¥�����͸� ���ڿ��� ��
SELECT *
    FROM EMP
    WHERE hdate BETWEEN '1992/01/01' AND '1999/12/31';
    
--���� Ŀ�ؼǵ� ������ ��¥���� ����
--������ �ٲ� ������ �����ؾ� ��
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD:HH24:MI:SS';

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD';

SELECT *
    FROM EMP
    WHERE hdate BETWEEN '1992/01/01:00:00:00' AND '1999/12/31:23:59:59';
    
--DNO�� 10�̰ų� 20�� ��� ������ ��� ǥ��
SELECT *
    FROM EMP
    WHERE DNO = '10'
       OR DNO = '20';

--IN ����
--DNO�� 10�̰ų� 20�̰ų� 30�� ��� ������ ��� ǥ��
SELECT *
    FROM EMP
    WHERE DNO IN(10, 20, 30);

--������ �����̰ų� �濵�� ����� ������ ��� ǥ��
SELECT *
    FROM EMP
    WHERE JOB IN('����', '�濵');
