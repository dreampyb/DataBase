select *from emp_test;

create table emp_test(empno, ename, sal, comm, deptno)  as
 select empno,ename,sal,comm,deptno       from emp      where 1=0;

insert into emp_test values(11,'apple',950,null,30);
insert into emp_test values(12,'banana',1600,300,30);
insert into emp_test values(13,'cheese',1000,0,10);
insert into emp_test values(14,'dog',2000,null,20);
insert into emp_test values(15,'egg',1000,100,20);
--�߰�
insert into emp_test values(16,'cat',1600,300,20);
insert  into emp_test values(17,'orange',2000,null,10);
--16�� ����� �޿�(sal)�� Ŀ�̼�(comm)�� ���� �������
--1. 16����� ����
select sal, comm from emp_test where empno='16';
--2. 
select *from emp_test
where (sal,comm)=(select sal, comm from emp_test where empno='16');
--�Ǵ�
select*from EMP_TEST
where sal=1600 and comm=300;
-- ������ ���
select *from emp_test
where (sal,comm)=(1600,300);

-- �μ��� 30�� ����� �޿�, Ŀ�̼��� ���� ����� ������ ���Ѵ�.
select*from emp_test
where ((sal,comm)in (select sal, comm from emp_test where deptno='30'));

select*from emp_test -- �н�1 23p 
where ((sal,nvl(comm,-1))in (select sal, nvl(comm,-1) 
from emp_test where deptno='30'));  -- ??

select sal,nvl(comm,-1)from emp_test where deptno='30';  --??

select *from emp_test;
-- oange ����� �޿��� Ŀ�̼��� ���� ��� �˻�
select sal,comm from emp_test where ename='orange';

select*from emp_test
where (sal,comm)=(select sal,nvl(comm,-1)
from emp_test where ename='orange';  -- xxxxxxx

select *from emp_test;
--egg�� �޿��� ���� ����� �̸� �˻�
select sal from emp_test where ename='egg';
select *from emp_test where sal='1000';

select*from emp_test
where sal=(select sal from emp_test where ename='egg');

-- banana����� Ŀ�̼��� ���� ����� �̸� �˻�
select comm from emp_test where ename='banana';
select *from emp_test where comm='300';

select *from emp_test
where comm=(select comm from emp_test where ename='banana');

--apple ����� Ŀ�̼��� ���� ����̸� �˻�
select comm from emp_test where ENAME='apple';

select * from emp_test
where nvl(comm,-1) = (select nvl(comm,-1) from emp_test where ename='apple');













