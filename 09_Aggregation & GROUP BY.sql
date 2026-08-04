--M1. Show total salary (SUM(salary)) for the whole company from hr.employees.
--Ans: 
--    select sum(salary) from emp

--M2. Count employees per job_id.
--Ans:
--       select count(*),job_id
--       from emp
--       group by job_id

--M3. Show average salary per department_id.
--Ans:
--       select round(avg(salary),2),department_id
--       from emp
--       group by department_id

--M4. List department_id and min(salary), max(salary) per department.
--Ans:
--        select department_id,min(salary),max(salary)
--        from emp
--        group by department_id

--M5. Count employees per department_id.
--Ans:
--       select count(*),department_id
--       from emp
--       group by department_id

--M6. Show job_id and total salary per job.
--Ans:
--       select job_id,sum(salary)
--       from emp
--       group by job_id

--M7. List department_id and number of employees with non-null commission_pct (COUNT(commission_pct)).
--Ans:
--        select department_id,count(commission_pct)
--        from emp
--        group by department_id

--M8. Show min(hire_date) and max(hire_date) per job_id.
--Ans:
--        select job_id, min(hire_date),max(hire_date)
--        from emp
--        group by job_id

--M9. Count total employees (COUNT()) in hr.employees.
--Ans:
--       select count(*) from emp

--M10. Show department_id, avg(salary), and count(*) per department.
--Ans:
--        select department_id,round(avg(salary),1),count(*)
--        from emp
--        group by department_id

--M11. List job_id and average salary per job; order by average salary desc.
--Ans:
--         select job_id,avg(salary)
--         from emp
--         group by job_id
--         order by avg(salary) desc

--M12. Show department_id and sum(salary) for department_id in (50, 60, 80).
--Ans:
--         select department_id,sum(salary)
--         from emp
--         where department_id in(50,60,80)
--         group by department_id

--M13. Count employees per manager_id (include only where manager_id is not null).
--Ans:
--         select count(*),manager_id
--         from emp
--         group by manager_id

--M14. Show job_id and min(salary) per job.
--Ans:
--          select job_id,min(salary)
--          from emp
--          group by job_id

--M15. List department_id and max(hire_date) per department.
--Ans:
--         select department_id,max(hire_date)
--         from emp
--         group by department_id
         
--M16. Show total salary for department_id 90 only.
--Ans:
--        select sum(salary),,department_id
--        from emp
--        where department_id=90
--        group by department_id

--M17. Count distinct job_id values (COUNT(DISTINCT job_id)).
--Ans:
--         select count(distinct job_id)
--         from emp

--M18. Show department_id, job_id, and count(*) per (department_id, job_id).
--Ans:
--          select department_id,job_id,count(*)
--          from emp
--          group by department_id,job_id

--M19. List department_id and avg(salary) rounded to 2 decimals per department.
--Ans:
--        select department_id,round(avg(salary),2)
--        from emp
--        group by department_id

--M20. Show job_id and count of employees; only job_ids with at least 2 employees.
--Ans:
--         select job_id,count(*)
--         from emp
--         group by job_id
--         having count(*)>=2

--        <=======HARD======>

--H1. Show department_id, department_name (join to hr.departments), and total salary per department.   
--Ans:
--           select e.department_id,department_name,sum(salary)
--           from emp e join dept d on e.department_id=d.department_id
--           group by department_name,e.department_id

--H2. List job_id and average salary for jobs that have more than 3 employees.
--Ans:
--        select job_id,avg(salary),count(*)
--        from emp
--        group by job_id
--        having count(*) >3

--H3. Show department_id and count of employees, and also count of employees hired after 2000
--Ans:        
--       select department_id,count(*),count( case 
--                                                when extract(year from hire_date)>2000 then 1
--                                                else 0
--                                                end) as hire_date_after_2000
--       from emp
--       group by department_id