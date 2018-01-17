
select * from emp;

select * from dept;

--1���г�������һ��Ա�������в��š�
select deptno from emp group by deptno having count(deptno)>1;
--2���г�н��ȡ�SMITH���������Ա����
select * from emp where sal>(select sal from emp where ename='SMITH');
--3���г�����Ա������������ֱ���ϼ���������
select e.ename,m.ename from emp e,emp m where e.mgr=m.empno;
--4���г��ܹ�����������ֱ���ϼ�������Ա����
select e.ename from emp e,emp m where e.mgr=m.empno and e.hiredate>m.hiredate;
--5���г��������ƺ���Щ���ŵ�Ա����Ϣ��������Щû��Ա���Ĳ��š�
select d.dname,e.* from emp e right join dept d on e.deptno=d.deptno;
--6���г�����jobΪ��CLERK��������Ա�����������䲿�����ơ�
select e.ename,d.dname from emp e,dept d where e.deptno=d.deptno and job='CLERK';
--7���г����н�����1500�ĸ��ֹ�����
select e.job,min(sal) from emp e group by e.job having min(sal)>1500;
--8���г��ڲ��š�SALES�������۲���������Ա�����������ٶ���֪�����۲��Ĳ��ű�š�
select ename from emp where deptno=(select deptno from dept where dname='SALES');
--9���г�н����ڹ�˾ƽ��н�������Ա����
select ename from emp where sal>(select avg(sal) from emp);
--10���г��롰SCOTT��������ͬ����������Ա����
select ename from emp where deptno=(select deptno from emp where ename='SCOTT');
--11���г�н����ڲ���30��Ա����н�������Ա����������н��
select ename,sal from emp where deptno=30; 
--12���г�н������ڲ���30����������Ա����н���Ա��������н��
select ename,sal from emp where sal>(select max(sal) from emp where deptno=30);
--13���г���ÿ�����Ź�����Ա��������ƽ�����ʺ�ƽ���������ޡ�
select deptno,count(empno),avg(sal) from emp group by deptno;
--14���г�����Ա�����������������ƺ͹��ʡ�
select e.ename,d.dname,sal from emp e left join dept d on e.deptno=d.deptno;
--15���г�����ͬһ�ֹ��������ڲ�ͬ���ŵ�Ա����һ����ϡ�
select * from emp e,emp m where e.job=m.job and e.deptno!=m.deptno;
--16���г����в��ŵ���ϸ��Ϣ�Ͳ���������
select dept.*,(select count(*) from emp where dept.deptno = emp.deptno) as pop from dept;
--17���г����ֹ�������͹��ʡ�
select job,min((nvl(comm,0)+sal)) from emp group by job;
--18���г��������ŵ�MANAGER�����������н��jobΪMANAGER����
select e.deptno,min(sal) from emp e,dept d where job = 'MANAGER' group by e.deptno;
--19���г�����Ա�����깤�ʣ�����н�ӵ͵�������
select ename,(nvl(comm,0)+sal)*12 sall from emp order by sall asc
