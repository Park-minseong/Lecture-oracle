--1) �л��� ��� ������ ���� ���Ŀ� ���� �Ҽ��� ���� 2�ڸ����� �˻��ϼ���
--'OOO �л��� ��� ������ O.OO�Դϴ�.'
SELECT SNAME || '�л��� ��� ������ ' ||TO_CHAR(AVR, '0.99')||'�Դϴ�.'
    FROM STUDENT
    ORDER BY AVR DESC;

--2) ������ �������� ���� �������� ǥ���ϼ���
--'OOO ������ �������� YYYY�� MM�� DD���Դϴ�.'
SELECT PNAME || '������ ��������' || TO_CHAR(HIREDATE, 'YYYY"��" MM"��" DD"���Դϴ�."')
    FROM PROFESSOR;

--3) �����߿� 3���� ������ ������ ����� �˻��ϼ���
SELECT PNAME
    FROM PROFESSOR
    WHERE TO_CHAR(HIREDATE, 'MM') = '03';