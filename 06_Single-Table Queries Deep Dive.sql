M1. Show employee_id, first_name, and LENGTH(last_name) as last_name_length
Ans:
select employee_id,first_name,length(last_name)as last_name_length
from emp

M2. List employees hired in 2004 using EXTRACT(YEAR FROM hire_date)
Ans:
select *
from emp
where substr(hire_date,1,4)=2004

M3. Add a column job_type: 'Sales' if job_id like 'SA%', else 'Other'. Use CASE.
Ans:
select e.*,
    case when job_id like'SA%'Then'Sales'
     else 'other' End as job_type
from emp e;

M4. Show first_name, last_name, and tenure in months (MONTHS_BETWEEN(SYSDATE, hire_date))
Ans:
select first_name,last_name,round(months_between(sysdate,to_date(hire_dates,'yyyy-mm-dd"T"hh24:mi:ss"Z"')),2) tenure
from emp;

M5. List employees with salary between 4000 and 8000 and department_id 50 or 60. Use parentheses.
Ans:
         select *
         from  emp
         where salary between 4000 and 8000 and
               department_id in(50,60);

M6. Display employee_id, salary, and salary_level: 'Tier1' if salary < 5000, 'Tier2' if < 10000, else 'Tier3'.
Ans:
            select employee_id,salary,
                   case when salary<5000 then 'tier1'
                        when salary<1000 then 'tier2'
                        else 'tier3'
                        end as salary_level
             from emp;

M7. Show last_name and INITCAP(last_name)
Ans:                        
           select last_name,initcap(last_name) name
           from emp

M8. List employees where department_id is in the set (10, 20, 30) from hr.departments (use subquery IN).
Ans:             select * from emp where department_id in(select department_id from emp
                                                         where department_id in(10,20,30))
                                                        
M9. Add column hire_month as EXTRACT(MONTH FROM hire_date).
 Ans:     select extract(month from to_date(hire_dates,'yyyy,mm,dd"T"hh24:mi:ss"Z'))as month from emp;

M10. Show phone_number and COALESCE(phone_number, 'No Phone').
Ans:
              select phone_number,coalesce(phone_number,'no phone') from emp

M11. List employees with (department_id = 50 AND salary > 5000) OR (department_id = 60).
Ans:
                select *
                from emp
                where (department_id=50 and salary>5000 )or
                      department_id=60
M12. Display hire_date and ADD_MONTHS(hire_date, 12) as one_year_later.
Ans:
                    select hire_dates,Add_months(to_date(hire_dates,'yyyy-mm-dd"t"hh24:mi:ss"Z"'),12) as year from emp

M13. Show first_name, last_name, and SUBSTR(first_name, 1, 1) || SUBSTR(last_name, 1, 1) as initials.
Ans:
              select first_name,last_name,substr(first_name,1,1)||substr(last_name,1,1) as initials
              from emp

 M14.List employees hired after 2006-01-01
Ans:               
                      select *
                      from emp
                      where substr(hire_dates,1,4)>2016;

M15. Add column has_commission: 'Yes' if commission_pct is not null, 'No' otherwise. Use NVL2 or CASE.
Ans:
                            select e.*,nvl2(commission_pct,'yes','no')
                            from emp e

M16. Show salary and ROUND(salary, -2) (rounded to nearest hundred).
Ans:
                             select salary,round(salary,-2) from emp                                

M17. List employees where job_id is SA_REP or SA_MAN and salary > 8000.
Ans:
                      select *
                      from emp
                      where job_id in('SA_REP','SA_MAN') and
                            salary>8000

M18. Display employee_id, hire_date, and TRUNC(hire_date) (same day at midnight).
Ans:
                select employee_id,to_char(to_date(hire_dates,'YYYY-MM-DD"T"HH24:MI:SS"Z"'),'DD-MON-YYYY HH24:MI:SS')as hire,TRUNC(to_date(hire_dates,'YYYY-MM-DD"T"HH24:MI:SS"Z"')) as hire
                from emp

M19. Show last_name and LOWER(last_name)
Ans:
       select last_name,lower(last_name) from emp

M20. List employees with tenure (MONTHS_BETWEEN/12) >= 10 years.
Ans:
        select *
        from emp
        where months_between(sysdate,to_date(hire_dates,'yyyy-mm-dd"t"hh24:mi:ss"z"'))/12>=10

                         <-HARD->

H1. Show employee_id, salary, and a band: 'A' if salary in top 25%, 'B' if next 25%, etc. Use NTILE(4) over salary order or CASE with subquery for percentiles.
Ans:
        select employee_id,salary,
               case ntile(4) over (order by salary desc)
                    when 1 then 'A'
                    when 2 then 'B'
                    when 3 then 'C'
                    when 4 then 'D'
                    else 'invalid'
             End as band from emp;

H2. List employees whose hire_date is in the same year as their managers hire_date (need self-join on manager_id; compare EXTRACT(YEAR FROM e.hire_date) = EXTRACT(YEAR FROM m.hire_date)).
Ans:          self join
        select e.hire_dates,m.hire_dates
        from emp e join emp m on e.employee_id=m.manager_id
        where substr(e.hire_dates,1,4)= substr(m.hire_dates,1,4)
        
H3. Add column salary_vs_avg: (salary - (SELECT AVG(salary) FROM hr.employees)). Round to 2 decimals.
Ans:         
                   select salary,salary-round((select avg(salary) from emp),2)as average from emp            

H4. List employees with exactly 5 characters in first_name
Ans:
              select first_name from emp
              where length(first_name)=5;

H5. Show first_name, last_name, and full_name with last_name first: last_name || ', ' || first_name.
Ans:
               select first_name,last_name ,last_name||','||first_name
               from emp

H6. For each employee show hire_date and the day of week (use TO_CHAR(hire_date, 'Day') or similar).
 Ans:
                 select first_name,hire_dates,to_char(to_date(hire_dates,'yyyy,mm,dd"t"hh24:mi:ss"z"'),'day') d from emp 

H7. List employees where department_id is in (SELECT department_id FROM hr.departments).
Ans:
               select *
               from emp
               where department_id in (select department_id from dept)

H8. Add column years_until_10: years until 10 years tenure (10 - tenure_years), only for people with < 10 years.
Ans:
            select employee_id,round(months_between(sysdate,to_char(to_date(hire_dates,'yyyy-mm-dd"t"hh24:mi:ss"z"')))/12,2) as tenure ,
            10-round(months_between(sysdate,to_char(to_date(hire_dates,'yyyy-mm-dd"t"hh24:mi:ss"z"')))/12,2) as tenure_want
            from emp
            where round(months_between(sysdate,to_char(to_date(hire_dates,'yyyy-mm-dd"t"hh24:mi:ss"z"')))/12,1)<10;

H9. Show salary and commission_pct and total_comp as salary + salary*NVL(commission_pct,0), rounded to 2 decimals.
Ans:
          select salary,commission_pct,round(salary+salary*nvl(commission_pct,0),2) as tl
          from emp

H10. List employees hired on the first day of any month (EXTRACT(DAY FROM hire_date) = 1).
Ans:
          select employee_id
          from emp
          where extract(day from to_date(hire_dates,'yyyy-mm-dd"t"hh24:mi:ss"z"'))=1;

H11. Display employee_id, salary, and salary rank within department (use RANK() OVER (PARTITION BY department_id ORDER BY salary DESC)).
Ans:

H12. List employees whose last_name contains the letter 'a' at least twice.
Ans:
         select last_name
         from emp
         where length(last_name)-length(replace(lower(last_name),'a'))>=2

H13. Show hire_date and LAST_DAY(hire_date) (last day of that month).
Ans:
               select last_day(hire_date) as month from emp
                  select to_char(trunc(sysdate,'yyyy'),'dd-mon-yyyy') from dual
                   select to_char(sysdate,'dd-mm-yyyy') from dual

H14. Add column comp_category: 'Salary only' if commission_pct is null, 'Salary+Commission' otherwise.
Ans:
             select employee_id,
                   case when commission_pct is null then 'salary only'
                        else 'salary+commission'
                    end sal
            from emp

H15. List employees with tenure (years) between 5 and 15.
Ans:
            select *
            from emp
            where round( months_between(sysdate,hire_date)/12,1)between 5 and 15;

H16. Show first_name reversed (use REVERSE or loop in PL/SQL; in Oracle no REVERSE—use SUBSTR in a custom way or simple: list as-is and add a note). For Oracle use: list first_name and perhaps SUBSTR from end
Ans:
            select first_name,reverse(first_name) reverse from emp

H17. List employees where department_id exists in hr.departments and salary > (SELECT AVG(salary) FROM hr.employees).
Ans:
                select employee_id,department_id,round(salary-(select avg(salary)from emp),1) average
                from emp
                where department_id in (select department_id from dept ) and
                      salary >(select avg(salary) from emp);

H18. Display salary and salary with 15% bonus: salary * 1.15.
Ans:
         select salary,salary*1.15 bonus from emp

H19. Add column hire_decade: '2000s' if hire_date in 2000-2009, '1990s' if 1990-1999, else 'Other'.
Ans:  those years not avail
          select employee_id,
                case when extract(year from hire_date) between 2011 and 2015 then '2000'
                     when extract(year from hire_date) between 2016 and 2018 then '1990'
                     else 'other'
                end range
          from emp;

H20. List employees with first_name starting with 'A' or 'B' and salary > 6000.
Ans:
       select first_name,salary
       from emp
       where lower(first_name) like 'a%' or
              lower(first_name) like 'b%' and
              salary>=6000
             