select *from emp_test;

create table emp_test(empno, ename, sal, comm, deptno)  as
 select empno,ename,sal,comm,deptno       from emp      where 1=0;

insert into emp_test values(11,'apple',950,null,30);
insert into emp_test values(12,'banana',1600,300,30);
insert into emp_test values(13,'cheese',1000,0,10);
insert into emp_test values(14,'dog',2000,null,20);
insert into emp_test values(15,'egg',1000,100,20);
--추가
insert into emp_test values(16,'cat',1600,300,20);
insert  into emp_test values(17,'orange',2000,null,10);
--16번 사원과 급여(sal)와 커미션(comm)이 같은 사원정보
--1. 16번사원 정보
select sal, comm from emp_test where empno='16';
--2. 
select *from emp_test
where (sal,comm)=(select sal, comm from emp_test where empno='16');
--또는
select*from EMP_TEST
where sal=1600 and comm=300;
-- 오류인 경우
select *from emp_test
where (sal,comm)=(1600,300);

-- 부서가 30인 사원의 급여, 커미션이 같은 사원의 정보를 구한다.
select*from emp_test
where ((sal,comm)in (select sal, comm from emp_test where deptno='30'));

select*from emp_test -- 학습1 23p 
where ((sal,nvl(comm,-1))in (select sal, nvl(comm,-1) 
from emp_test where deptno='30'));  -- ??

select sal,nvl(comm,-1)from emp_test where deptno='30';  --??

select *from emp_test;
-- oange 사원과 급여와 커미션이 같은 사원 검색
select sal,comm from emp_test where ename='orange';

select*from emp_test
where (sal,comm)=(select sal,nvl(comm,-1)
from emp_test where ename='orange';  -- xxxxxxx

select *from emp_test;
--egg와 급여가 같은 사원의 이름 검색
select sal from emp_test where ename='egg';
select *from emp_test where sal='1000';

select*from emp_test
where sal=(select sal from emp_test where ename='egg');

-- banana사원과 커미션이 같은 사원의 이름 검색
select comm from emp_test where ename='banana';
select *from emp_test where comm='300';

select *from emp_test
where comm=(select comm from emp_test where ename='banana');

--apple 사원과 커미션이 같은 사원이름 검색
select comm from emp_test where ENAME='apple';

select * from emp_test
where nvl(comm,-1) = (select nvl(comm,-1) from emp_test where ename='apple');













