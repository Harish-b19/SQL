M1. List employees in department_id 80 with salary greater than 8000
   
   select *
   from emp
   where department_id=80 and
         salary>8000

M2. Find employees whose last_name ends with 'n'.
  select *
  from emp
  where last_name like '%n'
M3. List employees hired after January 1, 2005.
  select *
  from emp
  where hire_date > '01/01/2005';
M4. Get employees whose job_id is either 'SA_REP' or 'SA_MAN'.
    select *
    from emp
    where lower(job_id) in('sa_rep','sa_man')
M5. List employees with salary between 4000 and 7000 (inclusive).
      select *
      from emp
      where salary between 4000 and 7000
M6. Find employees who have a manager (manager_id is not null).
      select *
      from emp
      where manager_id is not null
M7. List departments with department_id 10, 20, or 30 from hr.departments.
      select *
      from emp
      where department_id in (10,20,30)
m8. Get the top 3 employees by hire_date (oldest first).
          select *
          from emp
          order by hire_date
          fetch first 3 rows only
M9. List employees in department 50, ordered by last_name ascending
            select *
           from emp
           where department_id=50
           order by last_name
M10. Find employees whose first_name starts with 'J'.
          select *
          from emp
          where lower(first_name) like'j%'
M11. List employees with salary not in the range 5000 to 10000.
            select *
            from emp
            where salary not  between 5000 and 10000;
M12. Get employees whose job_id contains 'CLERK'.
            select *
            from emp
            where lower(job_id)='pu_clerk';
M13. List employees with commission_pct greater than 0.2.
            select *
            from emp
            where commission_pct>0.2
M14. Find the 10 most recently hired employees.
             select *
             from emp
             order by hire_date desc
             fetch first 10 rows only
M15. List employees in departments 50 or 60, ordered by department_id then salary
                select *
                from emp
                where department_id in(50,60)
                order by department_id ,salary
M16. Get employees whose last_name has exactly 5 characters.
                select *
                from emp
                where last_name like '_____';
M17. List departments where manager_id is not null from hr.departments.
                 select *
                 from dept
                 where manager_id is not null;
M18. Find employees with salary >= 10000, ordered by salary ascending
                   select *
                   from emp
                   where salary>=10000
                   order by salary
M19. List employees whose email ends with '.com' or contains 'example' (if applicable; otherwise use a pattern that exists).
                      select *
                      from emp
                      where lower(email) like '%.com%' or
                            lower(email) like '%example%'
M20. Get distinct job_id values from employees in department 50.
                        select distinct job_id
                        from emp
                        where department_id=50
 -------------Hard Questions--------------------------------------------->>
 
 H1. List employees in department 80 with salary > 7000 OR job_id = 'SA_MAN', ordered by salary DESC.
                     select *
                     from emp
                     where department_id=80 and salary>7000 or
                           lower(job_id)='sa_man'
                     order by salary desc;
H2. Find employees hired between Jan 1, 2000 and Dec 31, 2005.
                       select *
                       from emp
                       where to_date(hire_date,'yyyy/mm/dd "T"hh24:mi:ss"Z"') between to_date('2015/01/01','yyyy/mm/dd "T"hh24:mi:ss"Z"') and to_date('2018/12/31','yyyy/mm/dd "T"hh24:mi:ss"Z"')
                       order by hire_date ASC;

H3. List employees whose last_name is 4 characters and starts with 'K'
                        select *
                        from emp
                        where last_name like'K___';
H4. Get top 5 highest-paid employees in department 50 only.
                        select *
                        from emp
                        where department_id=50
                        order by salary desc
                        fetch first 3 rows only;
H5. List employees with no manager and salary > 5000.
                           select *
                           from emp
                           where manager_id is null and
                                 salary>5000
H6. Find employees whose first_name has an 'a' as the second character.
                             select *
                             from emp
                             where first_name like'_a%'
H7. List departments (hr.departments) with department_id between 40 and 90.
                                select *
                                from dept
                                where department_id between 40 and 90;
H8. Get employees with salary < 3000 or salary > 15000, ordered by salary.
                                select *
                                from emp
                                where salary <3000 or salary >15000
                                order by salary
H9. List employees in department 60 with job_id 'IT_PROG', or in department 100 with job_id like 'FI%'.
                                  select *
                                  from emp
                                  where department_id=60 and
                                        job_id='IT_PROG' or 
                                        department_id=100 and
                                        job_id like 'FI%';
H10. Find employees whose hire_date is in the year 2003.
                                         select *
                                         from emp
                                         where to_date(hire_date,'YYYY-MM-DD"T"HH24:MI:SS"Z"')=to_date('2013-06-17T00:00:00Z','YYYY-MM-DD"T"HH24:MI:SS"Z"');
                                         where hire_date like '2013%'
                                           WHERE TO_DATE(SUBSTR(hire_date, 1, 10), 'YYYY-MM-DD')
                                                            BETWEEN DATE '2013-01-01'
                                                                    AND DATE '2013-12-31';


H11. List employees with commission_pct NULL and job_id starting with 'SA'.
                           select *
                           from emp
                           where commission_pct is null and
                                 job_id like 'SA%'
H12. Get the 3 oldest employees (earliest hire_date) in department 90.
                        select *
                        from emp
                        where department_id=90
                        order by hire_date 
                        fetch first 3 rows only
H13. List employees whose last_name does not start with 'A', 'B', or 'C'
                         select *
                         from emp
                         where last_name not like'A%' and
                               last_name not like'B%' and
                               last_name not like'C%' ;         
H14. Find employees with salary in (5000, 6000, 7000, 8000).
                          select *
                          from emp
                          where salary in (5000,6000,7000,8000)
H15. List employees ordered by department_id ASC, then by hire_date DESC within each department.
                            select *
                            from emp
                            order by department_id asc, hire_date desc;
H16. Get employees whose first_name and last_name both start with the same letter
                              select *
                              from emp
                              where substr(first_name,1,1)=substr(last_name,1,1);
H17. List employees with manager_id not null and department_id in (50, 80, 100).
                                  select *
                                  from emp
                                  where manager_id is not null and
                                        department_id in(50,80,100)
H18. Find employees with salary between 3000 and 5000 and job_id containing 'REP'.
                                    select *
                                    from emp
                                    where salary between 3000 and 5000 and 
                                          job_id like '%REP%';
H19. List departments (hr.departments) ordered by department_name descending
                                     select *
                                     from dept
                                     order by department_name desc;
H20. Get employees with hire_date not in 2004 (all years except 2004).
                                    select *
                                    from emp
                                    where substr(hire_date,1,4) not in 2015
                            
















                                  
                                
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
                           


            
























