select *from emp;
select*from dept;
1.���(emp) ���̺�� �μ�(dept) ���̺��� natual join �϶�.
select*
from emp natural join dept;

2.�����ȣ, ����̸�, �μ��̸��� �˻��϶�(equi join)
select empno,ename,dname
from emp,dept
where emp.deptno=dept.deptno;

3.�����ȣ, ����̸�, �μ��̸��� �˻��϶�.(natural join)
select empno,ename,dname
from emp natural join dept;

4.�����ȣ, ����̸�, �μ��̸��� �˻��϶�.(join ~ using)
select empno,ename,dname
from emp join dept using(deptno);

5.�����ȣ, ����̸�, �μ��̸��� �˻��϶�(join ~ on)
select empno,ename,dname
from emp join dept on emp.deptno=dept.deptno;

6.������ NEW YORK�� ����̸��� �˻��϶�(equi join)
select ename,loc
from emp,dept
WHERE EMP.DEPTNO=DEPT.DEPTNO AND LOC='NEW YORK';

7.������ NEW YORK�� ����̸��� �˻��϶�(natural join)
select ename,loc
from emp natural join dept
where loc='NEW YORK';

8.������ NEW YORK�� ����̸��� �˻��϶�(join ~ using)
select ename,loc
from emp join dept using(deptno)
where loc='NEW YORK';

9.������ NEW YORK�� ����̸��� �˻��϶�(join ~ on)
select ename,loc
from emp join dept on emp.deptno=dept.deptno
where loc='NEW YORK';

10.������ NEW YORK�� ����� �����ȣ, ����̸��� �����ȣ ������ �˻��϶�.


11.ALLEN ����� �ٹ� ���� �μ��̸��� ������ �˻��϶�(equi join)

12.ALLEN ����� �ٹ� ���� �μ��̸��� ������ �˻��϶�(join ~ using)

13. ALLEN ����� �ٹ� ���� �μ��̸��� ������ �˻��϶�(join ~ on)

14. ALLEN ����� �ٹ� ���� �μ��̸��� ������ �˻��϶�(natural join)

15.�޿��� 2000 �̻��� ������� ������ ������ �˻��϶�.

16.�޿��� 1000 �̻� 2000 ������ ������� �����ȣ, ����̸�, �μ��̸��� �����ȣ������ �˻��϶�.

17.��������� SALESMAN�̸鼭 CHICAGO ������ �ٹ����� ������� �˻��϶�.

18.NEW YORK �̳� DALLAS ������ �ٹ��ϴ� ������� �����ȣ�� ����̸��� �����ȣ ������ �˻��϶�(equi join).

19.�μ��̸��� ACCOUNTING�̰ų�, ������ CHICAGO�̴� ����� �����ȣ�� ����̸��� �˻��϶�.

 20.NEW YORK�̳� DALLAS ������ �ٹ��ϴ� ������� �����ȣ�� ����̸��� �����ȣ ������ �˻��϶�(natural join)
 
21.�μ��̸��� ACCOUNTING�̰ų�, ������ CHICAGO�� ����� �����ȣ�� ����̸��� �˻��϶�(join~using).

22.�����ȣ, ����̸�, �޿�, �޿������ �޿���޺� �����ȣ ������ �˻��϶�.

23.�����ȣ, ����̸�, ����ڻ����ȣ, ������̸��� �˻��϶�(equi join)

24.�����ȣ, ����̸�, ����ڻ����ȣ, ������̸��� �˻��϶�(join ~~ on)

25. BLAKE ������� ���� �޿��� �޴� ����̸��� �˻��϶�(������)

26. BLAKE ������� ���� �޿��� �޴� ����̸��� �˻��϶�(self join)

27. FORD ����� ���� �μ��� �ٹ��ϴ� ����̸��� �˻��϶�.

28. FORD ����� ���� �޿��� �޴� ����� �����ȣ�� �˻��϶�.

29. �μ��� �ο����� �μ��̸��� �Բ� ����� ���� �μ� ������ �˻��϶�.

30. �����ȣ, ����̸��� ���� ������������ ���� ������ �˻��϶�.

31. �μ��̸��� ��SALES���̸鼭 ��������� ��MANAGER���� ����� �����ȣ, ����̸��� ����̸� ������ �˻��϶�.

32. FORD ������� ���� �޿��� �޴� ��� ������ �˻��϶�.

33. ALLEN ������� ���� �޿��� �޴� ��� ������ �˻��϶�.

34. 20�� �μ� ����� ��������� ���� ��������� �ٸ� �μ��� ��� ������ �˻��϶�.

35. ��ü ����� ��� �޿����� �޿��� ���� ��� ������ �˻��϶�.

36. �޿��� ��� �μ����� ��� �޿����� ���� ��� ������ �˻��϶�.

37. 20�� �μ��� �ִ� �޿����� �ִ� �޿��� ū �μ��� ��ȣ�� �ִ� �޿��� �˻��϶�.

38. CHICAGO ������ ��ġ�ϴ� �μ��� �ٹ��ϴ� ��� ������ �˻��϶�. ��, �� ���Ǹ� �̿��Ѵ�.


