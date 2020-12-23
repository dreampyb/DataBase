create table student(
  stu_no char(9),
  stu_name varchar2(12),
  stu_dept varchar2(20),
  stu_grade number(1),
  stu_class char(1),
  stu_gender char(1),
  stu_height number(5,2), --���� 3�ڸ� �Ҽ� 2�ڸ�
  stu_weight number(5,2),
  constraint p_stu_no primary key(stu_no));

desc student;
insert into student values(20153075, '���Ѻ�', '���', 1, 'C', 'M',177,80);
insert into student values(20153088, '���¿�', '���', '1', 'C', 'F',162,50);
insert into student values(20143054, '������', '���', '2', 'C', 'F',154,47);
insert into student values(20152088, '���ο�', '��������', '1', 'C', 'M',188,90);
insert into student values(20142021, '�ɼ���', '��������', '1', 'A', 'F',168,45);
insert into student values(20132003, '����ö', '��������', '3', 'B', 'M',null,63);
insert into student values(20151062, '������', '��ǻ������', '1', 'B', 'M',166,67);
insert into student values(20141007, '������', '��ǻ������', '2', 'A', 'M',174,64);
insert into student values(20131001, '������', '��ǻ������', '3', 'C', 'M',null,72);
insert into student values(20131025, '������', '��ǻ������', '3', 'A', 'F',172,63);
SELECT * FROM STUDENT;
SELECT stu_name from STUDENT;
SELECT stu_no, stu_name,stu_dept from student;
SELECT stu_name,stu_height, STU_WEIGHT from student;
SELECT * FROM STUDENT;
-- �ߺ� ���� ���
SELECT distinct stu_dept from STUDENT;
SELECT distinct stu_dept, stu_class from student;
SELECT distinct stu_gender from STUDENT;
SELECT STU_HEIGHT/100 as "����" from STUDENT; -- as ,  "" ���� ����.
-- �̸� ,�й�,Ű�� ���, ��½� �ʵ���� �ѱ۷� ����
SELECT stu_name as "�̸�", stu_no as "�й�", STU_HEIGHT as "Ű"from student;
SELECT stu_name �̸�, stu_no �й�, STU_HEIGHT Ű from student;  --�������� ��
SELECT stu_dept || stu_name "�а�,����" FROM STUDENT; -- �� �� ""�� ����.
SELECT '�̸���' || stu_dept|| '�Դϴ�' "�л����̸��� "  FROM STUDENT;
-- �л����� ����� ����Ͻÿ�(��, ��°���� ������ ���� ���·� ��µǾ�� �մϴ�.
-- EX> ����а��� �������� c�� ���Ѻ��Դϴ�.
SELECT stu_dept || '�а��� �������� ' || stu_class||'�� ' || stu_name || '�Դϴ�'from student;
SELECT * FROM STUDENT
where stu_dept='��ǻ������';
SELECT * FROM STUDENT
where (STU_GRADE >=2 or STU_GENDER='m')and STU_WEIGHT>70;
-- ����> c�� �л��� Ű�� 170�̻��� �л��̸��� ���
SELECT STU_NAME FROM STUDENT
where STU_CLASS='C' and STU_HEIGHT>170;
select*
from student;

SELECT STU_DEPT from student
where not (stu_dept='���');

-- �����԰� 60~70����
SELECT * FROM STUDENT
WHERE STU_WEIGHT >=60 AND STU_WEIGHT>=70;
-- �� �ٸ� ���
SELECT * FROM STUDENT
WHERE STU_WEIGHT BETWEEN 60 AND 70;
DESC STUDENT;

SELECT * FROM STUDENT
WHERE STU_NO BETWEEN 20141001 AND 20141999;
-- '' �� �Ⱥ��� ��� ���ڷ� ����
SELECT * FROM STUDENT
WHERE STU_NO BETWEEN '2014001' AND '2014999';
-- '' �� ���� ��� ���ڷ� ���� ���� �ٸ� ���� ���´�.
select*from STUDENT
where STU_NAME like '��%'; -- like�� ������ ���� �ִ� ����.

-- �̸��� ���� �ϳ� ���� �л�
SELECT * FROM student
where STU_NAME like '_��%';

-- ����� '��'�� ���� �л�
SELECT * FROM student
where STU_NAME like '_%��%_';

-- Ű�� 170�̻��̰� 2015�⵵ ������ �ٻ��� �̸��� ������ ���.
SELECT STU_NAME,STU_GENDER FROM STUDENT --select���� ,��and�ǹ�.
where (STU_HEIGHT>=170 and STU_no>'20150001');

-- 3�г� �̸鼭 B���� �ƴϰ� ���л��� Ű�� 160�̻��� ���� ���� �л��� ������ ���
SELECT * FROM STUDENT
WHERE STU_GRADE='3'
AND STU_CLASS !='B' -- �������� ��ҹ��� ���� ����.
AND STU_GENDER='F' 
AND STU_HEIGHT>=160
AND STU_NAME LIKE '��%';

SELECt * from STUDENT
where STU_HEIGHT =null; -- null�� ���ڸ� ã�´ٴ� �������� �ȵ�

SELECt * from STUDENT
where STU_HEIGHT is null;  -- �׷��Ƿ� �ݵ�� is�� ���

SELECt * from STUDENT
where STU_HEIGHT is not null;  -- != �� ���

SELECt * from STUDENT
where STU_DEPT in ('��ǻ������', '���');  -- �̶��� %�� ����

SELECt * 
from STUDENT
where STU_GENDER='M'
order by STU_NO;   -- �������� ����

SELECt * 
from STUDENT
where STU_GENDER='M'
order by STU_NO DESC; -- �������� ����

SELECt * 
from STUDENT
order by STU_CLASS;

SELECt * 
from STUDENT
order by STU_CLASS, STU_GRADE;

SELECt * 
from STUDENT
order by STU_CLASS DESC, STU_GRADE; -- ���� ��������, �ڴ� ��������

-- �й��� 2015�� �����ϴ� �л��� �̸��� ������������ �����ؼ� ����Ͻÿ�.
SELECt STU_NAME -- �̸��� ������
from STUDENT
WHERE STU_NO LIKE '2015%'
ORDER BY STU_NAME;

-- �л� ������ �й�, �̸�, �а�, ������ �� ���

SELECt STU_NO, STU_NAME, STU_DEPT, STU_WEIGHT as "������"
from STUDENT                -- ��Ī������ ��.
ORDER BY 4; -- SELECT�߿� 4��°�� �����Ͽ� ����.

SELECt STU_NO, STU_NAME, STU_DEPT, STU_WEIGHT-5 as "������"
from STUDENT                -- ��Ī������ ��.
ORDER BY STU_HEIGHT; -- ���ĸ� �ǰ� ����� �ȵ�

--������ ���л��� �������ڰ��� ���л��� ����� �й��� ����(�Ĺ�) ������� ����Ͻÿ�.
SELECt *
from STUDENT
where (STU_DEPT= '���' and STU_GENDER='M')OR
(STU_DEPT='��������'AND STU_GENDER='F')
order by stu_NO DESC;

SELECT ROUND(345.678,0) FROM DUAL; -- 346
SELECT ROUND(345.678,1) FROM DUAL; -- 345.7
SELECT ROUND(345.678,2) FROM DUAL; -- 345.68

SELECT ROUND(STU_HEIGHT, -1) FROM STUDENT;
SELECT TRUNC(123.456, 2) FROM DUAL; -- ���� �μ������� ����
SELECT MOD(123.456, 2) FROM DUAL;  -- ��������
SELECT ABS(-123.45) FROM DUAL;     -- ���밪
SELECT FLOOR(123.457) FROM DUAL;  -- �Ҽ��� ���� ����
SELECT TRUNC(123.45, 0) FROM DUAL;  --���� ���

SELECT STU_HEIGHT/30.48 FROM STUDENT;
-- �Ҽ��� ù°�ڸ������� �������� (�� �Ҽ��� ��°¥�� �ݿø�)
SELECT ROUND(STU_HEIGHT/30.48, 1) FROM STUDENT;

SELECT LOWER('KOREA')FROM DUAL;
SELECT UPPER('KOREA')FROM DUAL;
SELECT INITCAP('ENAME')FROM DUAL;
SELECT CONCAT('ENAME','JOB')FROM DUAL;
SELECT 'ENAME'||'JOB' FROM DUAL;
SELECT SUBSTR('ENAME'2,3)FROM DUAL;
SELECT LENGTH('ENAME')FROM DUAL;
SELECT LENGTH('������')FROM DUAL;

SELECT INSTR('AAENAAAAMEAA','A','3','2') FROM DUAL;

SELECT LPAD('ENAME', '10','-') FROM DUAL;
SELECT RPAD('ENAME', '10','-') FROM DUAL;

SELECT SYSDATE+10 FROM DUAL;  -- 20/10/6 +10���� 
SELECT SYSDATE+60/(1/24) FROM DUAL;
--������ �� (1�ð��� 1/24, 1���� 60/(1/24) )
SELECT MONTHS_BETWEEN
       (TO_DATE('02-02-1995','MM-DD-YYYY'),
        TO_DATE('01-01-1995','MM-DD-YYYY') ) "Months" FROM DUAL;
SELECT MONTHS_BETWEEN
    (SYSDATE+31,SYSDATE) FROM DUAL; --EX> �����, �Ի���
     -- 31�������� ���ñ���   
     
--EMP���̺��� �����ϴ� INDATE�ʵ尡 ���� ���     
SELECT MONTHS_BETWEEN
    (SYSDATE,INDATE) FROM DUAL;
     
SELECT NEXT_DAY(SYSDATE,'��') FROM DUAL; -- 20/10/12

SELECT LAST_DAY(SYSDATE) FROM DUAL;     -- 20/10/31

SELECT ROUND(SYSDATE, 'MON') FROM DUAL; -- 20/10/01

SELCET TO_CHAR(SYSDATE,'yyyy-mm-DD')FROM DUAL;

SELECT TO_CHAR(123) FROM DUAL; --���ڷ� ��ȭ�Ͽ� ���.
SELECT TO_NUMBER('123')FROM DUAL; -- ���ڷ� ���.

SELECT TO_CHAR(('122.34455'), '999.99') FROM DUAL;
-- #######������ ������(A,B)�� A��B�� �Ҽ��� �ڸ��� �� �ٸ���
SELECT TO_CHAR(TO_NUMBER('122.34455'), '999.99') FROM DUAL;

SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD/HH/SS')FROM DUAL; -- 2020/10/06/12/07

SELECT NVL(STU_WEIGHT, 0) FROM STUDENT;  -- NULL�� ��ȯ.
SELECT NVL2(STU_WEIGHT, 0,1) FROM STUDENT;
-- STU_WEIGHT���� NULL�� �ƴϸ� 0 NULL�̸� 1���.

SELECT NULLIF('A','A') FROM DUAL; 
SELECT NULLIF('B','A') FROM DUAL; 
-- �ΰ��� ���� ������ NULL , �ƴϸ� ���� �� ���.
SELECT NVL(NULLIF('A','A'),'�ΰ�') FROM DUAL; --�ΰ�
SELECT NVL(NULLIF('B','A'),'�ΰ�') FROM DUAL; -- B

SELECT COALESCE(2,NULL, 10,100,NULL) FROM DUAL;
-- ù��° ���� NULL���� �ƴϸ� ù��° ����
SELECT COALESCE(NULL,NULL, 10,100,NULL) FROM DUAL;
-- ù��° ���� NULL���̸�, �� ���� ������ NULL�� �ƴ� ������ ���

select stu_name , 
   case when stu_grade=1 then stu_weight*10
        when stu_grade=2 then stu_weight*100
        else stu_weight 
   end as "��Ī����" 
from student;

select stu_name , 
   case stu_grade when 1 then stu_weight*10
                  when 2 then stu_weight*100
                  else stu_weight 
   end as "c_weight" 
from student;

select stu_name , 
   decode( stu_grade, 1, stu_weight*10,
                      2, stu_weight*100,
                      stu_weight ) as "c_weight" 
from student;

--������ ���л��̰ų� �г��� 1�г��� �л��� Ű�� 170�̻��� �л��̸��� ����Ͻÿ�.
--�л��̸��� ���(�� ��� ����)  
SELECT SUBSTR(STU_NAME,2,2)
FROM STUDENT
WHERE (STU_GENDER='M' OR STU_GRADE='1')
AND STU_HEIGHT>=170;

-- �л� ���̺��� ���� �Ǵ� ��ǻ�� ������ �л��̸鼭 ���л��� �л����� Ű�� �˾Ƴ��ô�'
--��, ��½� Ű�� ū ������� ����.
SELECT STU_HEIGHT -- ������ �䱸������ �̰��� ���� �� �ֽ�
FROM STUDENT
WHERE (STU_DEPT='���' OR STU_DEPT='��ǻ������')AND STU_GENDER='F'
ORDER BY STU_HEIGHT;

SELECT AVG(STU_WEIGHT)
FROM STUDENT
WHERE STU_GENDER='F';

SELECT ROUND(AVG(STU_WEIGHT),1)-- 1��° �ڸ��� �ݿø�
FROM STUDENT
WHERE STU_GENDER='M';

-- COUNT( ) : ������ �����ϴ� ���� ������ ������ ������ ��ȯ
SELECT COUNT(*), COUNT(STU_NO),COUNT(STU_HEIGHT)
FROM STUDENT;

SELECT COUNT(*), COUNT(STU_NO),COUNT(STU_HEIGHT)
FROM STUDENT;

SELECT *FROM STUDENT;
-- ex1> ��ü �л��� �ְ� ����� ���� ���� ��ȯ
SELECT MAX(STU_HEIGHT),MIN(STU_HEIGHT)
FROM STUDENT;    -- 188     154

--ex2> ���� �л��� �ְ� ����� ���� ���� ��ȯ
SELECT MAX(STU_HEIGHT),MIN(STU_HEIGHT)
FROM STUDENT
WHERE STU_DEPT='���';   --177     154

-- ex3>��ü �л����� ���尪�� ���� �л��� ��ȯ
SELECT COUNT(*),COUNT(STU_HEIGHT)
FROM STUDENT;   -- 10    8

-- ex4> ��ü �л��� ���ϴ� �а��� ���� �ߺ����� ��ȯ
SELECT COUNT(DISTINCT STU_DEPT)  
-- DISTINCT�� ��ȸ�Ϸ��� Į���� �ߺ��Ǵ� ���� ���� �� �����ش�.
FROM STUDENT;   -- 3

-- �� �л��� �����Ը� �̸��� �Բ� �˻� �� 
-- ���л��� �̸��� ǥ��ü���� ��� (ǥ��ü��= (Ű-100)*0.9)
-- �׸��� �񸸵��� �߰��Ͽ� ��� (�񸸵� =����ü��/ ǥ��ü��)
select STU_NAME,(STU_HEIGHT-100)*0.9,
    STU_WEIGHT/((STU_HEIGHT-100)*0.9)
FROM STUDENT
WHERE STU_GENDER='M';

-- ���л��� �񸸵��� 0.9�̻��� �л��� �й��� �̸��� �˻��Ͻÿ�.
SELECT STU_NO , STU_NAME
FROM STUDENT
WHERE STU_GENDER='M' AND STU_WEIGHT/((STU_HEIGHT-100)*0.9)>=1;

-- ���л��� �񸸵��� 1�̻��� �л����� �񸸵� ����� ���Ͻÿ�.
SELECT AVG(STU_WEIGHT/((STU_HEIGHT-100)*0.9))
FROM STUDENT
WHERE STU_GENDER='M' AND STU_WEIGHT/((STU_HEIGHT-100)*0.9)>=1;

-- ���л����� ������ ���, ǥ��Ǧ��, �л갪�� ���Ͻÿ�.
-- �Ҽ��� 2°�ڸ����� �ݿø��ؼ� ����Ͻÿ�.
SELECT AVG(STU_WEIGHT),
ROUND(STDDEV(STU_WEIGHT),2), 
ROUND(VARIANCE(STU_WEIGHT),2)
FROM STUDENT
WHERE STU_GENDER='F';

-- �׷캰�� ����
SELECT STU_DEPT , AVG(STU_WEIGHT)
FROM STUDENT
GROUP BY STU_DEPT;

-- ü���� 50KG�̻� �л����� �а��� �ο��� ���ϱ�
SELECT STU_DEPT, COUNT(*)
FROM STUDENT
WHERE STU_WEIGHT>=50
GROUP BY STU_DEPT;

-- �г⺰ ���Ű
SELECT STU_GRADE , AVG(STU_HEIGHT)
FROM STUDENT
GROUP BY STU_GRADE;

--�а����� �׷�ȭ �� �ٽ� �г⺰�� �׷�ȭ�� ��Ų �� �л��� ���ϱ�
SELECT STU_DEPT, STU_GRADE, COUNT(*)
FROM STUDENT
GROUP BY STU_DEPT , STU_GRADE  -- ���߿� GROUP BY ��: AND�� ','�� ǥ��
ORDER BY STU_DEPT;

-- ���� �л��� �� �г⺰ ��� ������ 160�̻��� �г�� ��� ����
SELECT STU_GRADE, AVG(STU_HEIGHT)
FROM STUDENT
WHERE STU_DEPT='���'
GROUP BY STU_GRADE HAVING AVG(STU_HEIGHT)>=160;

-- �ִ������ 175�� �а��� �а��� �ִ� ����
SELECT STU_DEPT, MAX(STU_HEIGHT)
FROM STUDENT
GROUP BY STU_DEPT HAVING MAX(STU_HEIGHT)>=175;
-- HAVING : �־��� ����� �����ǽ�

-- �а��� ��ս��� �� ���� ���� ��� ����
SELECT MAX(AVG(STU_HEIGHT))
FROM STUDENT
GROUP BY STU_DEPT;

SELECT STU_DEPT , AVG(STU_HEIGHT)
FROM STUDENT
GROUP BY STU_DEPT
ORDER BY AVG(STU_HEIGHT) DESC;

-- ���ະ ��� Ű
SELECT STU_GENDER , AVG(STU_HEIGHT)
FROM STUDENT
GROUP BY STU_GENDER;

-- �а��� ��� ���� �� ���� ���� ��� ����� �а�
-- ���������� �ʿ� - ����������� ���� �ۼ� �Ұ�
SELECT MAX(AVG(STU_HEIGHT))
FROM STUDENT
GROUP BY STU_DEPT;

-- �г⺰ ���Ű�� ��� ������
SELECT AVG(STU_HEIGHT),AVG(STU_WEIGHT)
FROM STUDENT
GROUP BY STU_grade;






\







