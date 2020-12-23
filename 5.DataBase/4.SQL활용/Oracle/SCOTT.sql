select*from tab;
desc name;
SELECT*from Name;
-- 1. ���(emp) ���̺��� ������ �˻��϶�.
desc emp;
-- 2. �μ�(dept) ���̺��� ������ �˻��϶�.
desc dept;
-- 3.�޿�(salgrade) ���̺��� ������ �˻��϶�.
desc SALGRADE;
--4.������� �����ȣ, ����̸�, ��������� �˻��϶�.
select empno,ename,job from emp;
--5.�μ��� �μ���ȣ(deptno)�� �μ��̸�(dname)�� �˻��϶�.
select deptno, dname from dept;
-- 6.�μ��� �μ��̸��� ����(loc)�� �˻��϶�.
select dname, loc from dept;
-- 7. ������� �޿��� Ŀ�̼��� �˻��϶�.
select sal, comm from emp;
-- 8. ������� �Ի��� �ߺ��� �����ϰ� �˻��϶�.
select DISTINCT hiredate from emp;
-- 9. ������� ����ڻ����ȣ(mgr) �ߺ��� �����ϰ� �˻��϶�.
select DISTINCT mgr from emp;
--10. ������� �μ���ȣ �ߺ��� �����ϰ� �˻��϶�.
select DISTINCT deptno from dept;
--11. ������� 6���� �޿��� ���� �˻��϶�.
select sum(sal*6) from emp;
--12. ������� 6���� Ŀ�̼��� ���� �˻��϶�.
select sum(comm*6) from emp;
--13. ����̸��� ��Name������, ����� �޿��� ��Salary���� ���� �̸��� �ο��Ͽ� �˻��϶�.
select ename"Name" , sal"Salary" from emp;
--14. ����� �����ȣ(empno), ����̸�(ename), �Ի���(hiredate),�μ���ȣ(deptno)�� �ѱ۷� �ٲپ� �˻��϶�.
select empno"�����ȣ" , ename"����̸�" , hiredate"�Ի���" , deptno"�μ���ȣ" from emp;
--15. �μ���ȣ, �μ��̸�, ������ �ѱ� �������� �˻��϶�.
select deptno"�μ���ȣ" , dname"�μ��̸�" , loc"����" from dept;
--16. ����� ��������� ����̸��� ���ļ� �˻��϶�.
select job||ename from emp;
--17. �Ի���(hiredat) ����̸��� ��80-12-17���� �Ի��� SMITH�Դϴ١� ������ �˻��϶�.
select hiredate,'�� �Ի��� ',ename ,'�Դϴ�' from emp;
--18. 10�� �μ��� �ٹ��ϴ� ����̸��� �˻��϶�.
select ename from emp
where deptno=10;
--19. �޿��� 2000 �̻��� ������� �����ȣ, ����̸��� �˻��϶�.
SELECT empno, ename from emp
where sal>=2000;
--20. ��������� ��CLERK���� ������� �����ȣ, ����̸��� �˻��϶�.
select empno, ename from emp
where job='CLERK';                            -- CLERK�� ���ڿ��̹Ƿ� ��ҹ��� ����.
-- 21. 1980�� 12�� 17�Ͽ� �Ի��� ����̸��� �˻��϶�.
select ename from emp
where hiredate='1980/12/17';
-- 22. �μ���ȣ 30 �̿��� �μ��̸��� ������ �˻��϶�.
select dname, loc from dept
where deptno!=30;
-- 23. �޿������ 5�� �޿��� �����޿��� �����޿��� �˻��϶�. 
-- "(salgrade ���̺� �̿�)"
SELECT hisal, losal
FROM salgrade
where grade=5;
-- 24. ��WARD�� ����� ��� ������ �˻��϶�.
select *from emp
where ename='WARD';
-- 25. 10�� �μ��� �ٹ��ϴ� ������ MANAGER�� ����̸��� �˻��϶�.
SELECT ENAME
FROM EMP
WHERE DEPTNO='10' AND JOB='MANAGER';
-- 26. �޿��� 2000 �̻��̸�, 30�� �μ��� �ٹ��ϴ� ������� �����ȣ�� ����̸��� �˻��϶�.
select empno, ename
from emp
where sal>='2000' and deptno='30';
-- 27. ��������� ��CLERK�� �̸�, 81�� ���Ŀ� �Ի��� ������� �����ȣ�� ����̸��� �˻��϶�.
-- ����) 81���� �Ի��̹Ƿ� �۴ٴ� ��.
SELECT EMPNO, ENAME
FROM EMP
WHERE JOB='CLERK'AND HIREDATE>'1981-01-01';
-- 28. 20�μ� �ܿ� �ٹ��ϴ� MANAGER�� ����̸��� �˻��϶�.
SELECT ENAME
FROM EMP
WHERE JOB='MANAGER' AND DEPTNO!=20;
-- 30. SALESMAN�̸� �޿��� 1500 �̻��� ����̸��� �˻��϶�.
SELECT ENAME
FROM EMP
WHERE SAL>='1500' AND JOB='SALESMAN';
-- 31. �޿��� 1000 �̻��̸�, 2500 ������ ����� �����ȣ, ����̸�, �޿��� �˻��϶�.
SELECT ENAME, EMPNO, SAL
FROM EMP
WHERE SAL>=1000 AND SAL<=2500;
-- 32. �����ȣ�� 75�� �����ϴ� ����� �����ȣ, ����̸�, �μ���ȣ�� �˻��϶�.
SELECT ENAME, EMPNO,DEPTNO
FROM EMP
WHERE EMPNO LIKE '75%';
-- 33. �μ���ȣ�� 10 �Ǵ� 30�� �ٹ��ϴ� ������� ����̸��� �޿��� �˻��϶�.
SELECT ENAME, SAL
FROM EMP
WHERE DEPTNO='10' OR DEPTNO='30';
-- 34. ����ڻ����ȣ�� 76���� �����ϴ� ������� ����̸��� �˻��϶�.
SELECT ENAME
FROM EMP
WHERE MGR LIKE '76%';
-- 35. �����ȣ�� 79�� �����ϴ� ������� ����̸�, �޿�, Ŀ�̼��� �˻��϶�.
SELECT ENAME, SAL, COMM
FROM EMP
WHERE EMPNO LIKE '79%';
-- 36. 1981�� 2���� �Ի��� ����� �����ȣ, ����̸�, �μ���ȣ�� �˻��϶�.
--( ��: 2���� �Ի��ߴٴ� ���� 2/1~2/28 ������ ��)/ ���� Ȯ��!
SELECT ENAME EMPNO, DEPTNO
FROM EMP
WHERE HIREDATE BETWEEN '1981-02-01' AND '1981-02-28';
-- 37. ����̸� �߰��� ��A���� ����ִ� ����� �����ȣ�� ����̸��� �˻��϶�.
SELECT ENAME EMPNO
FROM EMP
WHERE ENAME LIKE '%A%';
-- 38. ����ڻ����ȣ�� NULL�� ����� �����ȣ�� ����̸��� �˻��϶�.
SELECT ENAME ,EMPNO   -- NULL�� IS�� ����.
FROM EMP
WHERE MGR IS NULL;
-- 39. ����ڻ����ȣ�� NULL�� �ƴ� ����� �����ȣ, �̸�, ����ڻ����ȣ�� �˻��϶�.
SELECT ENAME , EMPNO, MGR
FROM EMP
WHERE MGR IS NOT NULL;
-- 40. �����ȣ�� 7902 �Ǵ� 7781�� ����̸��� �˻��϶�.
SELECT ENAME 
FROM EMP
WHERE EMPNO=7902 OR EMPNO=7781;
-- 41. ����ڻ����ȣ�� 7698 �Ǵ� 7839�� ����� �����ȣ�� ����̸��� �˻��϶�.
SELECT EMPNO, ENAME 
FROM EMP
WHERE MGR='7698' OR MGR='7839'; 
-- 42. ��������� ��MANAGER��  �Ǵ� 'SALESMAN' �� ����� �����ȣ, ����̸�, �μ���ȣ�� �˻��϶�.
SELECT EMPNO, ENAME , DEPTNO
FROM EMP
WHERE JOB='MANAGER' or JOB='SALESMAN'; --���ڿ��̴� ��ҹ��� ����.
-- 43. ������� �����ȣ�� ����̸��� �����ȣ ������ �˻��϶�.
SELECT EMPNO, ENAME
FROM EMP
ORDER BY EMPNO;
-- 44. ������� �����ȣȭ ����̸��� �μ���ȣ�� �̸������� �˻��϶�.
SELECT EMPNO , ENAME
FROM EMP
ORDER BY DEPTNO , ENAME;
-- 45. ������� ������ �μ��� �޿��� ���� ������ �˻��϶�.
SELECT *
FROM EMP
ORDER BY  SAL DESC;
-- 46. ������� ������ ��������� �޿� ������ �˻��϶�.
SELECT *
FROM EMP
ORDER BY JOB, SAL;
-- 47. ������� ������ �μ���ȣ��, ���������, �޿� ������ �˻��϶�.
SELECT *
FROM EMP
ORDER BY DEPTNO, JOB, SAL;

-- 48. ������� ����̸��� �ҹ��ڷ� �˻��϶�.
SELECT LOWER(ENAME)--�ҹ��� ����� cf. upper:�빮��
FROM EMP;

-- 49. ������� ����̸�, ��������� �ҹ��ڷ� �˻��϶�.
SELECT LOWER(ENAME),LOWER(JOB)
--SELECT LOWER(ENAME, JOB) �̷��� ��������.
FROM EMP;

-- 50. ������� ����̸��� �빮�ڷ� �˻��϶�.
SELECT UPPER(ENAME)
FROM EMP;
-- 51. ������� ����̸��� ��������� �빮�ڷ� �˻��϶�.
SELECT UPPER(ENAME),UPPER(JOB)
FROM EMP;
-- 52. ������� ����̸��� ù �ڸ� �빮�ڷ� �˻��϶�.
SELECT INITCAP(ENAME)
FROM EMP;
-- 53. ������� ����̸��� ��������� ù �ڸ� �빮�ڷ� �˻��϶�.
SELECT INITCAP(ENAME), INITCAP(JOB)
FROM EMP;
-- 54. ������� ����̸��� ��������� �����Ͽ� �˻��϶�.(concat �̿�)
SELECT concat(ename, job)
FROM emp;
-- 55. ������� ����̸��� ����̸��� ù �� ���ڸ� �˻��϶�.
select ename, substr(ename ,1,2)
from EMP;
-- 56. ������� ����̸�, ������� �׸��� ��������� �� ��°���� �� ���ڸ� �˻��϶�.
select ename, substr(job,2,3)
from emp;
-- 57. ������� ����̸��� ����̸��� ���̸� �˻��϶�.
select ename, length(ename)
from emp;
-- 58. ������� ����̸��� ��������� �ڸ����� �˻��϶�.
select ename, length(job)
from emp;
-- 59. ������� ����̸��� 'A'�� �� ��° ��ġ�� �ִ��� �˻��϶�.
select INSTR(ename,'A') -- ename�� ���ڿ��� �ƴϴ� ''�� ���� �ʿ䰡 ����.
from emp;
-- 60. ��������� 'A'�� �� ��° ��ġ�� �ִ��� �˻��϶�.
SELECT instr(job,'A')
from emp;
-- 61. ����̸��� 15�ڸ��� �ϰ�, �ڿ� '&'�� ä�� �˻��϶�.
SELECT RPAD(ename,15,'&')
from emp;
-- 62. ��������� 20�ڸ��� �ϰ�, �տ� '%'�� ä�� �˻��϶�.
select LPAD(job,20,'%')
from emp;
-- 63. ����� �����ȣ, ����̸�, �޿��� �˻��϶�(�޿��� �� ��° �ڸ����� �ݿø���).
select empno, ename, round(sal,-2) 
from emp;
-- 64. ����� �����ȣ, ����̸�, �޿��� �˻��϶�(�޿��� �� ��° �ڸ����� ������).

-- 65. �����ȣ�� �޿��� 100���� ���� �������� �˻��϶�.

-- 66. �����ȣ, ����̸�, �Ի���, �Ի� �� 100���� ��¥�� �˻��϶�.

-- 67. �����ȣ, ����̸�, �Ի���, �ٹ� ���ڸ� ����Ͽ� �˻��϶�.

-- 68. ������� �Ի��Ͽ��� 3��° �Ǵ� ��¥�� �˻��϶�.

-- 69. ������� �Ի��� ���� ������� ��¥�� �˻��϶�.

-- 70. ������� �Ի���� ������ ��¥�� �˻��϶�.

-- 71. ������� �Ի����� ���� �������� �ݿø��Ͽ� �˻��϶�.

-- 72. ������� �Ի����� ���� �������� �����Ͽ� �˻��϶�.

-- 73. ����ڻ����ȣ�� ���� ����� ��� '����� ����'�� ��Ÿ������ �ϴ� ���ǹ��� �ۼ��϶�.

-- 74. Ŀ�̼��� ������ �޿��� �����ȣ, ����̸��� �Բ� �˻��϶�.

-- 75. Ŀ�̼��� ������ ������ �����ȣ, ����̸��� �Բ� �˻��϶�.

-- 76. ����ڻ����ȣ�� NULL�� ��� 'CEO'�� �ٲپ� �����ȣ, ����̸�, ����ڻ����ȣ�� �˻��϶�

-- 77. ��������� 'CLERK' �� ��� C�� ��Ÿ������ ��� ������ �˻��϶�(NULLIF ���) 

-- 78. ���������� ����� Ȯ���϶�. 
--  select empno, ename, sal, case job when 'SALEMAN' then sal*1.1 when 'CLERK' then sal *1.15 when 'MANAGER' then sal *1.2 end as �޿��λ� from emp order by empno

-- 79. ���������� ����� Ȯ���϶�. 
-- select empno, ename, job, sal, decode(job,'SALESMAN', sal*1.1, 'MANAGER', sal*1.2, 'CLERK', sal *1.2) as "�λ�� �޿�" from emp order by empno

-- 84. ��ü ����� ����̸� �� MAX�� MIN ���� �˻��϶�.

-- 85. ��ü ����� �Ի����� MAX��MIN ���� �˻��϶�.

-- 86. �����ȣ�� MAX�� MIN ���� �˻��϶�.

-- 87. ����� �����ȣ ���� ������ �˻��϶�.

-- 88. ����̸��� ������ �˻��϶�.

-- 89. ���(emp) ���̺��� Ʃ�� ���� �˻��϶�.

-- 90. �μ�(dept) ���̺��� Ʃ�� ���� �˻��϶�.

-- 91. Ŀ�̼��� ������ �˻��϶�.

-- 92. �μ��� ������� �ο����� �˻��϶�.

-- 93. ����ڻ����ȣ�� ������� �ο����� �˻��϶�.

-- 94. �μ��� ������� ��� �޿��� �˻��϶�.

-- 95. �μ��� ������� �޿��� ǥ�������� �˻��϶�.

-- 96. �μ��� ��������� ����� �޿� ���� �˻��϶�.

-- 97. �μ��� ��������� ������� ��� �޿��� �˻��϶�.

-- 98. �μ��� ��������� ������� �Ի����� MAX�� MIN ���� �˻��϶�.

-- 99. �μ��� ������� �ο����� �ο����� ���� ������ �˻��϶�. 

-- 100. �μ��� ������� ��� �޿��� ��� �޿� ������ �˻��϶�. 

-- 101. �μ���, ��������� ����� �޿� ���� ���� ������ �˻��϶�.

-- 102. �μ���, ��������� ������� ��� �޿��� ��� �޿��� ���� ������ �˻��϶�.

--< Non-Equi Join >
-- ����޿��� ����� �����ȣ, ����̸�, �޿�,����� ��µǵ��� �˻��Ͻÿ�.
select empno, ename, sal, grade
from emp, salgrade
where sal between losal and hisal;

SELECT * FROM EMP;
SELECT * FROM SALGRADE;

-- ������ ����� �̸��� �˻�
-- ��, �����ȣ,����̸�, ����ڻ����ȣ, ������̸��� ����Ͻÿ�.

select a.EMPNO,a.ENAME,b.EMPNO,a.ENAME 
from emp a, emp b 
-- table�� ��Ī�� ""���� ��� ��.
where a.mgr=b.empno;












