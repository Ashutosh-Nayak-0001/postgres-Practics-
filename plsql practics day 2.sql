------------------------------------section 1---------------------------------------------------

1-select concat(first_name ,' ', last_name) as name , salary from employees

2-select * from employees where salary > 50000 and department = 'IT'

3- select * from employees order by salary asc --desc

4 - select * from employees limit 5;

5 - select * from employees where salary between 40000 and 80000;

6 - select * from employees where first_name LIKE 'A%';

7 - select * from employees where first_name LIKE '%n';

8 - select * from employees where first_name LIKE '%ra%'

9 - select * from employees where phone is not null;

10 - select count(emp_id) as total_employee from employees 

11 - select round(avg(salary)) from employees;

12 - select sum(salary) from employees;

13 - select distinct department from employees;

14 - select * from employees where salary != 60000;

15 - select * from employees order by first_name ;

16 - select * from employees where salary > 
 (
select avg(salary) from employees
 );

 17 - select * from employees where salary in (40000,50000,70000);

 18 - select * from employees where department != 'IT';

 19 - select * from employees where salary > 70000 and department = 'IT';

 -----------------------------section 2 ------------------------------------------------

 1 - select department, count(emp_id) from employees group by department;

 2- select department , round(avg(salary)) from employees group by department;

 3- select department , max(salary) from employees group by department;

 4 - select department , min(salary) from employees group by department;

 5 - select department , round(sum(salary)) from employees group by department;

 6 - select department ,employees from (
select department , count(emp_id) as employees from 
employees group by department
 ) where employees > 2;

 7 - select department , average_salary from (
 select department, avg(salary) as average_salary from
 employees group by department
 )  where average_salary > 60000;

 8 - select department , sum(salary) as total from employees group by department order by total desc limit 1 ;

 9 - select department , avg(salary) as average_salary
 from employees group by department order by average_salary
 asc limit 1;

 10 - select department , count(emp_id) as employee_count
 from employees group by department order by employee_count desc limit 1;

 11 - select first_name ,(
select department from employees group by department
 ) as department,(
select job_title from employees group by job_title
 ) as job_title from employees

 12 - select job_title , count(emp_id) from employees 
   group by job_title;

   13 -select department ,role from (
select department,count(job_title) as role from employees 
 group by department
   ) where role > 2;

   14 - 
  select department , count(emp_id) from employees 
  where salary > 50000 group by department 

   15 - select department , count(emp_id) as emp_count
   from employees
   group by department order by emp_count desc

   16 - 