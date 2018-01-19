--创建单表视图
create view view_emp
as
select empno,ename,job from emp;
--视图添加数据
insert into view_emp values(7777,'李白','古诗');
--只看视图，不能增删改！
with read only 
--查看视图
select * from view_emp;
--修改成多表视图,多表不能增删改
create or replace view view_emp
as
select ename,dname from emp e,dept d where e.deptno=d.deptno;
--删除视图
drop view view_emp;
--创建唯一索引
create unique index index_dept on dept(dname); 
--创建不唯一索引
create index index_emp on emp(ename);
--删除索引
drop index index_dept;
drop index index_emp;
--创建新用户
create user abc identified by abc account unlock;
grant connect to abc;--连接权限
grant unlimited tablespace to abc;--无限使用表空间权限
grant resource to abc;--能创建和使用对象的权限
--授予adc登陆之后能够查看scott里面的emp表 同义词
create public synonym emp for emp;
grant select on emp to abc;
--切换abc用户即可查询
--删除同义词
drop public synonym emp;
--创建序列
create sequence seq_emp
increment by 1
start with 1
minvalue 1
maxvalue 9999999999
cycle
nocache;
--用序列添加数据
select * from emp;
insert into emp(empno,ename,job) values (seq_emp.nextval,'tom','aaaaa');
insert into emp(empno,ename,job) values (seq_emp.nextval,'jack','bbbbb');
insert into emp(empno,ename,job) values (seq_emp.nextval,'back','ccccc');
--删除序列
drop sequence seq_emp;

--创建数据表空间
create tablespace test nologging
datafile 'd:/test.dbf'size 50M reuse
autoextend on next 512k maxsize 100M
extent management local
--创建日志表空间
create undo tablespace testundo datafile 'd:/testundo.log' size 10M;
--添加数据文件
alter tablespace test 
add datafile 'd:/test2.dbf' size 50M 
maxsize unlimited;
--修改/删除数据文件
alter database datafile 'd:/test.dbf'resize 200M;
--不能写数据可以删除，表空间
alter tablespace test read only;
--回复表空间可读写
alter tablespace test read write;
--表空间脱机
alter tablespace test offline normal;
--表空间联机
alter tablespace test online;
--修改表空间名字
alter tablespace test rename datafile 'D:/TEST.DBF' to 'd:/test123.dbf';
--删除表空间
drop tablespace test including contents and datafiles;