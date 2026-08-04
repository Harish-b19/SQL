
M1. Insert one row into hr_emp_backup with employee_id 990, first_name 'Test', last_name 'User', salary 4000, department_id 50.
insert into emp_back(employee_id,first_name,last_name,salary,department_id)values(990,'Test','User',4000,50);
select * from emp_back where employee_id=990;

M2. Update salary to 6000 for employee_id 990 in hr_emp_backup.
update emp_back set salary=6000 where employee_id=990
select * from emp_back where employee_id=990

M3. Delete the row where employee_id = 990 from hr_emp_backup.
delete from emp_back where employee_id=990

M4. Insert into hr_emp_backup from hr.employees only for department_id 80.
insert into emp_back select * from emp where department_id=80
select * from emp_back where department_id=80

M5. Update first_name to 'Updated' for employee_id 100 in hr_emp_backup.
      update emp_back set employee_id=100
      select * from emp_back where employee_id=100

M6. Delete all rows from hr_emp_backup where department_id = 90.
       delete from emp_back where department_id=90
        select * from emp_back where department_id=90

M7. Insert two rows into hr_emp_backup (e.g. employee_id 991 and 992) using two separate INSERT statements.
       insert into emp_back(employee_id,first_name,last_name,salary,department_id)values
                              (991,'Hari','Ram',9000,103);
       insert into emp_back(employee_id,first_name,last_name,salary,department_id)values                     
                              (992,'Ram','Krish',8000,104);
       select * from emp_back where employee_id in(991,992)

M8. Update salary by 5% for all employees in hr_emp_backup in department 50.
       update emp_back set salary=salary*1.05 where department_id=50

M9. Delete rows from hr_emp_backup where salary is NULL.
      delete from emp_back where salary is null
        select count(*) from emp_back where salary is null
   
M10. Insert into hr_emp_backup from hr.employees where job_id = 'SA_REP' (all columns that exist in backup).
        insert into emp_back  select * from emp where job_id='SA_REP'

M11. Update department_id to 60 for employee_id 100 in hr_emp_backup.
       update emp_back set department_id=60 where employee_id=100
       select * from emp_back where employee_id=100

M12. Delete the single row with employee_id 150 from hr_emp_backup (if it exists).
       delete from emp_back where employee_id=150

M13. Insert one row with employee_id 993, last_name 'Lee', first_name 'Amy', salary 5500, department_id 60.
       insert into emp_back(employee_id,last_name,first_name,salary,department_id)values
                         (993,'Lee','Amy',5500,60);

M14. Update last_name to 'Smith' for all employees in hr_emp_backup with first_name 'John'.
       update emp_back set last_name='Smith'where first_name='John';

M15. Delete rows from hr_emp_backup where hire_date is before 2000.
       delete from emp_back where substr(hire_date,1,4)<2000

M16. Insert from hr.employees where salary between 5000 and 7000 into hr_emp_backup.
       insert into emp_back select * from emp where salary between 5000 and 7000

M17. Update job_id to 'IT_PROG' for one specific employee (e.g. employee_id 200) in hr_emp_backup.
       update emp_back set job_id='IT_PROG' where employee_id=100;

M18. Delete rows from hr_emp_backup where commission_pct is not null.
       delete from emp_back where commission_pct is not null

M19. Insert a row with hire_date = SYSDATE for a new employee in hr_emp_backup.
      insert into emp_back(hire_date)values(sysdate);

M20.Update salary to 10000 for the employee with the highest employee_id in hr_emp_backup (use subquery: WHERE employee_id = (SELECT MAX(employee_id) FROM hr_emp_backup)).
     update emp_back set salary=10000 where employee_id in (select max(employee_id) from emp_back)  

                           <-HARD->
H1. Use MERGE to sync hr_emp_backup with hr.employees: when employee_id matches, update salary and hire_date; when not matched, insert the row from hr.employees.
      Merge into emp_back b using emp e on (b.employee_id= e.employee_id)
      when matched then update set b.salary=e.salary,
                              b.hire_date=e.hire_date
      when not matched then insert (employee_id)values(e.employee_id);

H2. Update hr_emp_backup so that salary equals the salary from hr.employees for the same employee_id (only for employees in department 60)
update emp_back set salary =(select b.salary from emp_back b join emp e on b.salary=e.salary where b.employee_id=60)

H3. Delete from hr_emp_backup all employees who do not exist in hr.employees (e.g. test rows).
  delete from emp_back where employee_id not in(select employee_id from emp) 

H4. Insert into hr_emp_backup only employees from hr.employees whose employee_id is not already in hr_emp_backup (use INSERT ... SELECT ... WHERE NOT EXISTS).
     insert into emp_back  
     select * from emp where employee_id not in( select employee_id from emp)

H5. Update hr_emp_backup: set salary to the average salary of the department (from hr.employees) for that employees department_id.
   update emp_back set salary=(select avg(salary) from emp where department_id=emp_back.department_id)

H6. Delete from hr_emp_backup the single row with the smallest employee_id.
      delete from emp_back where employee_id in(select min(employee_id) from emp_back);

H7. Insert into a backup table one row per department from hr.departments with department_id, department_name, and a column emp_count = 0. Then (separately) update emp_count using a subquery that counts employees per department.
      insert into emp_back (department_id,department_name,emp_count)select department_id,department_name,0 from dept;
      update emp_back b set emp_count =(select count(*) from emp e where e.department_id=b.department_id);

 alter table emp_back add emp_count number(10,2);
  alter table emp_back add department_name varchar(30);
  alter table emp_back modify department_name  varchar(30);

H8. Update hr_emp_backup: set first_name and last_name from hr.employees for the same employee_id where department_id = 50.
      update emp_back b set (first_name,last_name)=(select first_name,last_name from emp e
      where b.employee_id=e.employee_id and
            b.department_id=50)

H9. Delete from hr_emp_backup all rows where the employees salary in hr.employees is less than 3000 (match on employee_id).
   delete from emp_back where employee_id in(select employee_id from emp where salary<3000);

H10. Insert from hr.employees where department_id is in (10, 20, 30) and salary > 5000
     insert into emp_back(department_id,salary,first_name,last_name) select department_id,salary,first_name,last_name from emp where department_id in(10,20,30) and
                               salary >5000

H11. Update hr_emp_backup: set department_id to 50 for all employees whose current department_id is NULL.
update emp_back set department_id=50 where department_id is null

H12. Delete from hr_emp_backup employees who have the same first_name and last_name as another row in hr_emp_backup (keep one; delete duplicates—e.g. keep min(employee_id) per name).
Ans:
delete from emp_back a  where employee_id in(select min(employee_id) from emp_back group by first_name,last_name)and exists
(select 1 from emp_back b where b.first_name=a.first_name and b.last_name=a.last_name 
and b.employee_id<a.employee_id);

H13. MERGE: for rows in hr.employees that exist in hr_emp_backup, update salary; for rows that do not exist, insert. Use department_id 80 only.
Ans:
       merge into emp_back b using(select * from emp where department_id=80)e
       on(e.employee_id=b.employee_id)
       when matched then update set b.salary=e.salary
       when not matched then insert(employee_id, first_name, last_name, salary, department_id)values
       (e.employee_id, e.first_name, e.last_name, e.salary, e.department_id)
       
H14. Update hr_emp_backup so salary is increased by 10% only for employees whose salary in hr.employees is below the company average.
Ans:
             update emp_back set salary=salary*1.10
             where employee_id in (select employee_id from emp where salary<(select avg(salary)from emp))
      
H15. Delete from hr_emp_backup where hire_date is the earliest in the table (only one row).       
Ans:      
delete from emp_back where hire_date =(select min(hire_date)from emp_back)

H16. Insert into hr_emp_backup from hr.employees only for employees who are managers (employee_id in (SELECT manager_id FROM hr.employees)).
Ans:
       insert into emp_back(employee_id,department_id,salary,job_id,hire_date,first_name,last_name )select employee_id,department_id,salary,job_id,hire_date,first_name,last_name
        from emp where employee_id in(select manager_id from emp where manager_id is not null)
  
H17. Update last_name in hr_emp_backup to UPPER(last_name) for all rows.
Ans:
    update emp_back set last_name=upper(last_name)

H18. Delete from hr_emp_backup the top 5 highest salary earners (use subquery with ROWNUM or FETCH)
Ans:
delete from emp_back where employee_id in  (select employee_id from emp_back order by salary desc fetch first 5 rows only)

H19. Insert from hr.employees where job_id like 'SA%' and commission_pct is not null.
Ans:
       insert into emp_back ( employee_id,department_id,salary,job_id,hire_date,first_name,last_name)select employee_id,department_id,salary,job_id,hire_date,first_name,last_name  from emp
      where job_id like 'SA%' and commission_pct is not null

H20. Update hr_emp_backup: set salary to the max salary in the same department (from hr.employees) for each employee.
Ans:
      update emp_back set salary =(select max(salary) from emp where emp_back.department_id=emp.department_id)