create table subject(
	sub_no char(3),          --�����ȣ     
	sub_name varchar2(30),   --�����̸� 
	sub_prof varchar2(12),   --������
	sub_grade number(1),     --�г�  
	sub_dept varchar2(20),   --�а� 
	constraint p_sub_no primary key(sub_no));


--subject(����)������ ����
insert into subject values('111', '�����ͺ��̽�', '���翵', 2, '��ǻ������');
insert into subject values('110', '�ڵ�����', '������', 2, '��������');
insert into subject values('109', '�ڵ�ȭ����', '�ڹο�', 3, '���');
insert into subject values('101', '��ǻ�Ͱ���', '������', 3, '��ǻ������');
insert into subject values('102', '�����۹�', '���¿�', 1, '���');
insert into subject values('103', '�������ڽ���', '������', 1, '��������');
insert into subject values('104', '�ý��ۺм�����', '������', 3, '��ǻ������');
insert into subject values('105', '����Ҽ���', '���', 1, '���');
insert into subject values('106', '����ȸ�ν���', '�ֿ���', 3, '��������');
insert into subject values('107', 'CAD����ǽ�','������',2,'���');
insert into subject values('108', '����Ʈ�������','�ǹμ�',1,'��ǻ������');


--enrol(����)���̺� ����
create table enrol(
	sub_no char(3),       --�����ȣ
	stu_no char(9),       --�й� 
	enr_grade number(3),  --����
	constraint p_course primary key(sub_no,stu_no));


--enrol(����)������ ����
insert into enrol values('101', '20131001',80);
insert into enrol values('104', '20131001',56);
insert into enrol values('106', '20132003',72);
insert into enrol values('103', '20152088',45);
insert into enrol values('101', '20131025',65);
insert into enrol values('104', '20131025',65);
insert into enrol values('108', '20131001',81);
insert into enrol values('107', '20151062',41);
insert into enrol values('102', '20143054',66);
insert into enrol values('105', '20153075',56);
insert into enrol values('102', '20135307',61);
insert into enrol values('105', '20153088',78);

------------------------------------------------------------------------


SELECT *from ENROL;
select* from subject;
select* from STUDENT;

select student.*,enrol.*   -- cross ����
from STUDENT cross join ENROL;

select ENROL.STU_NO       
from STUDENT cross join ENROL;

select*
from student,enrol
where STUDENT.STU_NO = enrol.STU_NO;-- Equi join : 

select *
from STUDENT natural join ENROL;       -- Natural join
-- ���� ���� �ϳ��� ������ ��

select *
from student join ENROL using(stu_no);
--���� �̸��� ���� ��� 2�� �̻��ϰ�� (join using)

select *
from STUDENT join ENROL on STUDENT.STU_NO=ENROL.STU_NO;
--  �� �ٸ� ǥ���� (join on)

select *
from STUDENT join ENROL on STUDENT.STU_NO=ENROL.STU_NO
where stu_grade=3;

--������ �л��� ������ �����ȣ�� �˻��Ͻÿ�.
select *from STUDENT;
select *from ENROL;

-- ���� ���� ����!!
select Sub_NO
from student,enrol
where student.STU_NO=enrol.STU_NO and student.STU_NAME='������';
-- �����ϴ� ����
select Sub_NO
from student join enrol on (student.stu_no=enrol.stu_no)
where STU_NAME='������';

select student.STU_NO  
-- student���̺��� �ѹ��� �˻��ϰ� ��.
from student,enrol
where student.STU_NO=enrol.STU_NO and student.STU_NAME='������';
-- 20131001 
-- 20131001 
-- 20131001 => ������ �л��� �й��� ������ ��.

--101�� �����̳� 102���� ��� �л��� ����� Ȯ���Ͻÿ�.
select stu_name
from STUDENT,ENROL
where (student.stu_no=enrol.stu_no)and (sub_no=101 or sub_no=102); 

--���� �л����� �������� �������̶� ��������� ���Ͻÿ�.

select sum(enr_grade), round(avg(enr_grade),2)
from student, enrol
where (student.stu_no=enrol.stu_no)and (student.stu_dept='���');
-- student.stu_no=enrol.stu_no�� ���� �й����� ����ؾ� ������

-- �� �а��� ���л��� �������� ��������� ���Ͻÿ�.
select STU_DEPT, avg(enr_grade)AS "�������"
from student join enrol using (stu_no)
where stu_gender='M'
group by stu_dept
ORDER BY 2 DESC;
-- ORDER BY 2 DESC�� '2'�� select STU_DEPT, avg(enr_grade)�� 2��° ��
-- �ٽ� ���� ORDER BY avg(enr_grade) DESC; �� ��Ī�� ����ϼ� ǥ���� ����.
-- �ٽ� ���� ORDER BY "�������" DESC; �� ����.

select *from ENROL;
select *from SUBJECT;

select *
from enrol natural join SUBJECT
order by 1; 
-- 1�� sub_no

-- ������ ���� ��� ���ڴ� 
select *
from enrol right outer join SUBJECT on enrol.sub_no=SUBJECT.SUB_NO
order by 1;

-- ������ ���� ��� ���ڴ�.
select *
from enrol left outer join SUBJECT on enrol.sub_no=SUBJECT.SUB_NO
order by 1; 

-- ������ ��� ���ڴ�.
select *
from enrol full outer join SUBJECT on enrol.sub_no=SUBJECT.SUB_NO
order by 1; 

select *from STUDENT;
select *from Subject;
select count(*)
from enrol;
-- �������� ������ ������ ������ �����ϴ� �й��� �˻�
select stu_no
from enrol,SUBJECT --�����ȣ�� �ʿ��ϴϱ� student table�� �ʿ����.
WHERE (enrol.sub_no=subject.sub_no) and sub_prof like '%��';

-- ���л��� ���л��� �������� ������� �� ���Ű
select student.stu_gender, avg(enr_grade),avg(stu_height)
from enrol,student
where enrol.stu_no=student.stu_no
group by stu_gender; -- ���ð� ���� �Ѵ�.
-- natural join�� ����
select stu_gender, avg(enr_grade),avg(stu_height)
from enrol natural join student
group by stu_gender;


-- �л����� ���� ���� �����ϴ� ���� ������� �˻�.
select sub_name, count(*)  -- count(*)��� ���� check
from enrol natural join subject
group by sub_name
order by count(*) desc;



