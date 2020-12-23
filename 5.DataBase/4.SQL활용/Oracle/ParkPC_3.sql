-- <SubQuery -From ���� ������>
select *from student;
--������ �л����� ���庸�� ū �л��� �й�, �̸�,���� �˻�.
--1. ������ �л��� ����
--2. �� ���庸�� ū �л��� �й��� �̸�, ����, �˻�.
select STU_HEIGHT 
from student 
where stu_name='������';
select *from student where STU_HEIGHT>'172';

select *
from student 
where STU_HEIGHT > (select STU_HEIGHT from student where stu_name='������');
-- �̴� �Ʒ��Ͱ� ���� ����.
select b.*
from student a, student b
where (a.stu_height<b.stu_height) and a.stu_name='������';

ex1> ����ö �л��� ���� ü���� ������ �ִ� �л��� ����
--1.����ö �л��� ü���� ���Ѵ�.
select stu_weight from student where stu_name='����ö';
--2. ü���� 63�� �л��� �˻�
select *from student where stu_weight='63';
--3. ���Ķ�
select *from student
where stu_weight=(select stu_weight from student where stu_name='����ö');

ex2> ���� �������� ����ö�� ���ԵǼ� �����µ� ����ö�� ���Ե��� �ʰ� ����ҷ���?
select *from student
where stu_weight=(select stu_weight from student where stu_name='����ö')
and stu_name!='����ö';

ex3> ��ǻ������ �а��� ���� ���� �ٸ� �а��� �л������� in�� �̿��Ͽ� �˻�
--1.��ǻ�������а��� �� �˻�
select stu_class 
from student
where stu_dept='��ǻ������';
--2. B,A,C,A�� �ش��ϴ� �ٸ� �а��� �л����� ���.
SELECT *from student 
where stu_class in('B','A','C','A')and stu_dept!='��ǻ������';
--3.���Ķ�
select *from student
where stu_class in (select distinct stu_class from student where stu_dept='��ǻ������')
-- distinct�� 'B','A','C','�� �ߺ����Ÿ� ����.
and stu_dept <> '��ǻ������';

ex4> ������ ��ü �л����� ��� ���庸�� ū �л��� �˻�
--1.��ü �л����� ��ս���
select avg(stu_height) from student;
--2. �װ����� ū �л� �˻�
select * from student where stu_height>'170.125';
--3. ��ġ��
select *from student
where stu_height>(select avg(stu_height) from student);

--������ ��� �а����� ��� ���庸�� ū �л��� ����
--1,�а��� ��� ����
select round( avg(stu_height),1) from student group by stu_dept;
--2.�� ��ս���麸�� ū �л��� ����
select * from student where stu_height> all(164.34,178,170.7);--���ο� 188
-- or 
select max (avg(stu_height))from student group by stu_dept; --178
select*from student where stu_height>178;               --���ο� 188

-- ex7> ��ǻ�������� �ּ� ����� ���Ͽ� �ּ� ������ �� ū �а��� �а���� �ּҽ����� ���ϱ�
--1. ���� ���� ��ǻ�������а��� �ּҽ��� �˻�.
select min(stu_height) from student where stu_dept='��ǻ������';
--2. �а���, �ּҽ��� 
select STU_DEPT, min(STU_HEIGHT)from student 
group by stu_dept having min(stu_height)>166; 
-- having : �׷��Լ� ���� ����� �ٽ� ������ �ο��Ҷ�

-- ex8> 101�� ������ ������ �л����� ������ ���ϴ� ������ ����
select *from student;
select *from enrol;
-- 1. enrol���̺��� 101���� ������ �л����� �й��� �˻�.
select stu_NO FROM enrol where Sub_NO='101';
--2.1���� ���� �й��� �ش��ϴ� �л����� �˻�
select *from student
where stu_no in ('20131001','20131025');
--3. ���������� �й��߿� ����101�� �˻�
select *from student 
where stu_no in (select stu_NO FROM enrol where Sub_NO='101');
-- 20131001 	������	��ǻ������	3	C	M		72
-- 20131025 	������	��ǻ������	3	A	F	172	63

--* join���� ǥ���ϸ�
select student.*
from student join enrol on(student.stu_no=enrol.stu_no)
where sub_no='101';
-- 20131001 	������	��ǻ������	3	C	M		72
-- 20131025 	������	��ǻ������	3	A	F	172	63

-- ex9> 101�� ������ ������ �л����� �й�, �̸�, ������ �˻�
select *from student;
select *from enrol;
select *from student,enrol;

select *from enrol where sub_no='101';
select *from student where stu_no in ('20131001','20131025');
select student.stu_no, stu_name, enr_grade 
-- stu_no�� ���ʴ� �����Ƿ� ����, �������� �����ϹǷ� ���� �ʿ����.
from student join enrol on (student.stu_no=enrol.stu_no)
where sub_no=101;

select *from student;

-- �а����� �а��� ��� ���庸�� 
-- ū �л����� �˻�
select stu_dept, round(avg(stu_height),2) from student
group by stu_dept;

select*
from student, (select stu_dept, round(avg(stu_height),2)av 
            from student group by stu_dept)u 
where student.stu_dept = u.stu_dept and stu_height > u.av;
-- av�� avg(stu_height)�� ����ϴ� ��Ī,""����
-- u�� select stu_dept, round(avg(stu_height),2) from student group by stu_dept;
-- �� ��ü�� ��Ī,""����.

-- �ζ��� �� ���� ���̺� �̸��� �������� ��Ī�� �ٿ��� ���
-- �ٽø���, ������ �״�� ���� ����!!, �ݵ�� ��Ī�� ����� �����ؾ� ��!!!
















