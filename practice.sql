create database abc;
show databases;
use abc;
create table student(id int PRIMARY KEY,
					name varchar(20),
                    age int,
                    marks int,
                    department varchar(30)
                    );
insert into student values
            (1, 'Rakhi',20,85,'CS'),
            (2, 'Amit',21,85,'IT'),
            (3, 'Neha',19,78,'CS'),
            (4, 'Rahul',22,90,'ECE'),
            (5, 'Bicky',22,95,'ECE');
select * from student;
select name , marks from student;
-- where
select * from student where marks > 90;
-- and /or
select * from student where department = 'CS' and marks >80;
 -- order by
 select * from student order by marks desc;
 select * from student order by marks asc;
 -- insert
 insert into student values (6, 'Soumya',21,84,'IT');
 -- update command
 -- syntax update tablename set columnname= value where columnname = value
 update student 
 set marks = 75
 where id = 4 ;
 -- delete data 
 delete from student 
 where id = 6 ;
 -- Functions ( COUNT, AVG, MAX)
 -- count is used to count the number of rows in a table
 select count(*) from student;
 -- average is used to calculate the average of the column
 select avg(marks) from student;
 -- max gives maximum value of a column
 select max(marks) from student;
 -- min function is used to give minimum value of a column
 select min(marks) from student;
 
 -- GROUP BY is used to make groups of same value and then apply functions like count, max,min,avg,sum
--  it is used with aggregate functions
-- syntax- select column_name,
		-- aggregete_function(column_name)
        -- from table_name
        -- group by column_name;
-- find the average marks by department?
select department, avg(marks)
from student
group by department; 

-- count the total student in each department
select department, count(*)
from student 
group by department;
-- find highest marks ineach department
select department, max(marks)
from student
group by department;
-- count student older than 20 in each department
select department, count(*)
from student
where age>20
group by department;
-- find total marks of each department
select department, sum(marks)
from student
group by department;

-- group by having 
-- having is used to filter groups
-- it is used with group by

-- find department having more than 1 student
select department, count(*)
from student
group by department
having count(*)>1;
-- find departments where average marks >80
select department, avg(marks)
from student 
group by department
having avg(marks)>80;
-- count students ineach department and sort by count desc
select department, count(*) as total
from student
group by department
order by total desc;
-- find average marks of department but show only CS and IT
select department , avg(marks)
from student
where department in ('CS', 'IT')
group by department ;


  -- TCL COMMANDS
use abc;
set autocommit = 0;

create table college(roll_no int primary key , name varchar(25) , age int);
drop table college;
select * from college;

insert into college values(1,'Ravi',20);
commit;
-- Ravi is saved permanently we can't rollback

insert into college values(2,'Anita',19);
rollback;
-- Anita will not saved

insert into college values(3,'Rahul',23);
savepoint sp1;
update college set age = 20 where roll_no = 3;
rollback to sp1;

select * from student;

-- PRACTICE(ALTER TABLE)
-- Add a new column email of type varchar(50)
alter table student add email varchar(50);

-- Rename column name to student_name
alter table student rename column name to student_name; 

-- change datatype of marks
alter table student modify marks decimal(5,2);
alter table student modify marks int;

-- drop column email
alter table student drop column email;

-- rename table student to students
alter table student rename to students;
alter table students rename to student;

 -- increase size of department column
 alter table student 
 modify department varchar(30);
 
 -- Add phone column with unique constraint
 alter table student add phone varchar(15) unique;
 
 
 -- UPDATE TABLE 
 -- update marks of student with id 1
 update student set marks = 99
 where roll_no = 1;

select*from student ;

-- change name of student where id 4
update student set student_name = 'Bicky'
where roll_no = 4;
