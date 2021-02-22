-- 부서 : DEPT
-- 인사 : INSA
-- 직원 : EMP
-- 보너스 : BONUS
-- 연봉에 따른 등급 : SALGRADE
 
--1
select * from dept;

--2
select job, empno, ename, hiredate
from emp;

--3
select distinct job
from emp;

--4
select * from emp;
select ename, sal 
from emp
where sal >= 2850;

--5
select ename, deptno
from emp
where empno = 7566;

--6
select ename, sal
from emp
where sal between 1500 and 2850;

--7
select ename, job, hiredate
from emp
where hiredate between TO_DATE('19810220', 'yyyy/mm/dd') and TO_DATE('19810501', 'yyyy/mm/dd') 
order by hiredate asc;

--8
select ename, deptno
from emp
where deptno = 10 or deptno = 30
order by ename;

--9
select t.ename employee, t.sal as "Monthly Salary"
from (select *
        from emp
        where deptno = 10 or deptno = 30) t
where t.sal > 1500;

--10
select ename, job 
from emp
where mgr is null;

--11
select *
from emp;

select ename, sal, comm
from emp
where comm is not null and comm != 0
order by sal desc;

--12
select ename
from emp
where ename like ('^.{2}A%');

select ename
from emp
where ename like '__A%';

--13
select ename, deptno
from emp
where deptno=30 and ename like '%L%L%';

--14
select ename, job, sal
from emp
where job in ('CLERK', 'ANALYST') and sal not in (1000,3000,5000);

--15
select empno, ename, trunc(sal*1.15) as "New Salary"
from emp;

--16
select empno, ename, trunc(sal*0.15) as "Increase"
from emp;

--18
select ename, length(ename)
from emp;

--19
select ename, NVL(TO_CHAR(comm), 'no commision')
from emp;

--20
-- 방법1 (DECODE 사용)
select ename, e.deptno, dname
from emp e
join dept d on d.deptno = e.deptno;

SELECT empno, deptno , DECODE(deptno,10,'ACCOUNTING' ,
                                        20,'RESEARCH') AS "dname"
FROM EMP;

-- 방법2
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO;

--21
SELECT sal, loc
from emp e, dept d
where e.deptno = 30;

--22
SELECT distinct JOB, loc
from emp e, dept d
where e.deptno = 30 and e.deptno = d.deptno;

--23
select ename, dname, loc
from emp e, dept d
where e.deptno = d.deptno and comm is not null;

--24
select ename, dname
from emp e, dept d
where e.deptno = d.deptno and REGEXP_LIKE (ename, '[Aa]', 'i');

--25
select ename, job, e.deptno, dname, loc
from dept d, emp e
where loc = UPPER('Dallas');

--26
select e1.ename "employee", e1.empno "emp#", e2.ename "manager", e1.mgr "mgr#"
from emp e1
join emp e2 on e1.mgr = e2.empno;

--27
select e.ename, job, d.dname, sal, grade 
from emp e, salgrade g, dept d
where e.sal between g.losal and hisal and d.deptno = e.deptno;

select *
from dept;
-- deptno dname     loc
--10	ACCOUNTING	NEW YORK
--20	RESEARCH	DALLAS
--30	SALES	CHICAGO
--40	OPERATIONS	BOSTON

select *
from salgrade;
--grade losal hisal
--1	700	1200
--2	1201	1400
--3	1401	2000
--4	2001	3000
--5	3001	9999

--28
select ename, hiredate
from emp e, (select hiredate shiredate from emp where ename = UPPER('smith') ) s
where s.shiredate < e.hiredate;
-- smith's hiredate is 80/12/17

--29
select e1.ename "Employee", e1.hiredate "EmpHiredate", e2.ename "Manager", e2.hiredate "MgrHiredate" 
from emp e1, emp e2
where e1.mgr = e2.empno and e1.hiredate < e2.hiredate;


--30
select MAX(sal) "Maximum", MIN(sal) "Minimum", SUM(sal) "Sum", AVG(sal) "Average"
from emp;

--31
select MAX(sal) "Maximum", MIN(sal) "Minimum", SUM(sal) "Sum", AVG(sal) "Average"
from emp
group by job;

--32
select count(job) "사람 수", job
from emp
group by job;

--33
select count(distinct(mgr)) "Number of Manager"
from emp;

--34
select max(sal) - min(sal)
from emp;

--35
select e2.mgr, min(e1.sal)
from emp e1, emp e2
where e1.mgr is not null and e1.mgr = e2.mgr
group by e2.mgr
having min(e1.sal) > 1000
order by min(e1.sal) desc;

--36
select dname "부서명", loc "위치", count(e.empno) "사원의 수", floor(avg(sal)) "평균급여"
from emp e, dept d
where e.deptno = d.deptno
group by dname, loc;

--37
select e.ename, hiredate
from emp e, (select deptno, ename from emp where ename = UPPER('smith')) t
where e.deptno = t.deptno and e.ename != t.ename;

--38
select empno, ename, sal
from emp e, (select avg(sal) average_sal from emp) t
where t.average_sal < sal
order by sal desc;

--39
select empno, ename
from emp e, (select deptno from emp where REGEXP_LIKE(ename, '[Tt]', 'i')) t
where e.deptno = t.deptno;

--40
select ename, e.deptno, job
from emp e, dept d
where d.loc = UPPER('Dallas') and e.deptno = d.deptno;





--
-- ALTER
-- CREATE
-- DROP
-- RENAME
-- TRUNCATE