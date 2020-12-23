create table student(
  stu_no char(9),
  stu_name varchar2(12),
  stu_dept varchar2(20),
  stu_grade number(1),
  stu_class char(1),
  stu_gender char(1),
  stu_height number(5,2), --정수 3자리 소수 2자리
  stu_weight number(5,2),
  constraint p_stu_no primary key(stu_no));

desc student;
insert into student values(20153075, '옥한빛', '기계', 1, 'C', 'M',177,80);
insert into student values(20153088, '이태연', '기계', '1', 'C', 'F',162,50);
insert into student values(20143054, '유가인', '기계', '2', 'C', 'F',154,47);
insert into student values(20152088, '조민우', '전기전자', '1', 'C', 'M',188,90);
insert into student values(20142021, '심수정', '전기전자', '1', 'A', 'F',168,45);
insert into student values(20132003, '박희철', '전기전자', '3', 'B', 'M',null,63);
insert into student values(20151062, '김인중', '컴퓨터정보', '1', 'B', 'M',166,67);
insert into student values(20141007, '진현무', '컴퓨터정보', '2', 'A', 'M',174,64);
insert into student values(20131001, '김종헌', '컴퓨터정보', '3', 'C', 'M',null,72);
insert into student values(20131025, '옥성우', '컴퓨터정보', '3', 'A', 'F',172,63);
SELECT * FROM STUDENT;
SELECT stu_name from STUDENT;
SELECT stu_no, stu_name,stu_dept from student;
SELECT stu_name,stu_height, STU_WEIGHT from student;
SELECT * FROM STUDENT;
-- 중복 제거 방법
SELECT distinct stu_dept from STUDENT;
SELECT distinct stu_dept, stu_class from student;
SELECT distinct stu_gender from STUDENT;
SELECT STU_HEIGHT/100 as "미터" from STUDENT; -- as ,  "" 생략 가능.
-- 이름 ,학번,키를 출력, 출력시 필드명을 한글로 변경
SELECT stu_name as "이름", stu_no as "학번", STU_HEIGHT as "키"from student;
SELECT stu_name 이름, stu_no 학번, STU_HEIGHT 키 from student;  --생략했을 때
SELECT stu_dept || stu_name "학과,성명" FROM STUDENT; -- 쓸 땐 ""꼭 쓸것.
SELECT '이름은' || stu_dept|| '입니다' "학생들이름은 "  FROM STUDENT;
-- 학생들의 명단을 출력하시오(단, 출력결과는 다음과 같은 형태로 출력되어야 합니다.
-- EX> 기계학과에 재학중인 c반 옥한빛입니다.
SELECT stu_dept || '학과에 재학중인 ' || stu_class||'반 ' || stu_name || '입니다'from student;
SELECT * FROM STUDENT
where stu_dept='컴퓨터정보';
SELECT * FROM STUDENT
where (STU_GRADE >=2 or STU_GENDER='m')and STU_WEIGHT>70;
-- 문제> c반 학생중 키가 170이상인 학생이름을 출력
SELECT STU_NAME FROM STUDENT
where STU_CLASS='C' and STU_HEIGHT>170;
select*
from student;

SELECT STU_DEPT from student
where not (stu_dept='기계');

-- 몸무게가 60~70사이
SELECT * FROM STUDENT
WHERE STU_WEIGHT >=60 AND STU_WEIGHT>=70;
-- 또 다른 방법
SELECT * FROM STUDENT
WHERE STU_WEIGHT BETWEEN 60 AND 70;
DESC STUDENT;

SELECT * FROM STUDENT
WHERE STU_NO BETWEEN 20141001 AND 20141999;
-- '' 를 안붙일 경우 숫자로 보고
SELECT * FROM STUDENT
WHERE STU_NO BETWEEN '2014001' AND '2014999';
-- '' 를 붙일 경우 문자로 보아 서로 다른 값이 나온다.
select*from STUDENT
where STU_NAME like '김%'; -- like의 쓰임은 김이 있는 모든것.

-- 이름에 수가 하나 들어가는 학생
SELECT * FROM student
where STU_NAME like '_수%';

-- 가운데에 '수'가 들어가는 학생
SELECT * FROM student
where STU_NAME like '_%수%_';

-- 키가 170이상이고 2015년도 입학한 핵생의 이름과 성별을 출력.
SELECT STU_NAME,STU_GENDER FROM STUDENT --select에서 ,는and의미.
where (STU_HEIGHT>=170 and STU_no>'20150001');

-- 3학년 이면서 B반이 아니고 여학생의 키가 160이상인 성이 옥인 학생의 정보를 출력
SELECT * FROM STUDENT
WHERE STU_GRADE='3'
AND STU_CLASS !='B' -- 문자지만 대소문자 구분 안함.
AND STU_GENDER='F' 
AND STU_HEIGHT>=160
AND STU_NAME LIKE '옥%';

SELECt * from STUDENT
where STU_HEIGHT =null; -- null의 문자를 찾는다는 것임으로 안됨

SELECt * from STUDENT
where STU_HEIGHT is null;  -- 그러므로 반드시 is룰 사용

SELECt * from STUDENT
where STU_HEIGHT is not null;  -- != 인 경우

SELECt * from STUDENT
where STU_DEPT in ('컴퓨터정보', '기계');  -- 이때는 %을 못씀

SELECt * 
from STUDENT
where STU_GENDER='M'
order by STU_NO;   -- 오름차순 정렬

SELECt * 
from STUDENT
where STU_GENDER='M'
order by STU_NO DESC; -- 내림차순 정렬

SELECt * 
from STUDENT
order by STU_CLASS;

SELECt * 
from STUDENT
order by STU_CLASS, STU_GRADE;

SELECt * 
from STUDENT
order by STU_CLASS DESC, STU_GRADE; -- 앞은 내림차순, 뒤는 오름차순

-- 학번이 2015로 시작하는 학생의 이름을 오름차순으로 정렬해서 출력하시오.
SELECt STU_NAME -- 이름만 나오게
from STUDENT
WHERE STU_NO LIKE '2015%'
ORDER BY STU_NAME;

-- 학생 정보중 학번, 이름, 학과, 몸무게 를 출력

SELECt STU_NO, STU_NAME, STU_DEPT, STU_WEIGHT as "몸무게"
from STUDENT                -- 별칭지정도 됨.
ORDER BY 4; -- SELECT중에 4번째를 지정하여 정렬.

SELECt STU_NO, STU_NAME, STU_DEPT, STU_WEIGHT-5 as "몸무게"
from STUDENT                -- 별칭지정도 됨.
ORDER BY STU_HEIGHT; -- 정렬만 되고 출력은 안됨

--기계과인 남학생과 전기전자과인 여학생의 명단을 학번이 낮은(후배) 순서대로 출력하시오.
SELECt *
from STUDENT
where (STU_DEPT= '기계' and STU_GENDER='M')OR
(STU_DEPT='전기전자'AND STU_GENDER='F')
order by stu_NO DESC;

SELECT ROUND(345.678,0) FROM DUAL; -- 346
SELECT ROUND(345.678,1) FROM DUAL; -- 345.7
SELECT ROUND(345.678,2) FROM DUAL; -- 345.68

SELECT ROUND(STU_HEIGHT, -1) FROM STUDENT;
SELECT TRUNC(123.456, 2) FROM DUAL; -- 뒤의 인수값에서 날림
SELECT MOD(123.456, 2) FROM DUAL;  -- 나머지값
SELECT ABS(-123.45) FROM DUAL;     -- 절대값
SELECT FLOOR(123.457) FROM DUAL;  -- 소수점 이하 버림
SELECT TRUNC(123.45, 0) FROM DUAL;  --같은 결론

SELECT STU_HEIGHT/30.48 FROM STUDENT;
-- 소수점 첫째자리까지만 나오도록 (즉 소수점 둘째짜리 반올림)
SELECT ROUND(STU_HEIGHT/30.48, 1) FROM STUDENT;

SELECT LOWER('KOREA')FROM DUAL;
SELECT UPPER('KOREA')FROM DUAL;
SELECT INITCAP('ENAME')FROM DUAL;
SELECT CONCAT('ENAME','JOB')FROM DUAL;
SELECT 'ENAME'||'JOB' FROM DUAL;
SELECT SUBSTR('ENAME'2,3)FROM DUAL;
SELECT LENGTH('ENAME')FROM DUAL;
SELECT LENGTH('세글자')FROM DUAL;

SELECT INSTR('AAENAAAAMEAA','A','3','2') FROM DUAL;

SELECT LPAD('ENAME', '10','-') FROM DUAL;
SELECT RPAD('ENAME', '10','-') FROM DUAL;

SELECT SYSDATE+10 FROM DUAL;  -- 20/10/6 +10일후 
SELECT SYSDATE+60/(1/24) FROM DUAL;
--연산을 함 (1시간은 1/24, 1분은 60/(1/24) )
SELECT MONTHS_BETWEEN
       (TO_DATE('02-02-1995','MM-DD-YYYY'),
        TO_DATE('01-01-1995','MM-DD-YYYY') ) "Months" FROM DUAL;
SELECT MONTHS_BETWEEN
    (SYSDATE+31,SYSDATE) FROM DUAL; --EX> 퇴사일, 입사일
     -- 31일전부터 오늘까지   
     
--EMP테이블이 존재하는 INDATE필드가 있을 경우     
SELECT MONTHS_BETWEEN
    (SYSDATE,INDATE) FROM DUAL;
     
SELECT NEXT_DAY(SYSDATE,'월') FROM DUAL; -- 20/10/12

SELECT LAST_DAY(SYSDATE) FROM DUAL;     -- 20/10/31

SELECT ROUND(SYSDATE, 'MON') FROM DUAL; -- 20/10/01

SELCET TO_CHAR(SYSDATE,'yyyy-mm-DD')FROM DUAL;

SELECT TO_CHAR(123) FROM DUAL; --문자로 전화하여 출력.
SELECT TO_NUMBER('123')FROM DUAL; -- 숫자로 출력.

SELECT TO_CHAR(('122.34455'), '999.99') FROM DUAL;
-- #######나오는 이유는(A,B)중 A와B의 소수점 자리수 가 다르면
SELECT TO_CHAR(TO_NUMBER('122.34455'), '999.99') FROM DUAL;

SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD/HH/SS')FROM DUAL; -- 2020/10/06/12/07

SELECT NVL(STU_WEIGHT, 0) FROM STUDENT;  -- NULL값 변환.
SELECT NVL2(STU_WEIGHT, 0,1) FROM STUDENT;
-- STU_WEIGHT값이 NULL이 아니면 0 NULL이면 1출력.

SELECT NULLIF('A','A') FROM DUAL; 
SELECT NULLIF('B','A') FROM DUAL; 
-- 두값을 비교후 같으면 NULL , 아니면 앞의 값 출력.
SELECT NVL(NULLIF('A','A'),'널값') FROM DUAL; --널값
SELECT NVL(NULLIF('B','A'),'널값') FROM DUAL; -- B

SELECT COALESCE(2,NULL, 10,100,NULL) FROM DUAL;
-- 첫번째 값이 NULL값이 아니면 첫번째 값을
SELECT COALESCE(NULL,NULL, 10,100,NULL) FROM DUAL;
-- 첫번째 값이 NULL값이며, 그 다음 나오는 NULL이 아닌 값으로 출력

select stu_name , 
   case when stu_grade=1 then stu_weight*10
        when stu_grade=2 then stu_weight*100
        else stu_weight 
   end as "별칭으로" 
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

--성별이 남학생이거나 학년이 1학년인 학생중 키가 170이상인 학생이름만 출력하시오.
--학생이름만 출력(성 출력 금지)  
SELECT SUBSTR(STU_NAME,2,2)
FROM STUDENT
WHERE (STU_GENDER='M' OR STU_GRADE='1')
AND STU_HEIGHT>=170;

-- 학생 테이블에서 기계과 또는 컴퓨터 정보과 학생이면서 여학생인 학생들의 키만 알아냅시다'
--단, 출력시 키가 큰 순서대로 정렬.
SELECT STU_HEIGHT -- 마지막 요구사항을 이곳에 써줄 수 있슴
FROM STUDENT
WHERE (STU_DEPT='기계' OR STU_DEPT='컴퓨터정보')AND STU_GENDER='F'
ORDER BY STU_HEIGHT;

SELECT AVG(STU_WEIGHT)
FROM STUDENT
WHERE STU_GENDER='F';

SELECT ROUND(AVG(STU_WEIGHT),1)-- 1번째 자리서 반올림
FROM STUDENT
WHERE STU_GENDER='M';

-- COUNT( ) : 조건을 만족하는 열의 데이터 값들의 개수를 반환
SELECT COUNT(*), COUNT(STU_NO),COUNT(STU_HEIGHT)
FROM STUDENT;

SELECT COUNT(*), COUNT(STU_NO),COUNT(STU_HEIGHT)
FROM STUDENT;

SELECT *FROM STUDENT;
-- ex1> 전체 학생중 최고 신장과 최저 신장 반환
SELECT MAX(STU_HEIGHT),MIN(STU_HEIGHT)
FROM STUDENT;    -- 188     154

--ex2> 기계과 학생중 최고 신장과 최저 신장 반환
SELECT MAX(STU_HEIGHT),MIN(STU_HEIGHT)
FROM STUDENT
WHERE STU_DEPT='기계';   --177     154

-- ex3>전체 학생수와 신장값을 가진 학생수 반환
SELECT COUNT(*),COUNT(STU_HEIGHT)
FROM STUDENT;   -- 10    8

-- ex4> 전체 학생이 속하는 학과의 수를 중복없이 반환
SELECT COUNT(DISTINCT STU_DEPT)  
-- DISTINCT는 조회하려는 칼럼의 중복되는 값은 제거 후 보여준다.
FROM STUDENT;   -- 3

-- 각 학생의 몸무게를 이름과 함께 검색 후 
-- 남학생의 이름과 표준체중을 출력 (표준체중= (키-100)*0.9)
-- 그리고 비만도도 추가하여 출력 (비만도 =본인체중/ 표준체중)
select STU_NAME,(STU_HEIGHT-100)*0.9,
    STU_WEIGHT/((STU_HEIGHT-100)*0.9)
FROM STUDENT
WHERE STU_GENDER='M';

-- 남학생중 비만도가 0.9이상인 학생의 학번과 이름을 검색하시오.
SELECT STU_NO , STU_NAME
FROM STUDENT
WHERE STU_GENDER='M' AND STU_WEIGHT/((STU_HEIGHT-100)*0.9)>=1;

-- 남학생중 비만도가 1이상인 학생들의 비만도 평균을 구하시오.
SELECT AVG(STU_WEIGHT/((STU_HEIGHT-100)*0.9))
FROM STUDENT
WHERE STU_GENDER='M' AND STU_WEIGHT/((STU_HEIGHT-100)*0.9)>=1;

-- 여학생들의 몸무게 평균, 표쥰푠차, 분산값을 구하시오.
-- 소수점 2째자리에서 반올림해서 출력하시오.
SELECT AVG(STU_WEIGHT),
ROUND(STDDEV(STU_WEIGHT),2), 
ROUND(VARIANCE(STU_WEIGHT),2)
FROM STUDENT
WHERE STU_GENDER='F';

-- 그룹별로 묶기
SELECT STU_DEPT , AVG(STU_WEIGHT)
FROM STUDENT
GROUP BY STU_DEPT;

-- 체중이 50KG이상 학생들의 학과별 인원수 구하기
SELECT STU_DEPT, COUNT(*)
FROM STUDENT
WHERE STU_WEIGHT>=50
GROUP BY STU_DEPT;

-- 학년별 평균키
SELECT STU_GRADE , AVG(STU_HEIGHT)
FROM STUDENT
GROUP BY STU_GRADE;

--학과별로 그륩화 후 다시 학년별로 그룹화를 시킨 후 학생수 구하기
SELECT STU_DEPT, STU_GRADE, COUNT(*)
FROM STUDENT
GROUP BY STU_DEPT , STU_GRADE  -- 다중열 GROUP BY 절: AND는 ','로 표시
ORDER BY STU_DEPT;

-- 기계과 학생들 중 학년별 평균 신장이 160이상인 학년과 평균 신장
SELECT STU_GRADE, AVG(STU_HEIGHT)
FROM STUDENT
WHERE STU_DEPT='기계'
GROUP BY STU_GRADE HAVING AVG(STU_HEIGHT)>=160;

-- 최대신장이 175인 학과와 학과별 최대 신장
SELECT STU_DEPT, MAX(STU_HEIGHT)
FROM STUDENT
GROUP BY STU_DEPT HAVING MAX(STU_HEIGHT)>=175;
-- HAVING : 주어진 결과에 재조건시

-- 학과별 평균신장 중 가장 높은 평균 신장
SELECT MAX(AVG(STU_HEIGHT))
FROM STUDENT
GROUP BY STU_DEPT;

SELECT STU_DEPT , AVG(STU_HEIGHT)
FROM STUDENT
GROUP BY STU_DEPT
ORDER BY AVG(STU_HEIGHT) DESC;

-- 남녀별 평균 키
SELECT STU_GENDER , AVG(STU_HEIGHT)
FROM STUDENT
GROUP BY STU_GENDER;

-- 학과별 평균 신장 중 가장 높은 평균 신장과 학과
-- 서브쿼리가 필요 - 현재수준으로 쿼리 작성 불가
SELECT MAX(AVG(STU_HEIGHT))
FROM STUDENT
GROUP BY STU_DEPT;

-- 학년별 평균키와 평균 몸무게
SELECT AVG(STU_HEIGHT),AVG(STU_WEIGHT)
FROM STUDENT
GROUP BY STU_grade;






\







