select *from social
where domn_nm='��';

--����Ÿ ���� domn_nm�� ��ȯ��, ��Ȱȯ��, �ڿ�ȯ���� �ƴ� �����Ͱ� �ִ��� Ȯ�� ��,
-- �߸��� ���� ����� Ȯ���Ͻÿ�.
select*from social
where domn_nm !='��ȯ��'
  and DOMN_NM !='��Ȱȯ��'
  and domn_nm !='�ڿ�ȯ��';
-- �Ǵ�
select*from social
where DOMN_NM not in('��ȯ��','��Ȱȯ��','�ڿ�ȯ��');


select distinct domn_nm,ctgry_nm
from social
order by 1,2;
-- ctgry_nm�� 15�������� �Ϳ� ���� ������ Ȯ���Ͻÿ�.
select *
from social
where  CTGRY_NM not in('���糭','�����','���ϼ�', '�ϼ���','��õ','ȣ��','���',
'��⹰','ȭ�й���','���ȭ','���ĺ�ȭ','���°�','����','����','���');
-- ���� �ִ� 15���� ���� ���� �ٽ� ���� ���� �߰��Ѱ� 1���� �̹Ƿ�,

select count(*)
from social
--where domn_nm in ('��ȯ��','��Ȱȯ��','�ڿ�ȯ��') -- 33837
where domn_nm not in ('��ȯ��','��Ȱȯ��','�ڿ�ȯ��'); -- 1

select count(distinct id)
from social;     -- 33837

select count(*)-(count(distinct id))
from social;     -- 1

select max(id)- count(distinct id)
from social;   --0

select max(id)- count(*)
from social; -- '-1' ���� ���� ���� �ϳ��̴ϱ� �ߺ��� ���� 1��

select *
from social;
-- �Ӽ��� ���� Ȯ�� �� ���� Ȯ��
select DISTINCT atrb_nm
from social;   -- �Ӽ��� ���� Ȯ��
select count(DISTINCT atrb_nm)
from social;   -- �Ӽ��� ���� ����

-- ���糭(ī�װ�)�� �ι�(�Ӽ�)�� ����� ���� ������� �˻�
select RELATED_WRD_NM, sum(dily_buzz_co) -- dily_buzz_co�� �������� ������ �ʾҴµ�?
from social                  -- ������ '����� ���� ����'��� ���� �̹� count�� ����
where ctgry_nm='���糭' and atrb_nm='�ι�' and chnnl_nm='All'
-- and chnnl_nm='All' �� ���� ������ All�ӿ� �̹� �� SNS�� ���ԵǾ� �����Ƿ�
group by RELATED_WRD_NM
order by sum(dily_buzz_co) desc;

--(ȯ�濡 ���� �̽���) 1��1�Ͽ� ��޵� ��ǰ���� �˰� �ʹ�.
select related_wrd_nm, sum(DILY_BUZZ_CO) -- sum(DILY_BUZZ_CO)??
from social
where ATRB_NM='�������θ�Ʈ' and chnnl_NM='All' --??
group by related_wrd_nm
order by sum(DILY_BUZZ_CO)desc ;

select distinct RELATED_WRD_NM
from SOCIAL;

-- ���׿��� ������ ������ ������ Ʈ���Ϳ��� ������ ������ ������ �˰� �ʹ�
-- 1. ä���� ��α��� Ʃ���� ���� Ȯ��
-- 2. ä���� Ʈ������ Ʃ���� ���� Ȯ��
-- 3, ���� �� �� �˷���.

select distinct chnnl_nm
from social;

select count(*)       -- 1
from social
where chnnl_nm='blog';

select count(*)         --2
from social
where chnnl_nm='twitter';



--  SQL �н�2 ���� -����Ÿ �Է�
--subject(����)���̺� ����
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