JOIN CONCEPT IN SQL
-- JOINS
-- join is used to combine rows from two or more table based on a related column
use abc;
select * from student;
create table courses(course_id int,
					 course_name varchar(20),
                     roll_no int );
select * from courses;
alter table student 
change id roll_no int;
-- student (roll_no,name,age,marks,department)
-- course(course_id,course_name,roll_no)
insert into courses values (101,'Python',1),
						   (102,'SQL',2),
                           (103,'AI',3),
                           (104,'Java',5);
                           
-- types of joins
-- INNER JOIN(Returns only matching rows from both the tables)
-- show student with courses
select student.name,courses.course_name
from student
inner join courses
on student.roll_no = courses.roll_no;

-- show courses with roll no
select c.course_name, s.roll_no
from student s
inner join courses c
on s.roll_no = c.roll_no;

-- show students with their courses only from cs department
select s.name , c.course_name
from student s
inner join courses c
on s.roll_no = c.roll_no
where s.department = 'CS';

-- show students with marks greater than 80 and there courses
select s.name , s.marks , c.course_name
from student s
inner join courses c
on s.roll_no = c.roll_no
where s.marks>80;

-- show student names and courses sorted by marks desc
select s.name , s.marks , c.course_name
from student s
inner join courses c
on s.roll_no = c.roll_no
order by s.marks desc;

-- count the number of students per course
select c.course_name , count(*) as total_student
from student s
inner join courses c 
on s.roll_no = c.roll_no
group by c.course_name ;

-- show courses where average marks>80
select c.course_name , avg(s.marks) as avg_marks
from student s 
inner join courses c 
on s.roll_no = c.roll_no
group by c.course_name 
having avg_marks >80;

-- show highest scoring student in each course
select s.name , c.course_name, max(s.marks) as highest_mark
from student s 
inner join courses c 
on s.roll_no = c.roll_no
group by c.course_name;

-- show students enrolled in sql course
select s.name, c.course_name
from student s 
inner join courses c 
on s.roll_no = c.roll_no
where c.course_name = 'SQL';

--  show  students with course and marks>85
select s.name,s.marks,s.department,c.course_name
from student s 
inner join courses c 
on s.roll_no = c.roll_no
where s.marks > 85 ; 
