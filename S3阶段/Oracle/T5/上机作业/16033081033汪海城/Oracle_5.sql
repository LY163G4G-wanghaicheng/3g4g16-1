--����������ͼ
create view view_emp
as
select empno,ename,job from emp;
--��ͼ�������
insert into view_emp values(7777,'���','��ʫ');
--ֻ����ͼ��������ɾ�ģ�
with read only 
--�鿴��ͼ
select * from view_emp;
--�޸ĳɶ����ͼ,�������ɾ��
create or replace view view_emp
as
select ename,dname from emp e,dept d where e.deptno=d.deptno;
--ɾ����ͼ
drop view view_emp;
--����Ψһ����
create unique index index_dept on dept(dname); 
--������Ψһ����
create index index_emp on emp(ename);
--ɾ������
drop index index_dept;
drop index index_emp;
--�������û�
create user abc identified by abc account unlock;
grant connect to abc;--����Ȩ��
grant unlimited tablespace to abc;--����ʹ�ñ�ռ�Ȩ��
grant resource to abc;--�ܴ�����ʹ�ö����Ȩ��
--����adc��½֮���ܹ��鿴scott�����emp�� ͬ���
create public synonym emp for emp;
grant select on emp to abc;
--�л�abc�û����ɲ�ѯ
--ɾ��ͬ���
drop public synonym emp;
--��������
create sequence seq_emp
increment by 1
start with 1
minvalue 1
maxvalue 9999999999
cycle
nocache;
--�������������
select * from emp;
insert into emp(empno,ename,job) values (seq_emp.nextval,'tom','aaaaa');
insert into emp(empno,ename,job) values (seq_emp.nextval,'jack','bbbbb');
insert into emp(empno,ename,job) values (seq_emp.nextval,'back','ccccc');
--ɾ������
drop sequence seq_emp;

--�������ݱ�ռ�
create tablespace test nologging
datafile 'd:/test.dbf'size 50M reuse
autoextend on next 512k maxsize 100M
extent management local
--������־��ռ�
create undo tablespace testundo datafile 'd:/testundo.log' size 10M;
--��������ļ�
alter tablespace test 
add datafile 'd:/test2.dbf' size 50M 
maxsize unlimited;
--�޸�/ɾ�������ļ�
alter database datafile 'd:/test.dbf'resize 200M;
--����д���ݿ���ɾ������ռ�
alter tablespace test read only;
--�ظ���ռ�ɶ�д
alter tablespace test read write;
--��ռ��ѻ�
alter tablespace test offline normal;
--��ռ�����
alter tablespace test online;
--�޸ı�ռ�����
alter tablespace test rename datafile 'D:/TEST.DBF' to 'd:/test123.dbf';
--ɾ����ռ�
drop tablespace test including contents and datafiles;