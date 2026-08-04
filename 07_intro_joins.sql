
M1. List employee_id, first_name, last_name, and department_name (join employees and departments).
Ans:
     select employee_id,first_name,last_name,d.department_name
     from emp e join dept d on e.department_id=d.department_id

M2. Show employees in department 'IT' (filter by d.department_name = 'IT' after join).
Ans:
         select *
         from emp e join dept d on e.department_id=d.department_id
         where d.department_name='IT'

M3. Count employees per department and show department_name
Ans:
          select count(employee_id),d.department_id,d.department_name
          from emp e join dept d on e.department_id=d.department_id
          group by d.department_id,d.department_name

M4. List first_name, last_name, department_id, department_name for department_id 50.
Ans:
            select first_name,last_name,e.department_id,d.department_name
            from emp e join dept d on e.department_id=d.department_id
            where e.department_id=50
          
M5.Show employee_id, salary, and department_name
Ans: 
          select employee_id,salary,department_name
          from emp e join dept d on e.department_id=d.department_id
          
M6. List departments (department_id, department_name) that have at least one employee (use JOIN and DISTINCT or GROUP BY).
Ans:
        select distinct e.department_id,department_name
        from emp e join dept d on e.department_id=d.department_id

M7. Show first_name, last_name, department_name for employees with salary > 8000.
Ans:
         select first_name,last_name,d.department_name
         from emp e join dept d on e.department_id=d.department_id
         where salary>8000

M8. List employee_id, job_id, department_name.
Ans:          
         select employee_id,job_id,department_name
         from emp e join dept d on e.department_id=d.department_id

M9. Count employees per department_name (one row per department).
Ans:         
         select count(employee_id),department_name
         from emp e join dept d on e.department_id=d.department_id
         group by department_name
        
M10. Show employees (name, salary) in department 'Sales'.
Ans:        
         select first_name,last_name,salary,department_name
         from emp e join dept d on e.department_id=d.department_id
         where lower(department_name)='sales'

M11. List department_id, department_name, and total salary (SUM(e.salary)) for that department.
Ans:        
              select e.department_id,department_name,sum(salary)
              from emp e join dept d on e.department_id = d.department_id
              group by department_name,e.department_id

M12. Show employee_id, hire_date, department_name
Ans:
           select e.employee_id,hire_date,department_name
           from emp e join dept d on e.department_id=d.department_id

M13. List employees (first_name, last_name) and their department_name, ordered by department_name then last_name.
Ans:           
            select first_name,last_name,department_name
            from emp e join dept d on e.department_id=d.department_id
            order by department_name,last_name

M15. List employee_id, first_name, department_id, department_name for job_id 'SA_REP'.
Ans:
        select employee_id,first_name,employee_id,department_name,job_id
        from emp e join dept d on e.department_id=d.department_id
        where job_id='SA_REP'

M16. Show departments (department_name) and min salary in that department
Ans:
       select department_name,min(salary)
       from emp e join dept d on e.department_id=d.department_id
       group by department_name

M17. List first_name, last_name, department_name where department_id is 80 or 90.
Ans:
        select first_name,last_name,department_name
        from emp e join dept d on e.department_id=d.department_id
        where e.department_id in (80,90)

M18. Show employee_id, salary, department_name for the 5 highest-paid employees (join then ORDER BY salary DESC FETCH FIRST 5)
Ans:        
              select employee_id,salary,department_name
              from emp e join dept d on e.department_id=d.department_id
              order by salary desc
              fetch first 5 rows only;
        
M19. List department_name and number of employees (COUNT) for departments with more than 5 employees.
Ans:        
      select department_name,count(employee_id)
      from emp e join dept d on e.department_id=d.department_id
      group by department_name
      having count(employee_id)>5

M20. Show first_name, last_name, department_name, hire_date.
Ans:         
        select first_name,last_name,department_name,hire_date
        from emp e join dept d on e.department_id=d.department_id
             
                                     <hard>

H1. List employee_id, first_name, last_name, department_name, and managers first_name and last_name (self-join employees to manager, and join to departments).
Ans:     
         select m.employee_id,e.first_name,e.last_name,department_name,m.first_name,m.last_name
         from emp e join dept d on e.department_id=d.department_id 
         left join emp m on e.manager_id=m.employee_id
                  
H2. Show department_name and total salary for departments where total salary > 100000.
Ans:         
       select department_name,sum(salary)
       from emp e join dept d on e.department_id=d.department_id
       group by department_name
       having sum(salary)>100000

H3. List employees (name, salary, department_name) who earn more than the average salary of their department.
Ans:         
         select first_name,e.salary,department_name
         from emp e join dept d on e.department_id=d.department_id
         where e.salary>(select avg(salary) from emp where department_id=e.department_id )
        
H4. Show each department_name and the name of the employee with the highest salary in that department (use ROW_NUMBER or MAX(salary) join).     
Ans: 
       select department_name,employee_id,salary
       from emp e join dept d on e.department_id=d.department_id
       where salary =(select max(salary) from emp where department_id=e.department_id)
              
H5. List department_id, department_name, and count of employees, only for departments in (10, 20, 30, 40).
Ans:
        select e.department_id,department_name,count(*) empc
        from emp e join dept d on e.department_id=d.department_id
        where e.department_id in(10,20,30,40)
        group by department_name,e.department_id

H6. Show employee first_name, last_name, department_name, and managers department_name (employee's dept and manager's dept).
Ans:
      select e.first_name,e.last_name,d.department_name
      from emp e join dept d on e.department_id=d.department_id
      left join emp m on e.employee_id=m.manager_id left join dept d1
      on m.department_id=d1.department_id
      
H7. List department_name and average salary, ordered by average salary descending.
Ans:
       select department_name,round(avg(salary),2)
       from emp e join dept d on e.department_id = d.department_id
       group by department_name
       order by avg(salary) desc

H8. Show employees (name, salary, department_name) whose salary is above the company average
Ans:
     select first_name,salary,department_name
     from emp e join dept d on e.department_id =d.department_id
     where e.salary>(select avg(salary) from emp)

H9. List departments (department_name) that have at least one employee with commission_pct not null.
Ans:     
        select distinct department_name
        from emp e join dept d on e.department_id=d.department_id
        where commission_pct is not null

H10. Show employee_id, first_name, last_name, department_name, and departments manager_id (from departments).
Ans:
        select employee_id,first_name,last_name,department_name,d.manager_id
        from emp e join dept d on e.department_id=d.department_id

H11. List department_name and max salary in that department, only for departments with max salary > 12000.
Ans:        
       select department_name,max(salary)
       from emp e join dept d on e.department_id=d.department_id
       group by department_name
       having max(salary)>12000

H12. Show first_name, last_name, department_name for employees hired after 2005.
Ans:
        select first_name,last_name,department_name
        from emp e join dept d on e.department_id=d.department_id
        where hire_date> to_date ('2005-01-01','yyyy-mm-dd')

H13. List departments (department_name) and count of employees with job_id 'SA_REP' in that department.
Ans:
      select count(*),department_name
      from emp e join dept d on e.department_id=d.department_id
      where job_id='SA_REP'
      group by department_name

H14. Show employee name, department_name, and salary rank within that department (RANK() OVER (PARTITION BY department_id ORDER BY salary DESC)).
Ans:
        select first_name,department_name,salary ,rank() over (partition by e.department_id order by salary desc)as salary_rank
        from emp e join dept d on e.department_id=d.department_id
   
H15. List department_name and total number of employees, including departments with 0 employees (use LEFT JOIN from departments to employees). 
Ans:
      select department_name,count(employee_id)
      from dept d left join emp e on e.department_id=d.department_id
      group by department_name

H16. Show employees (name, salary, department_name) in departments 50, 60, 70, ordered by department_name then salary desc.
Ans:
       select first_name,salary,department_name
       from emp e join dept d on e.department_id=d.department_id
       where e.department_id in(50,60,70)
       order by department_name,salary desc

H17. List department_name and average tenure (years) of employees in that department (MONTHS_BETWEEN/12).
Ans:
       select department_name,round(avg(months_between(sysdate,hire_date)/12),1)
       from emp e join dept d on e.department_id=d.department_id
       group by department_name
       
H18. Show employee_id, first_name, last_name, department_name, and number of employees in that department (same count repeated per employee in dept).
Ans:
        SELECT e.employee_id,
       e.first_name,
       e.last_name,
       d.department_name,
       (
         SELECT COUNT(*)
         FROM emp e2
         WHERE e2.department_id = e.department_id
       ) AS emp_count
FROM emp e
JOIN dept d
ON e.department_id = d.department_id;

H19. List departments (department_name) that have more than 2 employees with salary > 5000.
Ans:
        select department_name,count(*)
        from emp e join dept d on e.department_id=d.department_id
        where salary >5000
        group by department_name
        having count(*)>2

H20.  Show first_name, last_name, department_name, and salary as percentage of department total (salary * 100.0 / SUM(salary) OVER (PARTITION BY e.department_id)).
Ans:         
       SELECT e.first_name,
       e.last_name,
       d.department_name,
       ROUND(
           e.salary * 100.0 /
           SUM(e.salary) OVER (PARTITION BY e.department_id),
           2
       ) AS salary_percentage
FROM emp e
JOIN dept d
ON e.department_id = d.department_id;

