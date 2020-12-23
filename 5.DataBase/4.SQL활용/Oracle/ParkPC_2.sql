create table subject(
	sub_no char(3),          --과목번호     
	sub_name varchar2(30),   --과목이름 
	sub_prof varchar2(12),   --교수명
	sub_grade number(1),     --학년  
	sub_dept varchar2(20),   --학과 
	constraint p_sub_no primary key(sub_no));


--subject(과목)데이터 삽입
insert into subject values('111', '데이터베이스', '이재영', 2, '컴퓨터정보');
insert into subject values('110', '자동제어', '정순정', 2, '전기전자');
insert into subject values('109', '자동화설계', '박민영', 3, '기계');
insert into subject values('101', '컴퓨터개론', '강종영', 3, '컴퓨터정보');
insert into subject values('102', '기계공작법', '김태영', 1, '기계');
insert into subject values('103', '기초전자실험', '김유석', 1, '전기전자');
insert into subject values('104', '시스템분석설계', '강석현', 3, '컴퓨터정보');
insert into subject values('105', '기계요소설계', '김명성', 1, '기계');
insert into subject values('106', '전자회로실험', '최영민', 3, '전기전자');
insert into subject values('107', 'CAD응용실습','구봉규',2,'기계');
insert into subject values('108', '소프트웨어공학','권민성',1,'컴퓨터정보');


--enrol(수강)테이블 생성
create table enrol(
	sub_no char(3),       --과목번호
	stu_no char(9),       --학번 
	enr_grade number(3),  --점수
	constraint p_course primary key(sub_no,stu_no));


--enrol(수강)데이터 삽입
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

select student.*,enrol.*   -- cross 조인
from STUDENT cross join ENROL;

select ENROL.STU_NO       
from STUDENT cross join ENROL;

select*
from student,enrol
where STUDENT.STU_NO = enrol.STU_NO;-- Equi join : 

select *
from STUDENT natural join ENROL;       -- Natural join
-- 같은 열이 하나만 존재할 때

select *
from student join ENROL using(stu_no);
--열의 이름이 같은 경우 2쌍 이상일경우 (join using)

select *
from STUDENT join ENROL on STUDENT.STU_NO=ENROL.STU_NO;
--  또 다른 표현법 (join on)

select *
from STUDENT join ENROL on STUDENT.STU_NO=ENROL.STU_NO
where stu_grade=3;

--김종헌 학생이 수강한 과목번호를 검색하시오.
select *from STUDENT;
select *from ENROL;

-- 실제 쓰는 형식!!
select Sub_NO
from student,enrol
where student.STU_NO=enrol.STU_NO and student.STU_NAME='김종헌';
-- 권장하는 형식
select Sub_NO
from student join enrol on (student.stu_no=enrol.stu_no)
where STU_NAME='김종헌';

select student.STU_NO  
-- student테이블의 넘버만 검색하게 됨.
from student,enrol
where student.STU_NO=enrol.STU_NO and student.STU_NAME='김종헌';
-- 20131001 
-- 20131001 
-- 20131001 => 김종헌 학생의 학번만 나오게 됨.

--101번 과목이나 102번을 듣는 학생의 명단을 확인하시오.
select stu_name
from STUDENT,ENROL
where (student.stu_no=enrol.stu_no)and (sub_no=101 or sub_no=102); 

--기계과 학생들의 수강과목 점수합이랑 평균점수를 구하시오.

select sum(enr_grade), round(avg(enr_grade),2)
from student, enrol
where (student.stu_no=enrol.stu_no)and (student.stu_dept='기계');
-- student.stu_no=enrol.stu_no는 같은 학번끼리 계산해야 함으로

-- 각 학과별 남학생의 수강과목 평균점수를 구하시오.
select STU_DEPT, avg(enr_grade)AS "평균점수"
from student join enrol using (stu_no)
where stu_gender='M'
group by stu_dept
ORDER BY 2 DESC;
-- ORDER BY 2 DESC의 '2'는 select STU_DEPT, avg(enr_grade)의 2번째 뜻
-- 다시 말해 ORDER BY avg(enr_grade) DESC; 로 별칭을 사용하서 표현도 가능.
-- 다시 말해 ORDER BY "평균점수" DESC; 도 가능.

select *from ENROL;
select *from SUBJECT;

select *
from enrol natural join SUBJECT
order by 1; 
-- 1은 sub_no

-- 우항의 것을 모두 보겠다 
select *
from enrol right outer join SUBJECT on enrol.sub_no=SUBJECT.SUB_NO
order by 1;

-- 좌항의 것을 모두 보겠다.
select *
from enrol left outer join SUBJECT on enrol.sub_no=SUBJECT.SUB_NO
order by 1; 

-- 양족을 모두 보겠다.
select *
from enrol full outer join SUBJECT on enrol.sub_no=SUBJECT.SUB_NO
order by 1; 

select *from STUDENT;
select *from Subject;
select count(*)
from enrol;
-- 교수명이 영으로 끝나는 과목을 수강하는 학번을 검색
select stu_no
from enrol,SUBJECT --과목번호가 필요하니깐 student table은 필요없음.
WHERE (enrol.sub_no=subject.sub_no) and sub_prof like '%영';

-- 남학생과 여학생별 수강과목 평균점수 및 평균키
select student.stu_gender, avg(enr_grade),avg(stu_height)
from enrol,student
where enrol.stu_no=student.stu_no
group by stu_gender; -- 선택과 같게 한다.
-- natural join을 쓰면
select stu_gender, avg(enr_grade),avg(stu_height)
from enrol natural join student
group by stu_gender;


-- 학생들이 가장 많이 수강하는 과목별 순서대로 검색.
select sub_name, count(*)  -- count(*)사용 개념 check
from enrol natural join subject
group by sub_name
order by count(*) desc;



