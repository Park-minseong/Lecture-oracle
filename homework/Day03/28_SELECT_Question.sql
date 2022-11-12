--1) 학생의 평균 평점을 다음 형식에 따라 소수점 이하 2자리까지 검색하세요
--'OOO 학생의 평균 평점은 O.OO입니다.'
SELECT SNAME || '학생의 평균 평점은 ' ||TO_CHAR(AVR, '0.99')||'입니다.'
    FROM STUDENT
    ORDER BY AVR DESC;

--2) 교수의 부임일을 다음 형식으로 표현하세요
--'OOO 교수의 부임일은 YYYY년 MM월 DD일입니다.'
SELECT PNAME || '교수의 부임일은' || TO_CHAR(HIREDATE, 'YYYY"년" MM"월" DD"일입니다."')
    FROM PROFESSOR;

--3) 교수중에 3월에 부임한 교수의 명단을 검색하세요
SELECT PNAME
    FROM PROFESSOR
    WHERE TO_CHAR(HIREDATE, 'MM') = '03';