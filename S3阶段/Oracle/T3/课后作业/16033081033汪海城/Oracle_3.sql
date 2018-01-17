
select * from emp;

select * from dept;

--1、列出至少有一个员工的所有部门。
select deptno from emp group by deptno having count(deptno)>1;
--2、列出薪金比“SMITH”多的所有员工。
select * from emp where sal>(select sal from emp where ename='SMITH');
--3、列出所有员工的姓名及其直接上级的姓名。
select e.ename,m.ename from emp e,emp m where e.mgr=m.empno;
--4、列出受雇日期早于其直接上级的所有员工。
select e.ename from emp e,emp m where e.mgr=m.empno and e.hiredate>m.hiredate;
--5、列出部门名称和这些部门的员工信息，包括那些没有员工的部门。
select d.dname,e.* from emp e right join dept d on e.deptno=d.deptno;
--6、列出所有job为“CLERK”（办事员）的姓名及其部门名称。
select e.ename,d.dname from emp e,dept d where e.deptno=d.deptno and job='CLERK';
--7、列出最低薪金大于1500的各种工作。
select e.job,min(sal) from emp e group by e.job having min(sal)>1500;
--8、列出在部门“SALES”（销售部）工作的员工的姓名，假定不知道销售部的部门编号。
select ename from emp where deptno=(select deptno from dept where dname='SALES');
--9、列出薪金高于公司平均薪金的所有员工。
select ename from emp where sal>(select avg(sal) from emp);
--10、列出与“SCOTT”从事相同工作的所有员工。
select ename from emp where deptno=(select deptno from emp where ename='SCOTT');
--11、列出薪金等于部门30中员工的薪金的所有员工的姓名和薪金。
select ename,sal from emp where deptno=30; 
--12、列出薪金高于在部门30工作的所有员工的薪金的员工姓名和薪金。
select ename,sal from emp where sal>(select max(sal) from emp where deptno=30);
--13、列出在每个部门工作的员工数量、平均工资和平均服务期限。
select deptno,count(empno),avg(sal) from emp group by deptno;
--14、列出所有员工的姓名、部门名称和工资。
select e.ename,d.dname,sal from emp e left join dept d on e.deptno=d.deptno;
--15、列出从事同一种工作但属于不同部门的员工的一种组合。
select * from emp e,emp m where e.job=m.job and e.deptno!=m.deptno;
--16、列出所有部门的详细信息和部门人数。
select dept.*,(select count(*) from emp where dept.deptno = emp.deptno) as pop from dept;
--17、列出各种工作的最低工资。
select job,min((nvl(comm,0)+sal)) from emp group by job;
--18、列出各个部门的MANAGER（经理）的最低薪金（job为MANAGER）。
select e.deptno,min(sal) from emp e,dept d where job = 'MANAGER' group by e.deptno;
--19、列出所有员工的年工资，按年薪从低到高排序。
select ename,(nvl(comm,0)+sal)*12 sall from emp order by sall asc
