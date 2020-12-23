select *from social
where domn_nm='가';

--데이타 검증 domn_nm이 물환경, 생활환경, 자연환경이 아닌 데이터가 있는지 확인 후,
-- 잘못된 것이 몇개인지 확인하시오.
select*from social
where domn_nm !='물환경'
  and DOMN_NM !='생활환경'
  and domn_nm !='자연환경';
-- 또는
select*from social
where DOMN_NM not in('물환경','생활환경','자연환경');


select distinct domn_nm,ctgry_nm
from social
order by 1,2;
-- ctgry_nm의 15종류외의 것에 대한 개수를 확인하시오.
select *
from social
where  CTGRY_NM not in('물재난','상수도','지하수', '하수도','하천','호소','대기',
'폐기물','화학물질','기상변화','기후변화','생태계','지질','지형','토양');
-- 원래 있던 15가지 외의 것은 다시 말해 내가 추가한것 1가지 이므로,

select count(*)
from social
--where domn_nm in ('물환경','생활환경','자연환경') -- 33837
where domn_nm not in ('물환경','생활환경','자연환경'); -- 1

select count(distinct id)
from social;     -- 33837

select count(*)-(count(distinct id))
from social;     -- 1

select max(id)- count(distinct id)
from social;   --0

select max(id)- count(*)
from social; -- '-1' 내가 넣은 행이 하나이니깐 중복된 값이 1개

select *
from social;
-- 속성의 종류 확인 후 개수 확인
select DISTINCT atrb_nm
from social;   -- 속성의 종료 확인
select count(DISTINCT atrb_nm)
from social;   -- 속성의 종료 개수

-- 물재난(카테고리)의 인물(속성)중 연관어가 높은 순서대로 검색
select RELATED_WRD_NM, sum(dily_buzz_co) -- dily_buzz_co는 문제에서 묻지도 않았는데?
from social                  -- 이유는 '연관어가 높은 순서'라는 말에 이미 count가 함축
where ctgry_nm='물재난' and atrb_nm='인물' and chnnl_nm='All'
-- and chnnl_nm='All' 가 붙은 이유는 All속에 이미 두 SNS가 포함되어 있으므로
group by RELATED_WRD_NM
order by sum(dily_buzz_co) desc;

--(환경에 관한 이슈중) 1월1일에 언급된 상품들을 알고 싶다.
select related_wrd_nm, sum(DILY_BUZZ_CO) -- sum(DILY_BUZZ_CO)??
from social
where ATRB_NM='엔터테인먼트' and chnnl_NM='All' --??
group by related_wrd_nm
order by sum(DILY_BUZZ_CO)desc ;

select distinct RELATED_WRD_NM
from SOCIAL;

-- 블러그에서 수집된 데이터 개수와 트위터에서 수집된 데이터 개수를 알고 싶다
-- 1. 채널이 블로그인 튜플의 개수 확인
-- 2. 채널이 트위터인 튜플의 개수 확인
-- 3, 수동 비교 후 알려줌.

select distinct chnnl_nm
from social;

select count(*)       -- 1
from social
where chnnl_nm='blog';

select count(*)         --2
from social
where chnnl_nm='twitter';



--  SQL 학습2 시작 -데이타 입력
--subject(과목)테이블 생성
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