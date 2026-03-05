CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

insert into students (id,name,age,email)
values (1,'Raju',20,'Raju@gmail.com'),
(2,'Shiba',21,'Shiba@gmail.com'),
(3,'Ravi',22,'Ravi@gmail.com')

select * from students

SELECT name, email
FROM students
ORDER BY age DESC;

select * from students where age > 20


select id , name from students where name LIKE 'R%'

update students set age = 25 where id = 2

select count(id) as total_students from students

select age , count(id) from students group by age

SELECT age, COUNT(id) AS student_count
FROM students
GROUP BY age
HAVING COUNT(id) > 1;

drop table departments

create table departments (
dept_id int primary key,
dept_name varchar(50) not null
)

alter table students add column dept_id int,
add constraint fk_dept FOREIGN key (dept_id)
references departments(dept_id)

INSERT INTO departments (dept_id, dept_name)
VALUES 
(1, 'IT'),
(2, 'HR'),
(3, 'Sales');

select * from students

select * from departments

update students set dept_id =1 where id = 1
update students set dept_id =2 where id = 2

select s.name,s.age,d.dept_name from students s
join departments d on s.dept_id = d.dept_id order by d.dept_name asc

select s.name ,d.dept_name from students s left join 
departments d on s.dept_id = d.dept_id

drop table projects

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    dept_id INT,
    CONSTRAINT fk_dept_project
    FOREIGN KEY (dept_id)
    REFERENCES departments(dept_id)
);

INSERT INTO projects (project_id, project_name, dept_id)
VALUES
(1, 'Website Development', 1),
(2, 'Recruitment Drive', 2),
(3, 'Market Expansion', 3);

select d.dept_name , p.project_name from
departments d join projects p on
d.dept_id = p.dept_id

SELECT s.name, d.dept_name, p.project_name
FROM students s
JOIN departments d 
    ON s.dept_id = d.dept_id
JOIN projects p 
    ON d.dept_id = p.dept_id;

select s.name , d.dept_name ,p.project_name from 
students s left join departments d
on s.dept_id = d.dept_id 
left join projects p on d.dept_id = p.dept_id


select d.dept_name , p.project_name from departments d
Right join projects p on d.dept_id = p.dept_id

select d.dept_name , p.project_name from departments d
full outer join projects p on d.dept_id = p.dept_id

SELECT d.dept_name, p.project_name
FROM departments d
LEFT JOIN projects p 
    ON d.dept_id = p.dept_id

UNION

SELECT d.dept_name, p.project_name
FROM departments d
RIGHT JOIN projects p 
    ON d.dept_id = p.dept_id;

select distinct age from students

SELECT 
    name,
    age,
    CASE
        WHEN age >=22 THEN 'Expert'
		WHEN age >= 20 THEN 'Senior'
        ELSE 'Junior'
    END AS age_category
FROM students;

SELECT *
FROM students
WHERE age > (
    SELECT AVG(age)
    FROM students
);

select * from students where age = (
select max(age) from students
)

select * from students where dept_id = (
select dept_id from departments where dept_name = 'IT'
)

SELECT *
FROM students s
WHERE EXISTS (
    SELECT 1
    FROM departments d
    WHERE d.dept_id = s.dept_id
);

SELECT *
FROM students s
WHERE age < (
    SELECT AVG(age)
    FROM students
    WHERE dept_id = s.dept_id
);

select s.name , s.age,s.dept_id, (
select avg(age) from students where dept_id = s.dept_id
) from students s

select s.name,s.age,s.dept_id,

SELECT 
    s.name, 
    s.age, 
    s.dept_id, 
    a.dept_avg_age
FROM students s
JOIN (
    SELECT dept_id, AVG(age) AS dept_avg_age
    FROM students
    GROUP BY dept_id
) a
ON s.dept_id = a.dept_id;


SELECT d.dept_name, COUNT(s.id) AS total_students
FROM departments d
JOIN students s ON d.dept_id = s.dept_id
GROUP BY d.dept_name
HAVING COUNT(s.id) > 1;


	--------------