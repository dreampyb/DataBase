-- <SubQuery -From 절의 부질의>
select *from student;
--옥성우 학새으이 신장보다 큰 학생의 학번, 이름,신장 검색.
--1. 옥성우 학생의 신장
--2. 그 신장보다 큰 학생의 학버느 이름, 신장, 검색.
select STU_HEIGHT 
from student 
where stu_name='옥성우';
select *from student where STU_HEIGHT>'172';

select *
from student 
where STU_HEIGHT > (select STU_HEIGHT from student where stu_name='옥성우');
-- 이는 아래것과 같은 경우다.
select b.*
from student a, student b
where (a.stu_height<b.stu_height) and a.stu_name='옥성우';

ex1> 박희철 학생과 같은 체중을 가지고 있는 학생의 정보
--1.박희철 학생의 체중을 구한다.
select stu_weight from student where stu_name='박희철';
--2. 체중이 63인 학생을 검색
select *from student where stu_weight='63';
--3. 합쳐라
select *from student
where stu_weight=(select stu_weight from student where stu_name='박희철');

ex2> 위의 문제에서 박희철이 포함되서 나오는데 박희철이 포함되지 않게 출력할려면?
select *from student
where stu_weight=(select stu_weight from student where stu_name='박희철')
and stu_name!='박희철';

ex3> 컴퓨터정보 학과와 같은 반인 다른 학과의 학생정보를 in을 이용하여 검색
--1.컴퓨터정보학과의 반 검색
select stu_class 
from student
where stu_dept='컴퓨터정보';
--2. B,A,C,A에 해당하는 다른 학과의 학생정보 출력.
SELECT *from student 
where stu_class in('B','A','C','A')and stu_dept!='컴퓨터정보';
--3.합쳐라
select *from student
where stu_class in (select distinct stu_class from student where stu_dept='컴퓨터정보')
-- distinct는 'B','A','C','의 중복제거를 위해.
and stu_dept <> '컴퓨터정보';

ex4> 신장이 전체 학생들의 편균 신장보다 큰 학생을 검색
--1.전체 학생들의 평균신장
select avg(stu_height) from student;
--2. 그값보다 큰 학생 검색
select * from student where stu_height>'170.125';
--3. 합치기
select *from student
where stu_height>(select avg(stu_height) from student);

--신장이 모든 학과들의 평균 신장보다 큰 학생의 정보
--1,학과별 평균 신장
select round( avg(stu_height),1) from student group by stu_dept;
--2.그 평균신장들보다 큰 학생의 정보
select * from student where stu_height> all(164.34,178,170.7);--조민우 188
-- or 
select max (avg(stu_height))from student group by stu_dept; --178
select*from student where stu_height>178;               --조민우 188

-- ex7> 컴퓨터정보과 최소 신장과 비교하여 최소 신장이 더 큰 학과의 학과명과 최소신장을 구하기
--1. 먼저 비교할 컴퓨터정보학과의 최소신장 검색.
select min(stu_height) from student where stu_dept='컴퓨터정보';
--2. 학과명, 최소신장 
select STU_DEPT, min(STU_HEIGHT)from student 
group by stu_dept having min(stu_height)>166; 
-- having : 그룹함수 적용 결과에 다시 조건을 부여할때

-- ex8> 101번 과목을 수강한 학생들의 정보를 구하는 부질의 문장
select *from student;
select *from enrol;
-- 1. enrol테이블에서 101번을 수강한 학생들의 학번을 검색.
select stu_NO FROM enrol where Sub_NO='101';
--2.1번에 나온 학번에 해당하는 학생정보 검색
select *from student
where stu_no in ('20131001','20131025');
--3. 최종적으로 학번중에 과목101을 검색
select *from student 
where stu_no in (select stu_NO FROM enrol where Sub_NO='101');
-- 20131001 	김종헌	컴퓨터정보	3	C	M		72
-- 20131025 	옥성우	컴퓨터정보	3	A	F	172	63

--* join으로 표현하면
select student.*
from student join enrol on(student.stu_no=enrol.stu_no)
where sub_no='101';
-- 20131001 	김종헌	컴퓨터정보	3	C	M		72
-- 20131025 	옥성우	컴퓨터정보	3	A	F	172	63

-- ex9> 101번 과목을 수강한 학생들의 학번, 이름, 점수를 검색
select *from student;
select *from enrol;
select *from student,enrol;

select *from enrol where sub_no='101';
select *from student where stu_no in ('20131001','20131025');
select student.stu_no, stu_name, enr_grade 
-- stu_no는 양쪽다 있으므로 지정, 나머지는 고유하므로 지정 필요없음.
from student join enrol on (student.stu_no=enrol.stu_no)
where sub_no=101;

select *from student;

-- 학과별로 학과별 평균 신장보다 
-- 큰 학생정보 검색
select stu_dept, round(avg(stu_height),2) from student
group by stu_dept;

select*
from student, (select stu_dept, round(avg(stu_height),2)av 
            from student group by stu_dept)u 
where student.stu_dept = u.stu_dept and stu_height > u.av;
-- av는 avg(stu_height)을 대신하는 별칭,""생략
-- u는 select stu_dept, round(avg(stu_height),2) from student group by stu_dept;
-- 절 전체의 별칭,""생략.

-- 인라인 뷰 사용시 테이블 이름이 없음으로 별칭을 붙여서 사용
-- 다시말해, 원문을 그대로 쓰면 오류!!, 반드시 별칭을 만들어 대입해야 함!!!
















