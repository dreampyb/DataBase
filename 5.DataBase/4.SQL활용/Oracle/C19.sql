select * from C19_20201012_1013;
-- 지역별 확진자 수 (많은 순서대로 출력)
select 지역, count(*)
from C19_20201012_1013
group by 지역
order by count(*)desc;

--현재까지 서울지역 코로로나 19 확진자수
select count(*)
from C19_20201012_1013;

-- 상태의 종료 보기
select DISTINCT 상태
from C19_20201012_1013; --null/퇴원/사망

--치료중인 인원확인하기
--null값을 검색하기
select count(*)
from C19_20201012_1013
WHERE 상태 is null;  -- 606

select count(*)
from C19_20201012_1013
WHERE 상태='사망'; -- 64

--사망률 확인
select count(*) from C19_20201012_1013 WHERE 상태='사망';

select count(*) from C19_20201012_1013 WHERE 상태='퇴원';

select 
(select count(*) from C19_20201012_1013 WHERE 상태='사망')
/ (select count(*) from C19_20201012_1013 WHERE 상태!='사망')*100
from dual;  -- 1.307
-- 사망자/완치자+치료중
select 
round((select count(*) from C19_20201012_1013 WHERE 상태='사망')
/ (select count(*)from C19_20201012_1013)*100 ,3)
from dual;  -- 1.150

select *from C19_20201012_1013;
--노출여부 종류 확인
select distinct 노출여부 from C19_20201012_1013;
--연변의 최소값과 최대값
select min(연번),max(연번)from C19_20201012_1013;

select COUNT(*) from C19_20201012_1013;
--조치사항의 종류
select distinct 조치사항 from C19_20201012_1013;

--일자별 확진자수 구하기 (일자별로 정렬 - 오름차순)
select  확진일, COUNT(*) 
from C19_20201012_1013
group by 확진일
order by to_date(확진일,'mm.dd.') ;
-- 날자표시는 원데이타에 나와있는 형식대로 표기해줘야 출력
--or 
select  확진일, COUNT(*) 
from C19_20201012_1013
group by 확진일
order by to_number(rtrim(확진일,'.'));

--어디서 많이 접촉되었는지 검색
select *from C19_20201012_1013;

select 접촉력, count(*)
from C19_20201012_1013
group by 접촉력 
-- 결국 그룹함수는 그룹으로 묶을 수 있거나, 그룹으로 묶여진 것에 대해서만 출력이 돤다.
order by count(*)desc;

select *from STUDENT;
insert into student values('19970406', '김산수', '컴퓨터정보', '1', 'A', 'M',172,63);

insert into student(stu_no,stu_name) VALUES('19971103', '김지성');

insert into a_student
select * from STUDENT; --??

select *from A_ENROL;

create table a_enrol as select * from enrol where STU_NO< 19971103;
-- a_enrol이라는 이름의 table 생성, 폼은 이전에 입력한 3가지 항목만 들어오지만
-- 내용은 없는 table 생성.
create table aenrol as select * from enrol where STU_NO< 19971103;
-- aenrol이라는 이름의 table 생성, 폼은 이전에 입력한 3가지 항목만 들어오지만
-- 내용은 없는 table 생성.

insert into a_enrol 
select * from enrol 
where stu_no like '2001%'; --오류?

--< 데이터 입력,변경, 삭제 >
select *from student;
update student
set STU_NAME='강하늘'
where STU_no='20153075';

select *from a_enrol;

--학번이 20153075인 학생의 이름을 금나나로  변경하시오
update student
set stu_name='금나나'
where stu_no=20153075;-- stu_no에는 ''를 넣으면 안된다.

--금나나를 삭제하시오.
delete from STUDENT
where stu_no=20153075;

-- 금나나를 다시 넗으시오.
insert into student values(20153075,'금나나','기계공학', 4,'A', 'F', '170', '48');
-- 최하단행에 추가

-- 금나나 학생의 키를 검색하시오.
select stu_height
from student
where stu_name='금나나';
commit;
select *from student;

update student
set stu_no='20111234'
where stu_no='20151111'; --업데이트 안돼?

select *from student;
update student
set stu_name='이지성'
where stu_name='김지성';
-- 상대편 commit 전의 상태를 바꾸는 것임을 주의. 
rollback;











