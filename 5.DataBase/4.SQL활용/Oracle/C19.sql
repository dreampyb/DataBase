select * from C19_20201012_1013;
-- ������ Ȯ���� �� (���� ������� ���)
select ����, count(*)
from C19_20201012_1013
group by ����
order by count(*)desc;

--������� �������� �ڷηγ� 19 Ȯ���ڼ�
select count(*)
from C19_20201012_1013;

-- ������ ���� ����
select DISTINCT ����
from C19_20201012_1013; --null/���/���

--ġ������ �ο�Ȯ���ϱ�
--null���� �˻��ϱ�
select count(*)
from C19_20201012_1013
WHERE ���� is null;  -- 606

select count(*)
from C19_20201012_1013
WHERE ����='���'; -- 64

--����� Ȯ��
select count(*) from C19_20201012_1013 WHERE ����='���';

select count(*) from C19_20201012_1013 WHERE ����='���';

select 
(select count(*) from C19_20201012_1013 WHERE ����='���')
/ (select count(*) from C19_20201012_1013 WHERE ����!='���')*100
from dual;  -- 1.307
-- �����/��ġ��+ġ����
select 
round((select count(*) from C19_20201012_1013 WHERE ����='���')
/ (select count(*)from C19_20201012_1013)*100 ,3)
from dual;  -- 1.150

select *from C19_20201012_1013;
--���⿩�� ���� Ȯ��
select distinct ���⿩�� from C19_20201012_1013;
--������ �ּҰ��� �ִ밪
select min(����),max(����)from C19_20201012_1013;

select COUNT(*) from C19_20201012_1013;
--��ġ������ ����
select distinct ��ġ���� from C19_20201012_1013;

--���ں� Ȯ���ڼ� ���ϱ� (���ں��� ���� - ��������)
select  Ȯ����, COUNT(*) 
from C19_20201012_1013
group by Ȯ����
order by to_date(Ȯ����,'mm.dd.') ;
-- ����ǥ�ô� ������Ÿ�� �����ִ� ���Ĵ�� ǥ������� ���
--or 
select  Ȯ����, COUNT(*) 
from C19_20201012_1013
group by Ȯ����
order by to_number(rtrim(Ȯ����,'.'));

--��� ���� ���˵Ǿ����� �˻�
select *from C19_20201012_1013;

select ���˷�, count(*)
from C19_20201012_1013
group by ���˷� 
-- �ᱹ �׷��Լ��� �׷����� ���� �� �ְų�, �׷����� ������ �Ϳ� ���ؼ��� ����� �ô�.
order by count(*)desc;

select *from STUDENT;
insert into student values('19970406', '����', '��ǻ������', '1', 'A', 'M',172,63);

insert into student(stu_no,stu_name) VALUES('19971103', '������');

insert into a_student
select * from STUDENT; --??

select *from A_ENROL;

create table a_enrol as select * from enrol where STU_NO< 19971103;
-- a_enrol�̶�� �̸��� table ����, ���� ������ �Է��� 3���� �׸� ��������
-- ������ ���� table ����.
create table aenrol as select * from enrol where STU_NO< 19971103;
-- aenrol�̶�� �̸��� table ����, ���� ������ �Է��� 3���� �׸� ��������
-- ������ ���� table ����.

insert into a_enrol 
select * from enrol 
where stu_no like '2001%'; --����?

--< ������ �Է�,����, ���� >
select *from student;
update student
set STU_NAME='���ϴ�'
where STU_no='20153075';

select *from a_enrol;

--�й��� 20153075�� �л��� �̸��� �ݳ�����  �����Ͻÿ�
update student
set stu_name='�ݳ���'
where stu_no=20153075;-- stu_no���� ''�� ������ �ȵȴ�.

--�ݳ����� �����Ͻÿ�.
delete from STUDENT
where stu_no=20153075;

-- �ݳ����� �ٽ� �����ÿ�.
insert into student values(20153075,'�ݳ���','������', 4,'A', 'F', '170', '48');
-- ���ϴ��࿡ �߰�

-- �ݳ��� �л��� Ű�� �˻��Ͻÿ�.
select stu_height
from student
where stu_name='�ݳ���';
commit;
select *from student;

update student
set stu_no='20111234'
where stu_no='20151111'; --������Ʈ �ȵ�?

select *from student;
update student
set stu_name='������'
where stu_name='������';
-- ����� commit ���� ���¸� �ٲٴ� ������ ����. 
rollback;











