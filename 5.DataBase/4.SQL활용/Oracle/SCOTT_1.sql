select *from emp;
select*from dept;
1.사원(emp) 테이블과 부서(dept) 테이블을 natual join 하라.
select*
from emp natural join dept;

2.사원번호, 사원이름, 부서이름을 검색하라(equi join)
select empno,ename,dname
from emp,dept
where emp.deptno=dept.deptno;

3.사원번호, 사원이름, 부서이름을 검색하라.(natural join)
select empno,ename,dname
from emp natural join dept;

4.사원번호, 사원이름, 부서이름을 검색하라.(join ~ using)
select empno,ename,dname
from emp join dept using(deptno);

5.사원번호, 사원이름, 부서이름을 검색하라(join ~ on)
select empno,ename,dname
from emp join dept on emp.deptno=dept.deptno;

6.지역이 NEW YORK인 사원이름을 검색하라(equi join)
select ename,loc
from emp,dept
WHERE EMP.DEPTNO=DEPT.DEPTNO AND LOC='NEW YORK';

7.지역이 NEW YORK인 사원이름을 검색하라(natural join)
select ename,loc
from emp natural join dept
where loc='NEW YORK';

8.지역이 NEW YORK인 사원이름을 검색하라(join ~ using)
select ename,loc
from emp join dept using(deptno)
where loc='NEW YORK';

9.지역이 NEW YORK인 사원이름을 검색하라(join ~ on)
select ename,loc
from emp join dept on emp.deptno=dept.deptno
where loc='NEW YORK';

10.지역이 NEW YORK인 사원의 사원번호, 사원이름을 사원번호 순으로 검색하라.


11.ALLEN 사원이 근무 중인 부서이름과 지역을 검색하라(equi join)

12.ALLEN 사원이 근무 중인 부서이름과 지역을 검색하라(join ~ using)

13. ALLEN 사원이 근무 중인 부서이름과 지역을 검색하라(join ~ on)

14. ALLEN 사원이 근무 중인 부서이름과 지역을 검색하라(natural join)

15.급여가 2000 이상인 사원들의 사원명과 지역을 검색하라.

16.급여가 1000 이상 2000 이하인 사원들의 사원번호, 사원이름, 부서이름을 사원번호순으로 검색하라.

17.사원직무가 SALESMAN이면서 CHICAGO 지역에 근무중인 사원명을 검색하라.

18.NEW YORK 이나 DALLAS 지역에 근무하는 사원들의 사원번호와 사원이름을 사원번호 순으로 검색하라(equi join).

19.부서이름이 ACCOUNTING이거나, 지역이 CHICAGO이니 사원의 사원번호와 사원이름을 검색하라.

 20.NEW YORK이나 DALLAS 지역에 근무하는 사원들의 사원번호와 사원이름을 사원번호 순으로 검색하라(natural join)
 
21.부서이름이 ACCOUNTING이거나, 지역이 CHICAGO인 사원의 사원번호와 사원이름을 검색하라(join~using).

22.사원번호, 사원이름, 급여, 급여등급을 급여등급별 사원번호 순으로 검색하라.

23.사원번호, 사원이름, 상급자사원번호, 상급자이름을 검색하라(equi join)

24.사원번호, 사원이름, 상급자사원번호, 상급자이름을 검색하라(join ~~ on)

25. BLAKE 사원보다 많은 급여를 받는 사원이름을 검색하라(부질의)

26. BLAKE 사원보다 많은 급여를 받는 사원이름을 검색하라(self join)

27. FORD 사원과 같은 부서에 근무하는 사원이름을 검색하라.

28. FORD 사원과 같은 급여를 받는 사원의 사원번호를 검색하라.

29. 부서별 인원수를 부서이름과 함께 사원이 많은 부서 순으로 검색하라.

30. 사원번호, 사원이름을 직속 부하직원수가 많은 순으로 검색하라.

31. 부서이름이 ‘SALES’이면서 사원직무가 ‘MANAGER’인 사원의 사원번호, 사원이름을 사원이름 순으로 검색하라.

32. FORD 사원보다 많은 급여를 받는 사원 정보를 검색하라.

33. ALLEN 사원보다 적은 급여를 받는 사원 정보를 검색하라.

34. 20번 부서 사원의 사원직무와 같은 사원직무인 다른 부서의 사원 정보를 검색하라.

35. 전체 사원의 평균 급여보다 급여가 많은 사원 정보를 검색하라.

36. 급여가 모든 부서들의 평균 급여보다 많은 사원 정보를 검색하라.

37. 20번 부서의 최대 급여보다 최대 급여가 큰 부서의 번호와 최대 급여를 검색하라.

38. CHICAGO 지역에 위치하는 부서에 근무하는 사원 정보를 검색하라. 단, 부 질의를 이용한다.


