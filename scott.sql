--select (컬럼이름)  from (테이블이름) + 커맨드(where, order by/...)



select *
from emp
where sal >= 3000;  -- <,>,<=,>=,=,!=,<>

select * 
from emp
where deptno=10;

select *
from emp
where ename = 'FORD';--비교식 문자는 대소문자 구분

--scott 사번 , 이름 , 급여
select empno,ename,sal
from emp
where ename='SMITH';

select *
from emp
where hiredate <= '1981/11/17'; --입사 날짜를 비교하는 구문

--논리연산자 and,or,not
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
--where sal BETWEEN 2000 and 3000; --2000 이상 3000이하

select *
from emp
where hiredate BETWEEN '81/02/01' and '81/06/30';

--where empno = 7749 or empno 7566 or empno = 7844;
select *
from emp
where empno in(7749,7566,7844);

--와이들카드 (LIKE% , _)
select *
from emp
where ename like = 'F%';  --F로 시작하지만 뒤에 어떤 알파벳이든 상관X

select *
from emp
where ename like '%A'; -- 이름이 마지막에 A로 끝나는 사원

select *
from emp
where ename like '_A_'; -- 언더바는 글자 하나를 표현

select *
from emp
where ename like '_A%'; -- 이름에 글자 하나+ A 알파벳+

select *
form emp
where enmae no like '_A%'; 

--null 데이터 특징 : null은 연산할 수 없음, is 사용!
select *
from emp
where comm is null;

select *
from emp
where comm is not null;


--문제: 이 사람은 누구일까요? 사원의 매니저가 없는 사람 조회
select *
from emp
where mgr is null;  


-- 정열 order by + 컬럼, (오름차순 asc , 내림차순 desc) / 
--오름차순은 생략가능
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
order by ename desc; --문자 정열 a~w

select *
from emp
order by hiredate; -- 날짜 정열 과거~ 현재

select *
from emp
order by sal desc; -- martin 과 ward중에 누구를 더 먼저 정열? 부분 정열 가능

select *
from emp
where deptno = 30
order by sal desc,ename desc; -- 앞의 데이터에서 정열 후, 그 데이터 그룹에서 다시 역정열
(전체정열 아님)


----------------------------------------------------------------------

--order by 절은 항상 문장의 마지막!! 구성에서 마지막에!!
-- select , form, where, order by 순으로


--미리 만들어진 기능을 사용할 수 있는 함수가 있음
-- 함수(숫자, 
-- 숫자 함수

--문자를 숫자로
select TO_NUMBER('100.00')*2 from dual;


select -10,abs(-10) -- abs : 절대값으로 만들어주는 함수
from dual;


 --(  ,2) : 소수점 이하 두번째 자리까지 표현하고 세번째 자리에서
반올림
select round (34.5678,2)
from dual;

-- 트렁크 함수(소수점을 버림)
select trunc(34.5678)
from dual;

select trunc(34.5678,2)
from dual;


--몫을 구하는 함수 : floor
select floor(27/2)
from dual;

--나머지 구하는 함수 : mod
select mod(27,2)
from dual;


-- 사번이 짝수인 사람
select *
from emp
where mod(empno,2) = 0

-- 사번이 홀수인 사람
select *
from emp
where mod(empno,2) = 1;

--문자 관련된 데이터 구하는 함수
-- 문자길이 length
select length('oracle')
from dual;

--문자 값 잘라오기 substr (문자열 시작 1부터)
select substr('Welcome to Oracle',4,3)
from dual;

-- 문자열 뒤에서부터 잘라오기
select substr('welcome to Oracle',-4,3)
from dual;

select substr(hiredate,1,2) 년도, substr(hiredate,4,2)월 -- /도 셈에 포함
from emp;

-- 9월에 입사한 사람만 조회
select *
from emp
where substr(hiredate,4,2) = 09;

--81년도에 입사한 사람만 조회(위 아래 동일한 결과)
where hiredate betwwen '1981/01/01' and '1981/12/31'
where substr(hiredate,1,2)

select *
from emp
where substr(hiredate,1,2) = 81;

--전체 문자에서 'o'를 찾는데 6번째 문자열에서 두번째의 'o' 위치값 반환 
select instr('welcome to oracle','o',6,2)
from dual;

--세번째 문자에 'R'이 들어가는 사람 (뒤에 이름은 상관없음)
select *
from emp
where ename like '__R%';--instr ,substr 을 사용해서 이름에 세번째 알파벳이 R이 있는 사원 구하기
--instr(숫자반환)
select *
from emp
where instr(ename,'R',3,1) =3;  
--문자의 숫자값을 반환해주니 그 결과가 3과 같다면 식을 세워야함

--substr (문자반환)
select *
from emp
where substr(ename,3,1) = 'R'; 

--날짜 구하기
select sysdate
from dual; --가상테이블
select sysdate -1 어제, sysdate + 1 내일
from dual;

--근무날짜 구하기(결과값은 일 수로 나옴)
select round(sysdate - hiredate)
from emp;

--근무날짜 구하기(결과값은 일 수로 나옴)
select round((sysdate - hiredate) /365)
from emp;

-- months_between: 두 날짜간의 차이를 알려주는 함수 
select ename,hiredate,trunc(months_between(sysdate,hiredate))
from emp;



--그룹함수(합계, -값 여러개에 결과 하나) / 단일함수(문자,숫자 관련-값 하나에고 결과 하나 도출)
--그룹함수 sam,avg,count,max,min
select *
from emp;

select sum(sal)
from emp;

select avg(sal) --월급(만원)
from emp;

select max(sal),min(sal)
from emp;

select max(sal)
from emp;

-- 그룹함수는 일반컬럼과 같이 사용 할 수 없음!! (틀린 구조)
--select ename, max(sal)
--from emp;


--count 함수
select count(empno)
from emp;

--comm 안받는 null 빼고 자동연산
select count(comm)
from emp;

-- 전체 사원과 커미션 받는 사원의 수를 하나에 레코드로!
select count(empno),count(comm)
from emp;

select count(*),count(comm)
from emp;

--중복제거 distinct
select count(distinct job) 
from emp;

--절 순서!!!!
--select 
--from
--(where
--group by
--oerder by)

select deptno
from emp
group by deptno;

--부서별 평균 급여 구하기
--group by절이 있으면 그룹함수랑 일반컬럼 함께써도 무방!(레코드 수가 같기때문)
select deptno,avg(sal)
from emp
group by deptno;



----부서별 급여를 가지고 max가 2900이상인 max,min을 출력
select deptno, max(sal),min(sal)
from emp 
group by deptno having max(sal) >= 2900;


--순서!!
--select 
--from
--where
--group by
--having
--order by --order by는 가장 마지막임

--조인 (두개 이상의 테이블을 사용해서 데이터를 조회하는것)

--join:두개 이상의 테이블을 사용해서 데이터를 조회하는 것
select * from dept;
--
--DEPTNO, DNAME,      LOC
--10       ACCOUNTING   NEW YORK
--20       RESEARCH   DALLAS
--30       SALES       CHICAGO
--40       OPERATIONS   BOSTON
--



--동등조인 equal join
 
select ename, e.deptno, dept.dname 
from emp, dept
where emp.deptno = dept.deptno;
-- 두개의 테이블중에 컬럼이 다르면 한쪽은 생략해도됨! 
공통 컬럼인 경우는 테이블을 명시!


-- 테이블의 별칭을 지정하기 ??
select emp.ename, deptno, dept.dname 
from emp e, dept d
where e.deptno = d.deptno;

--특정 사원의 정보 조회
select emp.ename, deptno, dept.dname 
from emp e, dept d
where e.deptno = d.deptno
and ename = 'ALLEN';

--ACCOUNTING부서 소속 사원의 이름과 입사일 출력하세요.
select e.ename, e.hiredate, d.dname
from emp e, dept d
where e.deptno = d.deptno
and d.dname = 'ACCOUNTING';

select e.ename,e.hiredate
from emp e,dept d --약칭
where e.deptno = d.deptno
and d.dname = 'ACCOUNTING';

--조인의 종류( cross join, equi join, no dqui join, out join, self join

--equi join문
select *
from emp;

select*
from dept;

select *
from salgrade;

--각각의 테이블에 따로 존재하는 정보를 join 해야됨! (join은 두개의 테이블씩 비교, 
-- 어떤 테이블과 비교할지 생각! 
--(어떤 테이블과 붙일지? emp 와 dept를 붙이기)



-- no equi join 구문
--ename 사원이름, dname부서명, grade 등급정보--
select ename,dname,grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno
and e.sal BETWEEN s.losal and s.hisal;


--사원의 매니저가 누구인지 구하기
--|| 문자을 연결하는 컴켓?
select e.ename || '의 매니저는' || m.ename || '입니다'
from emp e, emp m
where e.mgr = m.empno



--FORD와 동일한 부서의 사원의 이름을 출력하세요.
--단, FORD는 제외하고 출력한다.

--같은 emp 테이블을 각각 별칭 부여
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
select e.ename || '의 매니저는' || m.ename || '입니다'
from emp e, emp m
where e.mgr = m.empno(+); 

--JOIN 조건에서 동일한 값이 없는 행도 반환할 때 사용 (+)

