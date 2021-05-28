--서브쿼리
SELECT dname
from dept
where deptno = (
                select deptno 
                from emp 
                where ename='SMITH'
                );
--where sal = max(sal); 그룹함수는 where 절에 사용할 수 없다.
select ename,sal
from emp
where sal =(
            select max(sal)
            from emp
            );

--단일행 서브쿼리(조회 결과가 하나인 형태)

--다중행 서브쿼리(조회 결과가 여러개인 형태)
--in = or과 같은 의미를 가짐, all, any, some

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
--직급이(job) manager인 사람이 속한 부서의 부서번호와 부서명과 지역을 출력
select deptno,dname,loc
from dept
where deptno in(
            select deptno
            from emp
            where lower(job)='manager'--lower 소문자로 써도됨
            );
select job
from emp
where job ='MANAGER';

select d.deptno,dname,loc
from dept d, emp e
where d.deptno = e.deptno
and e.job = 'MANAGER';

--입사일이 가장 빠른 5명 조회 --rownum 오라클에서만 사용가능 --rownum 을 사용할때 조건문에는 1을 포함하는 것으로 작성해야함,뷰를사용함
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
--인라인뷰
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

--인라인뷰
select rm,empno,ename,hiredate
from ( 
    select rownum rm, v1.*
    from view_hire v1
    )
where rm between 2 and 4;
