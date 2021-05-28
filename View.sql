--��������
SELECT dname
from dept
where deptno = (
                select deptno 
                from emp 
                where ename='SMITH'
                );
--where sal = max(sal); �׷��Լ��� where ���� ����� �� ����.
select ename,sal
from emp
where sal =(
            select max(sal)
            from emp
            );

--������ ��������(��ȸ ����� �ϳ��� ����)

--������ ��������(��ȸ ����� �������� ����)
--in = or�� ���� �ǹ̸� ����, all, any, some

select deptno
from emp
where sal >=3000;

select ename,sal,deptno
from emp
where deptno in (
                select deptno
                from emp
                where sal >= 3000
                );
select max(sal)
from emp
where deptno=30;

select ename,sal
from emp
where sal > all(
                select sal
                from emp
                where deptno = 30
                );
                
select ename,sal
from emp
where sal > any(
                select sal
                from emp
                where deptno = 30
                );
--������(job) manager�� ����� ���� �μ��� �μ���ȣ�� �μ���� ������ ���
select deptno,dname,loc
from dept
where deptno in(
            select deptno
            from emp
            where lower(job)='manager'--lower �ҹ��ڷ� �ᵵ��
            );
select job
from emp
where job ='MANAGER';

select d.deptno,dname,loc
from dept d, emp e
where d.deptno = e.deptno
and e.job = 'MANAGER';

--�Ի����� ���� ���� 5�� ��ȸ --rownum ����Ŭ������ ��밡�� --rownum �� ����Ҷ� ���ǹ����� 1�� �����ϴ� ������ �ۼ��ؾ���,�並�����
select rownum, empno,ename,hiredate
from emp
order by hiredate desc;

create or replace view view_hire
as
select empno,ename,hiredate
from emp
order by hiredate;

select * from view_hire;

select rownum, empno,ename,hiredate
from view_hire
where rownum <=5;

select rownum, b.*
from view_hire b
where rownum <=5;
--�ζ��κ�
select rm, empno,ename,hiredate
from (
        select rownum rm,e1.*
        from(
                select empno,ename,hiredate
                from emp
                order by hiredate
            )e1
    )
where rm >=2 and rownum<=3;

--select e2.rnum, e2.ename, e2.empno, e2.hiredate
--from (
--    select rownum rnum, e1.*
--    from (
--            select *
--            from emp
--            order by hiredate
--          ) e1
--    ) e2
--where e2.rnum between 2 and 4;

--�ζ��κ�
select rm,empno,ename,hiredate
from ( 
    select rownum rm, v1.*
    from view_hire v1
    )
where rm between 2 and 4;
