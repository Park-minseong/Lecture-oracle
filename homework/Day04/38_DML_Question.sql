--1) ��� �л��� ������ 4.5���� �������� �����ϼ���
UPDATE STUDENT
    SET AVR = AVR*4.5/4.0;
    

--2) ��� ������ �������ڸ� 100�� ������ �����ϼ���
UPDATE PROFESSOR
    SET HIREDATE = HIREDATE - 100;

--3) ȭ�а� 2�г� �л��� ������ �����ϼ���
DELETE FROM STUDENT
    WHERE MAJOR = 'ȭ��' AND SYEAR = 2;

--4) �������� ������ �����ϼ���
DELETE FROM PROFESSOR
    WHERE ORDERS = '������';