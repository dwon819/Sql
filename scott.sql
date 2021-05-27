--select (�÷��̸�)  from (���̺��̸�) + Ŀ�ǵ�(where, order by/...)



select *
from emp
where sal >= 3000;  -- <,>,<=,>=,=,!=,<>

select * 
from emp
where deptno=10;

select *
from emp
where ename = 'FORD';--�񱳽� ���ڴ� ��ҹ��� ����

--scott ��� , �̸� , �޿�
select empno,ename,sal
from emp
where ename='SMITH';

select *
from emp
where hiredate <= '1981/11/17'; --�Ի� ��¥�� ���ϴ� ����

--�������� and,or,not
select *
from emp
where deptno = 10 or job = 'MANAGER';

select *
from emp
where not deptno =10;

select *
from emp
where deptno != 10;

select *
from emp
where sal >= 2000 and sal <= 3000;

select *
from emp
where sal < 2000 or sal > 3000;

--select *
--from emp
--where empno = 7499 or empno = 7566 or empno 7844; 

--select *
--from emp
--where sal BETWEEN 2000 and 3000; --2000 �̻� 3000����

select *
from emp
where hiredate BETWEEN '81/02/01' and '81/06/30';

--where empno = 7749 or empno 7566 or empno = 7844;
select *
from emp
where empno in(7749,7566,7844);

--���̵�ī�� (LIKE% , _)
select *
from emp
where ename like = 'F%';  --F�� ���������� �ڿ� � ���ĺ��̵� ���X

select *
from emp
where ename like '%A'; -- �̸��� �������� A�� ������ ���

select *
from emp
where ename like '_A_'; -- ����ٴ� ���� �ϳ��� ǥ��

select *
from emp
where ename like '_A%'; -- �̸��� ���� �ϳ�+ A ���ĺ�+

select *
form emp
where enmae no like '_A%'; 

--null ������ Ư¡ : null�� ������ �� ����, is ���!
select *
from emp
where comm is null;

select *
from emp
where comm is not null;


--����: �� ����� �����ϱ��? ����� �Ŵ����� ���� ��� ��ȸ
select *
from emp
where mgr is null;  


-- ���� order by + �÷�, (�������� asc , �������� desc) / 
--���������� ��������
select *
from emp
order by sal asc; 

select *
from emp
order by sal desc;

select *
from emp
order by sal;

select *
from emp
order by ename desc; --���� ���� a~w

select *
from emp
order by hiredate; -- ��¥ ���� ����~ ����

select *
from emp
order by sal desc; -- martin �� ward�߿� ������ �� ���� ����? �κ� ���� ����

select *
from emp
where deptno = 30
order by sal desc,ename desc; -- ���� �����Ϳ��� ���� ��, �� ������ �׷쿡�� �ٽ� ������
(��ü���� �ƴ�)


----------------------------------------------------------------------

--order by ���� �׻� ������ ������!! �������� ��������!!
-- select , form, where, order by ������


--�̸� ������� ����� ����� �� �ִ� �Լ��� ����
-- �Լ�(����, 
-- ���� �Լ�

--���ڸ� ���ڷ�
select TO_NUMBER('100.00')*2 from dual;


select -10,abs(-10) -- abs : ���밪���� ������ִ� �Լ�
from dual;


 --(  ,2) : �Ҽ��� ���� �ι�° �ڸ����� ǥ���ϰ� ����° �ڸ�����
�ݿø�
select round (34.5678,2)
from dual;

-- Ʈ��ũ �Լ�(�Ҽ����� ����)
select trunc(34.5678)
from dual;

select trunc(34.5678,2)
from dual;


--���� ���ϴ� �Լ� : floor
select floor(27/2)
from dual;

--������ ���ϴ� �Լ� : mod
select mod(27,2)
from dual;


-- ����� ¦���� ���
select *
from emp
where mod(empno,2) = 0

-- ����� Ȧ���� ���
select *
from emp
where mod(empno,2) = 1;

--���� ���õ� ������ ���ϴ� �Լ�
-- ���ڱ��� length
select length('oracle')
from dual;

--���� �� �߶���� substr (���ڿ� ���� 1����)
select substr('Welcome to Oracle',4,3)
from dual;

-- ���ڿ� �ڿ������� �߶����
select substr('welcome to Oracle',-4,3)
from dual;

select substr(hiredate,1,2) �⵵, substr(hiredate,4,2)�� -- /�� ���� ����
from emp;

-- 9���� �Ի��� ����� ��ȸ
select *
from emp
where substr(hiredate,4,2) = 09;

--81�⵵�� �Ի��� ����� ��ȸ(�� �Ʒ� ������ ���)
where hiredate betwwen '1981/01/01' and '1981/12/31'
where substr(hiredate,1,2)

select *
from emp
where substr(hiredate,1,2) = 81;

--��ü ���ڿ��� 'o'�� ã�µ� 6��° ���ڿ����� �ι�°�� 'o' ��ġ�� ��ȯ 
select instr('welcome to oracle','o',6,2)
from dual;

--����° ���ڿ� 'R'�� ���� ��� (�ڿ� �̸��� �������)
select *
from emp
where ename like '__R%';--instr ,substr �� ����ؼ� �̸��� ����° ���ĺ��� R�� �ִ� ��� ���ϱ�
--instr(���ڹ�ȯ)
select *
from emp
where instr(ename,'R',3,1) =3;  
--������ ���ڰ��� ��ȯ���ִ� �� ����� 3�� ���ٸ� ���� ��������

--substr (���ڹ�ȯ)
select *
from emp
where substr(ename,3,1) = 'R'; 

--��¥ ���ϱ�
select sysdate
from dual; --�������̺�
select sysdate -1 ����, sysdate + 1 ����
from dual;

--�ٹ���¥ ���ϱ�(������� �� ���� ����)
select round(sysdate - hiredate)
from emp;

--�ٹ���¥ ���ϱ�(������� �� ���� ����)
select round((sysdate - hiredate) /365)
from emp;

-- months_between: �� ��¥���� ���̸� �˷��ִ� �Լ� 
select ename,hiredate,trunc(months_between(sysdate,hiredate))
from emp;



--�׷��Լ�(�հ�, -�� �������� ��� �ϳ�) / �����Լ�(����,���� ����-�� �ϳ����� ��� �ϳ� ����)
--�׷��Լ� sam,avg,count,max,min
select *
from emp;

select sum(sal)
from emp;

select avg(sal) --����(����)
from emp;

select max(sal),min(sal)
from emp;

select max(sal)
from emp;

-- �׷��Լ��� �Ϲ��÷��� ���� ��� �� �� ����!! (Ʋ�� ����)
--select ename, max(sal)
--from emp;


--count �Լ�
select count(empno)
from emp;

--comm �ȹ޴� null ���� �ڵ�����
select count(comm)
from emp;

-- ��ü ����� Ŀ�̼� �޴� ����� ���� �ϳ��� ���ڵ��!
select count(empno),count(comm)
from emp;

select count(*),count(comm)
from emp;

--�ߺ����� distinct
select count(distinct job) 
from emp;

--�� ����!!!!
--select 
--from
--(where
--group by
--oerder by)

select deptno
from emp
group by deptno;

--�μ��� ��� �޿� ���ϱ�
--group by���� ������ �׷��Լ��� �Ϲ��÷� �Բ��ᵵ ����!(���ڵ� ���� ���⶧��)
select deptno,avg(sal)
from emp
group by deptno;



----�μ��� �޿��� ������ max�� 2900�̻��� max,min�� ���
select deptno, max(sal),min(sal)
from emp 
group by deptno having max(sal) >= 2900;


--����!!
--select 
--from
--where
--group by
--having
--order by --order by�� ���� ��������

--���� (�ΰ� �̻��� ���̺��� ����ؼ� �����͸� ��ȸ�ϴ°�)

--join:�ΰ� �̻��� ���̺��� ����ؼ� �����͸� ��ȸ�ϴ� ��
select * from dept;
--
--DEPTNO, DNAME,      LOC
--10       ACCOUNTING   NEW YORK
--20       RESEARCH   DALLAS
--30       SALES       CHICAGO
--40       OPERATIONS   BOSTON
--



--�������� equal join
 
select ename, e.deptno, dept.dname 
from emp, dept
where emp.deptno = dept.deptno;
-- �ΰ��� ���̺��߿� �÷��� �ٸ��� ������ �����ص���! 
���� �÷��� ���� ���̺��� ���!


-- ���̺��� ��Ī�� �����ϱ� ??
select emp.ename, deptno, dept.dname 
from emp e, dept d
where e.deptno = d.deptno;

--Ư�� ����� ���� ��ȸ
select emp.ename, deptno, dept.dname 
from emp e, dept d
where e.deptno = d.deptno
and ename = 'ALLEN';

--ACCOUNTING�μ� �Ҽ� ����� �̸��� �Ի��� ����ϼ���.
select e.ename, e.hiredate, d.dname
from emp e, dept d
where e.deptno = d.deptno
and d.dname = 'ACCOUNTING';

select e.ename,e.hiredate
from emp e,dept d --��Ī
where e.deptno = d.deptno
and d.dname = 'ACCOUNTING';

--������ ����( cross join, equi join, no dqui join, out join, self join

--equi join��
select *
from emp;

select*
from dept;

select *
from salgrade;

--������ ���̺� ���� �����ϴ� ������ join �ؾߵ�! (join�� �ΰ��� ���̺� ��, 
-- � ���̺�� ������ ����! 
--(� ���̺�� ������? emp �� dept�� ���̱�)



-- no equi join ����
--ename ����̸�, dname�μ���, grade �������--
select ename,dname,grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno
and e.sal BETWEEN s.losal and s.hisal;


--����� �Ŵ����� �������� ���ϱ�
--|| ������ �����ϴ� ����?
select e.ename || '�� �Ŵ�����' || m.ename || '�Դϴ�'
from emp e, emp m
where e.mgr = m.empno



--FORD�� ������ �μ��� ����� �̸��� ����ϼ���.
--��, FORD�� �����ϰ� ����Ѵ�.

--���� emp ���̺��� ���� ��Ī �ο�
select *
from emp w, emp f 
where w.deptno = f.deptno
and w.ename = 'FORD'
and f.enmae = 'FORD';

select f.ename
from emp w, emp f 
where w.deptno = f.deptno
and w.ename = 'FORD'
and f.ename != 'FORD';

--outer join 
select e.ename || '�� �Ŵ�����' || m.ename || '�Դϴ�'
from emp e, emp m
where e.mgr = m.empno(+); 

--JOIN ���ǿ��� ������ ���� ���� �൵ ��ȯ�� �� ��� (+)

