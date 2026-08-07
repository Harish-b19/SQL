M1. Show total salary (SUM(salary)) for the whole company from hr.employees.
Ans: 
    select sum(salary) from emp

M2. Count employees per job_id.
Ans:
       select count(*),job_id
       from emp
       group by job_id

M3. Show average salary per department_id.
Ans:
       select round(avg(salary),2),department_id
       from emp
       group by department_id

M4. List department_id and min(salary), max(salary) per department.
Ans:
        select department_id,min(salary),max(salary)
        from emp
        group by department_id

M5. Count employees per department_id.
Ans:
       select count(*),department_id
       from emp
       group by department_id

M6. Show job_id and total salary per job.
Ans:
       select job_id,sum(salary)
       from emp
       group by job_id

M7. List department_id and number of employees with non-null commission_pct (COUNT(commission_pct)).
Ans:
        select department_id,count(commission_pct)
        from emp
        group by department_id

M8. Show min(hire_date) and max(hire_date) per job_id.
Ans:
        select job_id, min(hire_date),max(hire_date)
        from emp
        group by job_id

M9. Count total employees (COUNT()) in hr.employees.
Ans:
       select count(*) from emp

M10. Show department_id, avg(salary), and count(*) per department.
Ans:
        select department_id,round(avg(salary),1),count(*)
        from emp
        group by department_id

M11. List job_id and average salary per job; order by average salary desc.
Ans:
         select job_id,avg(salary)
         from emp
         group by job_id
         order by avg(salary) desc

M12. Show department_id and sum(salary) for department_id in (50, 60, 80).
Ans:
         select department_id,sum(salary)
         from emp
         where department_id in(50,60,80)
         group by department_id

M13. Count employees per manager_id (include only where manager_id is not null).
Ans:
         select count(*),manager_id
         from emp
         group by manager_id

M14. Show job_id and min(salary) per job.
Ans:
          select job_id,min(salary)
          from emp
          group by job_id

M15. List department_id and max(hire_date) per department.
Ans:
         select department_id,max(hire_date)
         from emp
         group by department_id
         
M16. Show total salary for department_id 90 only.
Ans:
        select sum(salary),,department_id
        from emp
        where department_id=90
        group by department_id

M17. Count distinct job_id values (COUNT(DISTINCT job_id)).
Ans:
         select count(distinct job_id)
         from emp

M18. Show department_id, job_id, and count(*) per (department_id, job_id).
Ans:
          select department_id,job_id,count(*)
          from emp
          group by department_id,job_id

M19. List department_id and avg(salary) rounded to 2 decimals per department.
Ans:
        select department_id,round(avg(salary),2)
        from emp
        group by department_id

M20. Show job_id and count of employees; only job_ids with at least 2 employees.
Ans:
         select job_id,count(*)
         from emp
         group by job_id
         having count(*)>=2

        <=======HARD======>

H1. Show department_id, department_name (join to hr.departments), and total salary per department.   
Ans:
           select e.department_id,department_name,sum(salary)
           from emp e join dept d on e.department_id=d.department_id
           group by department_name,e.department_id

H2. List job_id and average salary for jobs that have more than 3 employees.
Ans:
        select job_id,avg(salary),count(*)
        from emp
        group by job_id
        having count(*) >3

H3. Show department_id and count of employees, and also count of employees hired after 2000
Ans:        
       select department_id,count(*),count( case 
                                                when extract(year from hire_date)>2000 then 1
                                                else 0
                                                end) as hire_date_after_2000
       from emp
       group by department_id

H4. List department_id where total salary is greater than 100000.
Ans:
       select department_id,sum(salary)
       from emp
       group by department_id
       having sum(salary)>100000

H5. Show job_id and max(salary) and min(salary) per job; only jobs where max - min > 5000.
Ans:
       select job_id,max(salary),min(salary)
       from emp
       group by job_id
       having max(salary)-min(salary)>5000

H6. List department_name (join) and employee count per department; order by count desc.
Ans:
       select department_name,count(*) as emp_count
       from dept d join emp e on d.department_id=e.department_id
       group by department_name
       order by  emp_count desc

H7. Show department_id and average tenure in years (AVG(MONTHS_BETWEEN(SYSDATE, hire_date)/12)) per department.
Ans:
      select department_id,round(avg(months_between(sysdate,hire_date)/12),2) tenure
      from emp
      group by department_id

H8. List job_id and total salary for jobs with word 'MAN' in job_id.
Ans:
       select job_id,sum(salary)
       from emp
       where upper(job_id) like '%MAN%'
       group by job_id

H9. Show department_id, count(*), and sum(salary) per department; only departments with avg(salary) > 7000.
Ans:
       select department_id,count(*) employees,sum(salary)
       from emp
       group by department_id
       having avg(salary)>7000

H10. List department_name and min(salary), max(salary) per department (join).
Ans:
       select department_name,min(salary),max(salary)
       from emp e join dept d on e.department_id=d.department_id
       group by department_name

H11. Show manager_id and count of direct reports; only managers with more than 2 reports.
Ans:
       select manager_id,count(*)
       from emp
       where manager_id is not null
       group by manager_id
       having count(*)>2

H12. List department_id and count of distinct job_id in that department.
Ans:
      select department_id,count(distinct job_id)
      from emp
      group by department_id

H13. Show job_id and average salary; only for departments 50, 80, 90.
Ans:
        select job_id,round(avg(salary),2)
        from emp
        where department_id in(50,80,90)
        group by job_id

H14. List department_id where the number of employees is greater than 5 and total salary > 200000.
Ans:
       select department_id,count(*),sum(salary)
       from emp
       group by department_id
       having count(*) >5 and sum(salary)>200000

H15. Show department_name and total salary per department; only departments with at least 1 employee with commission_pct not null.
Ans:
        select department_name,sum(salary),count(e.commission_pct)
        from emp e join dept d on e.department_id=d.department_id
        group by department_name
        having count(e.commission_pct)>0 or
               sum(case when e.commission_pct is not null then 1
                        else 0
                   end)>0   count(e.commission)>0

H16. List job_id and count of employees; order by count desc, then job_id.
Ans:
       select job_id,count(*)
       from emp
       group by job_id
       order by count(*) desc,job_id

H17. Show department_id and sum(salary) and avg(salary) per department; round avg to 2 decimals.
Ans:
       select department_id,sum(salary),round(avg(salary),2)
       from emp
       group by department_id

H18. List department_id that has the maximum total salary 
Ans:
       select department_id,sum(salary) total
       from emp
       group by department_id
       having sum(salary) = (select max(total)from (select sum(salary) as total from emp group by department_id))

H19. Show department_id, job_id, count(*), and sum(salary) per (department_id, job_id); use ROLLUP(department_id, job_id).
Ans:
        select department_id,job_id,count(*),sum(salary)
        from emp
        group by rollup(department_id,job_id)
        order by department_id,job_id

H20. List department_name and employee count; include departments with 0 employees (LEFT JOIN from departments to employees, then GROUP BY).
Ans:
        select department_name,count(employee_id)
        from dept d left join emp e on e.department_id=d.department_id
        group by department_name