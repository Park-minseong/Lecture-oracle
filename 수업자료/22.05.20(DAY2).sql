SELECT SAL * 1.1 AS "10% �λ�� �޿�"
    FROM EMP;
    
SELECT * FROM EMP;    
    
--INNER JOIN
--EMP���� ����� �����ȣ, ����̸�, �μ���ȣ, �μ���, ���� ���
SELECT A.ENO,
       A.ENAME,
       A.DNO,
       B.DNAME,
       B.LOC
    FROM EMP A
    INNER JOIN DEPT B
            ON A.DNO = B.DNO;
 --��Ȯ���� ���� �÷� ����
 --����� �ø��� ��ȸ�� ���� ��� ���̺��� �����͸� ����� ������ ���
SELECT ENO,
       ENAME,
       A.DNO,
       DNAME,
       LOC
    FROM EMP A
    INNER JOIN DEPT B
            ON A.DNO = B.DNO;     
            
--INNER JOIN �ι�° ���
--EMP���� ����� �����ȣ, ����̸�, �μ���ȣ, �μ���, ���� ���
SELECT A.ENO,
       A.ENAME,
       A.DNO,
       B.DNAME,
       B.LOC
    FROM EMP A,
         DEPT B
    WHERE A.DNO = B.DNO;
    
--�� ���� �Ҵ�� �����ȣ, �����, ������ȣ, �����̸� ���(course, professor ���̺� ���)
SELECT A.CNO,
       A.CNAME,
       A.PNO,
       B.PNAME
    FROM COURSE A,
         PROFESSOR B
    WHERE A.PNO = B.PNO;  
    
SELECT A.CNO,
       A.CNAME,
       A.PNO,
       B.PNAME
    FROM COURSE A
    INNER JOIN PROFESSOR B
            ON A.PNO = B.PNO;
            
--���ֿ��� �ٹ��ϴ� ����� �����ȣ, ����̸�, �μ���ȣ, �μ��̸�, ��ġ ���
SELECT A.ENO,
       A.ENAME,
       A.DNO,
       B.DNAME,
       B.LOC
    FROM EMP A,
         DEPT B
    WHERE A.DNO = B.DNO
      AND B.LOC = '����';
      
SELECT A.ENO,
       A.ENAME,
       A.DNO,
       B.DNAME,
       B.LOC
    FROM EMP A
    INNER JOIN DEPT B
            ON A.DNO = B.DNO
    AND B.LOC = '����'; --WHERE���� JOIN�� �����Ϳ��� ������ �����ͼ���
    --AND�� JOIN�� �����ε����� ����
    
--������
--����� 10%�λ�޿��� ��� ���(�����ȣ, ����̸�, �λ�� �޿�, �޿����): EMP, SALGRADE
SELECT A.ENO,
       A.ENAME,
       A.SAL * 1.1 "10% �λ�޿�",
       B.GRADE
    FROM EMP A,
         SALGRADE B
    WHERE A.SAL*1.1 BETWEEN B.LOSAL AND B.HISAL;
    
SELECT A.ENO,
       A.ENAME,
       A.SAL * 1.1 "10% �λ�޿�",
       B.GRADE
    FROM EMP A
    JOIN SALGRADE B
      ON A.SAL*1.1 BETWEEN B.LOSAL AND B.HISAL;
      
--CROSS JOIN
--JOIN�� �� ���� JOIN������ ����ؾ� ��
SELECT A.ENO,
       A.ENAME,
       A.DNO,
       B.DNAME
    FROM EMP A,
         DEPT B;
         
--EMP���̺��� �����ȣ, ����̸�, �����ȣ, ����̸� ���(���������̿�)
SELECT A.ENO,
       A.ENAME,
       A.MGR,
       B.ENAME AS ����̸�
    FROM EMP A
    JOIN EMP B
      ON A.MGR = B.ENO;
      
SELECT A.ENO,
       A.ENAME,
       A.MGR,
       B.ENAME AS ����̸�
    FROM EMP A,
         EMP B 
    WHERE A.MGR(+) = B.ENO;   
    
--OUTER JOIN
--����� �������� �ʴ� ����� �����ؼ� �����ȣ, ����̸�, �����ȣ, ����̸� ǥ��
SELECT A.ENO,
       A.ENAME,
       A.MGR,
       B.ENAME AS ����̸�
    FROM EMP A,
         EMP B 
    WHERE A.MGR = B.ENO(+);

SELECT A.ENO,
       A.ENAME,
       NVL(A.MGR,'����') AS �����ȣ,
       NVL(B.ENAME,'����') AS ����̸�
    FROM EMP A
    LEFT OUTER JOIN EMP B 
                ON A.MGR = B.ENO; 

--EMP A
--ENO   ENAME   MGR
--0001  �ȿ���   null
--9999  ���õ   null
--1003  �缱ȣ   0201

--EMP B
--ENO   ENAME
--0001  �ȿ���
--9999  ���õ
--1003  �缱ȣ


--�ҼӺμ����� ���� �μ� �����Ͽ� �μ���ȣ, �μ��̸�, ����̸� ǥ��
SELECT A.DNO,
       A.DNAME,
       B.ENAME
    FROM DEPT A
    LEFT OUTER JOIN EMP B
                 ON A.DNO = B.DNO;

--��米���� ���� ������ �����Ͽ� �����ȣ, �����, ������ȣ, �����̸�
SELECT A.CNO,
       A.CNAME,
       NVL(A.PNO, '-') AS PNO,
       NVL(B.PNAME, '-') AS PNAME
    FROM COURSE A
    LEFT OUTER JOIN PROFESSOR B
                 ON A.PNO = B.PNO;
                 
SELECT A.CNO,
       A.CNAME,
       NVL(A.PNO, '-') AS PNO,
       NVL(B.PNAME, '-') AS PNAME
    FROM COURSE A,
         PROFESSOR B
    WHERE A.PNO = B.PNO(+);   
    
    
    
--���� �� ���� ����
SELECT SAL
    FROM EMP
    WHERE EAME = '���ϴ�';

--���ϴ��� �޿����� ���� �޿��� �޴� ��� ��ȸ 
SELECT A.ENO,
       A.ENAME,
       A.SAL
    FROM EMP A
    WHERE A.SAL >= (SELECT SAL
                     FROM EMP
                     WHERE ENAME = '���ϴ�');
                     
--�۰� �������� ������� �� ���� ������ȣ, �����̸�, ����� ��ȸ
SELECT PNO,
       PNAME,
       HIREDATE
    FROM PROFESSOR
    WHERE HIREDATE < (SELECT HIREDATE
                            FROM PROFESSOR
                            WHERE PNAME = '�۰�');
                            
SELECT A.PNO,
        A.PNAME,
        A.HIREDATE
    FROM PROFESSOR A
    WHERE A.HIREDATE < (SELECT B.HIREDATE
                            FROM PROFESSOR B
                            WHERE B.PNAME = '�۰�');

 SELECT A.PNO,
        A.PNAME,
        A.HIREDATE
    FROM PROFESSOR A
       , (SELECT HIREDATE
            FROM PROFESSOR
            WHERE PNAME = '�۰�')B
    WHERE A.HIREDATE < B.HIREDATE;
    
--���� �� ��������
SELECT AVR
    FROM STUDENT
    WHERE SNAME= '����';
    
--�����л��� ������ ���� �л��� �й�, �л��̸�, ������ȸ(IN������ ���)
SELECT A.SNO,
       A.SNAME,
       A.AVR
    FROM STUDENT A
    WHERE A.AVR IN(SELECT B.AVR
                        FROM STUDENT B
                        WHERE B.SNAME = '����');

SELECT A.SNO,
       A.SNAME,
       A.AVR
    FROM STUDENT A,
        (SELECT AVR
             FROM STUDENT
             WHERE SNAME = '����')B
    WHERE A.AVR IN B.AVR;
    
--���� �� ��������
--�⸻��� ������ 95�� �̻��� �й�, �����ȣ, �����, �⸻��� ���� ��ȸ ��������
SELECT C.SNO,
       C.CNO,
       D.CNAME,
       C.RESULT
    FROM SCORE C,
         COURSE D
    WHERE C.CNO = D.CNO
      AND C.RESULT >=95;
      
--�⸻��� ������ 95�� �̻��� �й�, �л��̸�, �����ȣ, �����, ���� ��ȸ     
SELECT A.SNO,
       A.SNAME,
       B.CNO,
       B.CNAME,
       B.RESULT
    FROM STUDENT A,
         (SELECT C.SNO,
                 C.CNO,
                 D.CNAME,
                 C.RESULT
             FROM SCORE C,
                  COURSE D
             WHERE C.CNO = D.CNO
               AND C.RESULT >=95)B
    WHERE A.SNO = B.SNO;       
         
         
SELECT A.SNO,
       A.SNAME,
       B.CNO,
       B.CNAME,
       C.RESULT
    FROM STUDENT A,
         COURSE B,
         SCORE C
    WHERE A.SNO = C.SNO
      AND B.CNO = C.CNO
      AND C.RESULT >=95
      ORDER BY SNO, CNO;
      
--���տ�����
--UNION ALL�� �̿��Ͽ� 1999�� 12�� 31�� ���Ŀ� ���� ������ȣ, �����̸�, �������, �����ȣ, ����̸�, ������� ��ȸ
SELECT PNO AS �����ȣ,
       PNAME AS ����̸�,
       HIREDATE AS �������
    FROM PROFESSOR
    WHERE HIREDATE >= '2000/01/01'
UNION ALL
SELECT ENO,
       ENAME,
       HDATE
    FROM EMP
    WHERE HDATE >= '2000/01/01';
--MINUS ������
--��� �߿� �������鼭 ���������� �����ʴ� ����� �����ȣ, ����̸�, ���� ��ȸ
SELECT ENO,
       ENAME,
       JOB
    FROM EMP
    WHERE ENAME LIKE '����%'
MINUS
SELECT ENO,
       ENAME,
       JOB
    FROM EMP
    WHERE JOB = '����';

--INTERSECT������
--INTERSECT �����ڸ� �̿��ؼ� ����, ȭ�а��� �л� �� ������ 3.0 �̻��� �й�, �л��̸�, �а��̸�, ���� ��ȸ
SELECT SNO,
       SNAME,
       MAJOR,
       AVR
    FROM STUDENT
    WHERE MAJOR IN('ȭ��', '����')
INTERSECT    
SELECT SNO,
       SNAME,
       MAJOR,
       AVR
    FROM STUDENT
    WHERE AVR >= 3;
    
 SELECT SNO,
       SNAME,
       MAJOR,
       AVR
    FROM STUDENT
    WHERE MAJOR IN('ȭ��', '����')
      AND AVR >= 3;   