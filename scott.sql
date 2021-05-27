--DDL
--    create, drop, alter
--DML
--    select, insert, update, delete
--DCL
--    grant,revoke
--TCL
--    commit, rollback

--TYPE  ���� = char,varchar2, ���� = number, ��¥ - data
create table emp01
(
    empno number(4),--type ���� �������� �������� �߰� ���� ����� number(���ڼ�)
    ename varchar(20),
    sal number(7,2)
);

select *
from emp01;

desc emp01;

create table emp02
as
select * from emp;

desc emp02;

select *
from emp02;

create table emp03
as
select empno, ename
from emp;

desc emp03;

select *
from emp03;

--emp05
--�μ���ȣ�� 10���� ���

create table emp05
as
select * from emp 
where emp.deptno=10;

desc emp05;

select *
from emp05;

--���̺� ���������� ������ ���� ��ĸ� ���� where 1=0;
create table emp06
as
select *
from emp
where 1=0;

select *
from emp06;
--�߰�
alter table emp01
add(job varchar2(9));
desc emp01;
--����
alter table emp01
modify(job varchar2(30));
--����
alter table emp01
drop column job;

select * from emp01;
--����
truncate table emp01;
desc emp01;

--��ųʸ� ��
--USER_xxxx
--ALL_xxxx
--DBA_xxxx

desc user_tables;

SELECT TABLE_NAME
FROM USER_TABLES
ORDER BY TABLE_NAME;

desc all_tables;

select owner,table_name
from all_tables
order by table_name desc;

create table emp01
as
select *
from emp
where 1=0;
desc emp01;

--insert

insert into emp01(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(1111,'ȫ�浿','�л�',9999,'21/05/27',100,30,10);

select *
from emp01;


insert into emp01
values(2222,'�ڱ浿','�л�',2222,'21/05/27',200,10,20);


insert into emp01(empno,ename,sal)
values(3333,'��浿',500);
commit;
desc dept;

insert into dept (dname,loc)
values('�λ��','����');
insert into dept
values(13,'�λ��','����');

--update ����
update emp01
set deptno = 40;

select *
from emp01;

update emp01
set deptno = 20;
rollback;

drop table emp01;

select * from emp;

create table emp01
as
select * from emp;

select * from emp01;

update emp01
set deptno = 30
where deptno = 10;

commit;

update emp01
set sal = sal * 1.1,comm=10000
where sal >= 3000;

--�Ի����� 82�⵵�� ����� �Ի����� ���ó�¥�� ����
update emp01
set hiredate = sysdate
where hiredate like('82%');


--delete
delete from emp01;
select * from emp01;

delete from emp01
where deptno = 30;
commit;

create table dept01--create table�� ��������� �ڵ� commit
as
select * from dept;

select * from dept01;

delete from dept01;

drop table dept01;
TRUNCATE table dept01;
rollback;

--��������
--not null -> c         ������ �Է� �ʼ�
--unique -> u           ������ �ߺ� X,null�ߺ� ���
--primary key -> p      unique,not null �ΰ��� ������ ����Ű��
--foreign key -> r      ���̺� ��������
--check -> c            �������� ���� ����

desc user_constraints;

select constraint_name,constraint_type,table_name
from user_constraints;--���̺� �������� Ȯ��
                                                    --�ΰ� ���� ���
select *
from user_cons_columns; --�÷����� Ȯ��

drop table emp1;
create table emp1
(
    empno number(4) not null,
    ename varchar2(20) not null,
    job varchar2(30),
    deptno number(2)
);

desc emp1;

insert into emp1
values (111,'��浿',null,'');--����� null������ ����

select * from emp1;

delete from emp1
where empno=111;


drop table emp03;

create table emp03
(
    empno number(4) unique,
    ename varchar2(20) not null,
    job varchar2(30),
    deptno number(2)
);

desc emp03;

insert into emp03
values (111,'��浿','sales',10);

insert into emp03
values (111,'�ڱ浿','doctor',10);

insert into emp03
values (null,'�ڵ�','doctor',10);

drop table emp04;

create table emp04
(
    empno number(4) constraint emp04_empno_uk unique,
    ename varchar2(20) constraint emp04_ename_nn not null,
    job varchar2(30),
    deptno number(2)
);

insert into emp04
values (111,'�ڵ�','doctor',10);
insert into emp04
values (123,'�ڵ�','doctor',20);

select constraint_name,constraint_type,table_name,r_constraint_name
from user_constraints
where table_name in ('DEPT','EMP07');--���̺� �������� Ȯ��
                                                    --�ΰ� ���� ���
select *
from user_cons_columns; --�÷����� Ȯ��

DROP TABLE EMP05;
create table emp05
(
    empno number(4) constraint emp05_empno_pk PRIMARY KEY,
    ename varchar2(20) constraint emp05_ename_nn not null,
    job varchar2(30),
    deptno number(2)
);
insert into emp05
values (111,'�ڵ�','doctor',10);
insert into emp05
values (123,'�ڵ�','doctor',20);
insert into emp05
values (NULL,'�ڵ�','doctor',20);

DESC EMP;

SELECT * FROM EMP;

INSERT INTO EMP(empno, ename,deptno)
values(5000,'asb',50);
drop table emp06;
CREATE TABLE EMP06
(
    empno number(4) constraint emp06_empno_pk PRIMARY KEY,
    ename varchar2(20) constraint emp06_ename_nn not null,
    job varchar2(30),
    deptno number(2) constraint emp06_deptno_fk references dept(deptno)
);
desc emp06;
INSERT INTO EMP06(empno, ename,deptno)
values(5000,'asb',40);
select * from emp06;

create table emp07
(
    empno number(4) constraint emp07_empno_pk PRIMARY KEY,
    ename varchar2(20) constraint emp07_ename_nn not null,
    sal number(7,2) constraint emp07_sal_ck check(sal between 500 and 5000),
    gender varchar2(1) constraint emp07_gender_ck check(gender in('M','F'))
);

INSERT INTO EMP07
VALUES(111,'ASB',8000,'M');
INSERT INTO EMP07
VALUES(111,'ASB',4000,'S');
INSERT INTO EMP07
VALUES(111,'ASB',4000,'F');

SELECT *
FROM EMP07;
purge recyclebin;

select * from tab;

--�����̺� ���� �ִ� ���̺�� ����
CREATE TABLE DEPT_COPY
AS
SELECT * FROM DEPT;

CREATE TABLE EMP_COPY
AS
SELECT * FROM EMP;

--���� �ִ¹�� SYSTEM=>
--GRANT CREATE VIEW
--TO SCOTT;
CREATE OR REPLACE VIEW EMP_VIEW30 --or replace ������ ��������ִ� �信 ������ ���� �̸����� �並 �����Ҷ� ������ �ȵ�
AS
SELECT EMPNO,ENAME,SAL,DEPTNO,job
FROM EMP_COPY
WHERE DEPTNO = 30;

SELECT * FROM EMP_VIEW30;
DELETE FROM EMP_VIEW30;
SELECT * FROM EMP_COPY;
ROLLBACK;

drop view emp_view30;

--user_views
desc user_views;

select view_name,text
from user_views;

select index_name,table_name,column_name
from user_ind_columns
where table_name IN ('EMP01','DEPT');

DESC USER_INDEXES;

SELECT INDEX_NAME,TABLE_NAME
FROM USER_INDEXES;

DROP TABLE EMP01;

CREATE TABLE EMP01
AS
SELECT * FROM EMP;

select index_name,table_name,column_name
from user_ind_columns
where table_name IN ('EMP01');

INSERT INTO EMP01
SELECT * FROM EMP01;
SELECT*FROM EMP01;

INSERT INTO EMP01(EMPNO,ENAME)
VALUES(1111,'aaa');

SELECT * FROM EMP01
WHERE ENAME = 'aaa';

CREATE INDEX EMP01_ENAME
ON EMP01(ENAME);