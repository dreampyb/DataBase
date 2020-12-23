select*from tab;
desc name;
SELECT*from Name;
-- 1. 사원(emp) 테이블의 구조를 검색하라.
desc emp;
-- 2. 부서(dept) 테이블의 구조를 검색하라.
desc dept;
-- 3.급여(salgrade) 테이블의 구조를 검색하라.
desc SALGRADE;
--4.사원들의 사원번호, 사원이름, 사원직무를 검색하라.
select empno,ename,job from emp;
--5.부서의 부서번호(deptno)와 부서이름(dname)을 검색하라.
select deptno, dname from dept;
-- 6.부서의 부서이름과 지역(loc)을 검색하라.
select dname, loc from dept;
-- 7. 사원들의 급여와 커미션을 검색하라.
select sal, comm from emp;
-- 8. 사원들의 입사일 중복을 제거하고 검색하라.
select DISTINCT hiredate from emp;
-- 9. 사원들의 상급자사원번호(mgr) 중복을 제거하고 검색하라.
select DISTINCT mgr from emp;
--10. 사원들의 부서번호 중복을 제거하고 검색하라.
select DISTINCT deptno from dept;
--11. 사원들의 6개월 급여의 합을 검색하라.
select sum(sal*6) from emp;
--12. 사원들의 6개월 커미션의 합을 검색하라.
select sum(comm*6) from emp;
--13. 사원이름을 ‘Name’으로, 사원의 급여를 ‘Salary’로 열의 이름을 부여하여 검색하라.
select ename"Name" , sal"Salary" from emp;
--14. 사원의 사원번호(empno), 사원이름(ename), 입사일(hiredate),부서번호(deptno)를 한글로 바꾸어 검색하라.
select empno"사원번호" , ename"사원이름" , hiredate"입사일" , deptno"부서번호" from emp;
--15. 부서번호, 부서이름, 지역을 한글 제목으로 검색하라.
select deptno"부서번호" , dname"부서이름" , loc"지역" from dept;
--16. 사원의 사원직무와 사원이름을 합쳐서 검색하라.
select job||ename from emp;
--17. 입사일(hiredat) 사원이름을 ‘80-12-17’에 입사한 SMITH입니다’ 식으로 검색하라.
select hiredate,'에 입사한 ',ename ,'입니다' from emp;
--18. 10번 부서에 근무하는 사원이름을 검색하라.
select ename from emp
where deptno=10;
--19. 급여가 2000 이상인 사원들의 사원번호, 사원이름을 검색하라.
SELECT empno, ename from emp
where sal>=2000;
--20. 사원직무가 ‘CLERK’인 사원들의 사원번호, 사원이름을 검색하라.
select empno, ename from emp
where job='CLERK';                            -- CLERK는 문자열이므로 대소문자 구분.
-- 21. 1980년 12월 17일에 입사한 사원이름을 검색하라.
select ename from emp
where hiredate='1980/12/17';
-- 22. 부서번호 30 이외의 부서이름과 지역을 검색하라.
select dname, loc from dept
where deptno!=30;
-- 23. 급여등급이 5인 급여의 상위급여와 하위급여를 검색하라. 
-- "(salgrade 테이블 이용)"
SELECT hisal, losal
FROM salgrade
where grade=5;
-- 24. ‘WARD’ 사원의 모든 정보를 검색하라.
select *from emp
where ename='WARD';
-- 25. 10번 부서에 근무하는 직무가 MANAGER의 사원이름을 검색하라.
SELECT ENAME
FROM EMP
WHERE DEPTNO='10' AND JOB='MANAGER';
-- 26. 급여가 2000 이상이며, 30번 부서에 근무하는 사원들의 사원번호와 사원이름을 검색하라.
select empno, ename
from emp
where sal>='2000' and deptno='30';
-- 27. 사원직무가 ‘CLERK’ 이며, 81년 이후에 입사한 사원들의 사원번호와 사원이름을 검색하라.
-- 주의) 81이후 입사이므로 작다는 뜻.
SELECT EMPNO, ENAME
FROM EMP
WHERE JOB='CLERK'AND HIREDATE>'1981-01-01';
-- 28. 20부서 외에 근무하는 MANAGER의 사원이름을 검색하라.
SELECT ENAME
FROM EMP
WHERE JOB='MANAGER' AND DEPTNO!=20;
-- 30. SALESMAN이며 급여가 1500 이상인 사원이름을 검색하라.
SELECT ENAME
FROM EMP
WHERE SAL>='1500' AND JOB='SALESMAN';
-- 31. 급여가 1000 이상이며, 2500 이하인 사원의 사원번호, 사원이름, 급여를 검색하라.
SELECT ENAME, EMPNO, SAL
FROM EMP
WHERE SAL>=1000 AND SAL<=2500;
-- 32. 사원번호가 75로 시작하는 사원의 사원번호, 사원이름, 부서번호를 검색하라.
SELECT ENAME, EMPNO,DEPTNO
FROM EMP
WHERE EMPNO LIKE '75%';
-- 33. 부서번호가 10 또는 30에 근무하는 사원들의 사원이름과 급여를 검색하라.
SELECT ENAME, SAL
FROM EMP
WHERE DEPTNO='10' OR DEPTNO='30';
-- 34. 상급자사원번호가 76으로 시작하는 사원들의 사원이름을 검색하라.
SELECT ENAME
FROM EMP
WHERE MGR LIKE '76%';
-- 35. 사원번호가 79로 시작하는 사원들의 사원이름, 급여, 커미션을 검색하라.
SELECT ENAME, SAL, COMM
FROM EMP
WHERE EMPNO LIKE '79%';
-- 36. 1981년 2월에 입사한 사원의 사원번호, 사원이름, 부서번호를 검색하라.
--( 팁: 2월에 입사했다는 뜻은 2/1~2/28 사이의 뜻)/ 윤달 확인!
SELECT ENAME EMPNO, DEPTNO
FROM EMP
WHERE HIREDATE BETWEEN '1981-02-01' AND '1981-02-28';
-- 37. 사원이름 중간에 ‘A’가 들어있는 사원의 사원번호와 사원이름을 검색하라.
SELECT ENAME EMPNO
FROM EMP
WHERE ENAME LIKE '%A%';
-- 38. 상급자사원번호가 NULL인 사원의 사원번호와 사원이름을 검색하라.
SELECT ENAME ,EMPNO   -- NULL은 IS로 구현.
FROM EMP
WHERE MGR IS NULL;
-- 39. 상급자사원번호가 NULL이 아닌 사원의 사원번호, 이름, 상급자사원번호를 검색하라.
SELECT ENAME , EMPNO, MGR
FROM EMP
WHERE MGR IS NOT NULL;
-- 40. 사원번호가 7902 또는 7781인 사원이름을 검색하라.
SELECT ENAME 
FROM EMP
WHERE EMPNO=7902 OR EMPNO=7781;
-- 41. 상급자사원번호가 7698 또는 7839인 사원의 사원번호와 사원이름을 검색하라.
SELECT EMPNO, ENAME 
FROM EMP
WHERE MGR='7698' OR MGR='7839'; 
-- 42. 사원직무가 ‘MANAGER’  또는 'SALESMAN' 인 사원의 사원번호, 사원이름, 부서번호를 검색하라.
SELECT EMPNO, ENAME , DEPTNO
FROM EMP
WHERE JOB='MANAGER' or JOB='SALESMAN'; --문자열이니 대소문자 주의.
-- 43. 사원들의 사원번호와 사원이름을 사원번호 순으로 검색하라.
SELECT EMPNO, ENAME
FROM EMP
ORDER BY EMPNO;
-- 44. 사원들의 사원번호화 사원이름을 부서번호별 이름순으로 검색하라.
SELECT EMPNO , ENAME
FROM EMP
ORDER BY DEPTNO , ENAME;
-- 45. 사원들의 정보를 부서별 급여가 많은 순으로 검색하라.
SELECT *
FROM EMP
ORDER BY  SAL DESC;
-- 46. 사원들의 정보를 사원직무별 급여 순으로 검색하라.
SELECT *
FROM EMP
ORDER BY JOB, SAL;
-- 47. 사원들의 정보를 부서번호별, 사원직무별, 급여 순으로 검색하라.
SELECT *
FROM EMP
ORDER BY DEPTNO, JOB, SAL;

-- 48. 사원들의 사원이름을 소문자로 검색하라.
SELECT LOWER(ENAME)--소문자 만들기 cf. upper:대문자
FROM EMP;

-- 49. 사원들의 사원이름, 사원직무를 소문자로 검색하라.
SELECT LOWER(ENAME),LOWER(JOB)
--SELECT LOWER(ENAME, JOB) 이러면 에러난다.
FROM EMP;

-- 50. 사원들의 사원이름을 대문자로 검색하라.
SELECT UPPER(ENAME)
FROM EMP;
-- 51. 사원들의 사원이름과 사원직무를 대문자로 검색하라.
SELECT UPPER(ENAME),UPPER(JOB)
FROM EMP;
-- 52. 사원들의 사원이름을 첫 자만 대문자로 검색하라.
SELECT INITCAP(ENAME)
FROM EMP;
-- 53. 사원들의 사원이름과 사원직무를 첫 자만 대문자로 검색하라.
SELECT INITCAP(ENAME), INITCAP(JOB)
FROM EMP;
-- 54. 사원들의 사원이름과 사원직무를 연결하여 검색하라.(concat 이용)
SELECT concat(ename, job)
FROM emp;
-- 55. 사원들의 사원이름과 사원이름의 첫 두 글자를 검색하라.
select ename, substr(ename ,1,2)
from EMP;
-- 56. 사원들의 사원이름, 사원직무 그리고 사원직무의 두 번째부터 세 글자를 검색하라.
select ename, substr(job,2,3)
from emp;
-- 57. 사원들의 사원이름과 사원이름의 길이를 검색하라.
select ename, length(ename)
from emp;
-- 58. 사원들의 사원이름과 사원직무의 자리수를 검색하라.
select ename, length(job)
from emp;
-- 59. 사원들의 사원이름에 'A'가 몇 번째 위치에 있는지 검색하라.
select INSTR(ename,'A') -- ename은 문자열이 아니니 ''를 붙일 필요가 없다.
from emp;
-- 60. 사원직무에 'A'가 몇 번째 위치에 있는지 검색하라.
SELECT instr(job,'A')
from emp;
-- 61. 사원이름을 15자리로 하고, 뒤에 '&'를 채워 검색하라.
SELECT RPAD(ename,15,'&')
from emp;
-- 62. 사원직무를 20자리로 하고, 앞에 '%'를 채워 검색하라.
select LPAD(job,20,'%')
from emp;
-- 63. 사원의 사원번호, 사원이름, 급여를 검색하라(급여는 두 번째 자리에서 반올림함).
select empno, ename, round(sal,-2) 
from emp;
-- 64. 사원의 사원번호, 사원이름, 급여를 검색하라(급여는 두 번째 자리까지 절삭함).

-- 65. 사원번호와 급여를 100으로 나눈 나머지를 검색하라.

-- 66. 사원번호, 사원이름, 입사일, 입사 후 100일의 날짜를 검색하라.

-- 67. 사원번호, 사원이름, 입사일, 근무 일자를 계산하여 검색하라.

-- 68. 사원들의 입사일에서 3달째 되는 날짜를 검색하라.

-- 69. 사원들의 입사일 다음 토요일의 날짜를 검색하라.

-- 70. 사원들의 입사월의 마지막 날짜를 검색하라.

-- 71. 사원들의 입사일을 년을 기준으로 반올림하여 검색하라.

-- 72. 사원들의 입사일을 년을 기준으로 절삭하여 검색하라.

-- 73. 상급자사원번호가 없는 사원의 경우 '상급자 없음'을 나타내도록 하는 질의문을 작성하라.

-- 74. 커미션을 포함한 급여를 사원번호, 사원이름과 함께 검색하라.

-- 75. 커미션을 포함한 연봉을 사원번호, 사원이름과 함께 검색하라.

-- 76. 상급자사원번호가 NULL인 경우 'CEO'로 바꾸어 사원번호, 사원이름, 상급자사원번호를 검색하라

-- 77. 사원직무가 'CLERK' 인 경우 C로 나타내도록 사원 직무를 검색하라(NULLIF 사용) 

-- 78. 다음문장의 결과를 확인하라. 
--  select empno, ename, sal, case job when 'SALEMAN' then sal*1.1 when 'CLERK' then sal *1.15 when 'MANAGER' then sal *1.2 end as 급여인상 from emp order by empno

-- 79. 다음문장의 결과를 확인하라. 
-- select empno, ename, job, sal, decode(job,'SALESMAN', sal*1.1, 'MANAGER', sal*1.2, 'CLERK', sal *1.2) as "인상된 급여" from emp order by empno

-- 84. 전체 사원이 사원이름 중 MAX와 MIN 값을 검색하라.

-- 85. 전체 사원의 입사일중 MAX와MIN 값을 검색하라.

-- 86. 사원번호의 MAX와 MIN 값을 검색하라.

-- 87. 상급자 사원번호 열의 개수를 검색하라.

-- 88. 사원이름의 개수를 검색하라.

-- 89. 사원(emp) 테이블의 튜플 수를 검색하라.

-- 90. 부서(dept) 테이블의 튜플 수를 검색하라.

-- 91. 커미션의 개수를 검색하라.

-- 92. 부서별 사원들의 인원수를 검색하라.

-- 93. 상급자사원번호별 사원들의 인원수를 검색하라.

-- 94. 부서별 사원들의 평균 급여를 검색하라.

-- 95. 부서별 사원들의 급여의 표준편차를 검색하라.

-- 96. 부서별 사원직무별 사원의 급여 합을 검색하라.

-- 97. 부서별 사원직무별 사원들의 평균 급여를 검색하라.

-- 98. 부서별 사원직무별 사원들의 입사일의 MAX와 MIN 값을 검색하라.

-- 99. 부서별 사원들의 인원수를 인원수가 많은 순으로 검색하라. 

-- 100. 부서별 사원들의 평균 급여를 평균 급여 순으로 검색하라. 

-- 101. 부서별, 사원직무별 사원의 급여 합을 많은 순으로 검색하라.

-- 102. 부서별, 사원직무별 사원들의 평균 급여를 평균 급여가 많은 순으로 검색하라.

--< Non-Equi Join >
-- 사원급여의 등급을 사원번호, 사원이름, 급여,등급이 출력되도록 검색하시오.
select empno, ename, sal, grade
from emp, salgrade
where sal between losal and hisal;

SELECT * FROM EMP;
SELECT * FROM SALGRADE;

-- 직원의 상급자 이름을 검색
-- 단, 사원번호,사원이름, 상급자사원번호, 상급자이름을 출력하시오.

select a.EMPNO,a.ENAME,b.EMPNO,a.ENAME 
from emp a, emp b 
-- table의 별칭은 ""없이 써야 함.
where a.mgr=b.empno;












