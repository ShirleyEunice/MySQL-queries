create database interview;
use interview;
create table student
(
student_id int primary key,
first_name varchar(200),
last_name varchar(200),
gpa decimal(4,2),
enrollment_date datetime,
major varchar(200)
);
create table program
(
student_ref_id int,
program_name varchar(200),
program_start_date datetime,
foreign key (student_ref_id) references student(student_id)
);
create table scholarship
(
student_ref_id int,
scholarship_amount decimal(10,2),
scholarship_date datetime,
foreign key (student_ref_id) references student(student_id)
);
--------------------------------------------------------------------
INSERT INTO Student (student_id, first_name, last_name, gpa, enrollment_date, major) VALUES
(201, 'Shivansh', 'Mahajan', 8.79, '2021-09-01 09:30:00', 'Computer Science'),
(202, 'Umesh', 'Sharma', 8.44, '2021-09-01 08:30:00', 'Mathematics'),
(203, 'Rakesh', 'Kumar', 5.6, '2021-09-01 10:00:00', 'Biology'),
(204, 'Radha', 'Sharma', 9.2, '2021-09-01 12:45:00', 'Chemistry'),
(205, 'Kush', 'Kumar', 7.85, '2021-09-01 08:30:00', 'Physics'),
(206, 'Prem', 'Chopra', 9.56, '2021-09-01 02:30:00', 'History'),
(207, 'Pankaj', 'Vats', 9.78, '2021-09-01 02:30:00', 'English'),
(208, 'Navleen', 'Kaur', 7.00, '2021-09-01 06:30:00', 'Mathematics');

INSERT INTO Program (student_ref_id, program_name, program_start_date) VALUES
(201, 'Computer Science', '2021-09-01 00:00:00'),
(202, 'Mathematics', '2021-09-01 00:00:00'),
(208, 'Mathematics', '2021-09-01 00:00:00'),
(205, 'Physics', '2021-09-01 00:00:00'),
(204, 'Chemistry', '2021-09-01 00:00:00'),
(207, 'Psychology', '2021-09-01 00:00:00'),
(206, 'History', '2021-09-01 00:00:00'),
(203, 'Biology', '2021-09-01 00:00:00');

INSERT INTO Scholarship (student_ref_id, scholarship_amount, scholarship_date) VALUES
(201, 5000, '2021-10-15 00:00:00'),
(202, 4500, '2022-08-18 00:00:00'),
(203, 3000, '2022-01-25 00:00:00'),
(204, 4000, '2021-10-15 00:00:00');
--------------------------------------------------------------------
/*1. write a SQL query to fetch first_name from the student table in upper case and use alias name as student_name*/
select upper(first_name) as student_name from student;
--------------------------------------------------------------------
/*2. Write a SQL query to fetch unique values of major subjects from student table.*/
select distinct major from student;
--------------------------------------------------------------------
/*3. Write a SQL query to print the first 3 characters of fitst_name from student table*/
select substring(first_name, 1, 3) from student;
--------------------------------------------------------------------
/*4. Write a SQL query to find the position of alphabet ('a') in the first_name column 'Shivansh' from student table*/
select instr(first_name, 'a') from student where first_name='Shivansh';
--------------------------------------------------------------------
/*5. Write a SQL query to fetch unique values of major subjects from student table and print its length*/
select distinct (major), length(major) as Length from student
group by major;
--------------------------------------------------------------------
/*6. Write a SQL query to print first_name from the student table after replacing 'a' with 'A'*/
select replace(first_name, 'a', 'A') from student;
--------------------------------------------------------------------
/*7. Write a SQL query to print the first_name and last_name from student table into single column as complete_name*/
select concat(first_name, ' ', last_name) as complete_name from student;
--------------------------------------------------------------------
/*8. Write a SQL query to print all student details from student table order by first_name ascending and major subject descending*/
select * from student
order by first_name, major desc;
--------------------------------------------------------------------
/*9. Write a SQL query to print details of the students with the first_name as 'Prem' and 'Shivansh' from student table*/
select * from student where first_name in ('Prem', 'Shivansh');
--------------------------------------------------------------------
/*10. Write a SQL query to print details of the student excluding first_name as 'prem and 'shivansh' from student table.*/
select * from student where first_name not in ('Prem', 'Shivansh');
--------------------------------------------------------------------
/*11. Write a SQL query to print details of the students whose first_name ends with a*/
select * from student where first_name like '%a';
--------------------------------------------------------------------
/*12. Write a SQL query to print details of the students whose first_name ends with a and contains five alphabets*/
select * from student where first_name like '____a';
--------------------------------------------------------------------
/*13. Write an SQL query to print details of the students whose GPA lies between 9.00 and 9.99*/
select * from student where gpa between 9.00 and 9.99;
--------------------------------------------------------------------
/*14. Write an SQL query to fetch the count of students having major subject 'Computer Science*/
select major, count(*) as Total
from student
where major = 'Computer Science'
group by major;
--------------------------------------------------------------------
/*15. Write an SQL query to fetch students full name with gpa >=8.5 and <=9.5*/
select concat(first_name, ' ',last_name) as Full_Name from student
where gpa between 8.5 and 9.5;
--------------------------------------------------------------------
/*16. Write an SQL query to fetch the no of students for each major subject in the descending order*/
select major, count(*) as Total from student 
group by major
order by Total desc;
--------------------------------------------------------------------
/*17. Display the details of student who have received scholarships including their names, scholarship amount and scholarship date*/
select concat(student.first_name,' ', student.last_name) as Name,
scholarship.scholarship_amount, scholarship.scholarship_date from student
inner join scholarship on
student.student_id = scholarship.student_ref_id;
--------------------------------------------------------------------
/*18. Write an SQL query to show only odd rows from the student table*/
select * from student where
student_id % 2 != 0;
--------------------------------------------------------------------
/*19. Write an SQL query to show only even rows from the student table*/
select * from student
where student_id % 2 = 0;
--------------------------------------------------------------------
/*20. List all students and their scholarship amounts if they have received any. If a student has not received a scholarship display NULL for the scholarship details*/
select concat(student.first_name,' ', student.last_name) as Name,
scholarship.scholarship_amount from student
left join scholarship on
student.student_id=scholarship.student_ref_id;
--------------------------------------------------------------------
/*21. Write an SQL query to show the top n (say 5) records of student order by descending GPA*/
select * from student
order by gpa desc
limit 5;
--------------------------------------------------------------------
/*22. Write an SQL query to determine the nth(say 5th) highest gpa from a table*/
select * from student 
order by gpa desc limit 4, 1;
--------------------------------------------------------------------
/*23. Write an SQL query to determine the 5th highest gpa without using LIMIT keyword*/
select max(gpa) from student where gpa <
(select max(gpa) from student  where gpa <
(select max(gpa) from student where gpa <
(select max(gpa) from student where gpa <
(select max(gpa) from student))));
--------------------------------------------------------------------
/*24. Write an SQL query to fetch the list of Students with the same gpa*/
select s1.* from student s1, student s2 where s1.gpa = s2.gpa and s1.student_id != s2.student_id;
--------------------------------------------------------------------
/*25. Write an SQL query to show the second highest GPA from a Student table using sub-query*/
select max(gpa) from student where gpa < (select max(gpa) from student);
--------------------------------------------------------------------
/*26. Write an SQL query to show one row twice in results from a table*/
select * from student
UNION ALL
select * from student
order by student_id;
--------------------------------------------------------------------
/*27. Write an SQL query to list student_ID who does not get scholarship*/
select student_id from student
where student_id not in (select student_ref_id from scholarship);
--------------------------------------------------------------------
/*28. Write an SQL query to fetch the first 50% records from a table*/
SELECT * FROM student LIMIT 50;
--------------------------------------------------------------------
/*29. Write an SQL query to fetch the major subject that have less than 4 people in it.*/
select major, count(major) as Number
from student
group by major
having Number < 4;
--------------------------------------------------------------------
/*30. Write an SQL query to show all major subject along with the number of people in there*/
select major, count(major) as Number_of_People
from student
group by major;
--------------------------------------------------------------------
/*31. Write an SQL query to show the last record from the table*/
select * from student where student_id = (select max(student_id) from student);
--------------------------------------------------------------------
/*32. Write an SQL query to show the first row of a table*/
select * from student where student_id = (select min(student_id) from student);
--------------------------------------------------------------------
/*33. Write an SQL query to fetch the last five records from a table*/
select * from (select * from student order by student_id desc limit 5) as subquery order by student_id;
--------------------------------------------------------------------
/*34. Write an SQL query to fetch three max GPA from a table using co-related subqyery*/
select * from student s1 where 3 >= (select count(distinct gpa) from student s2 where s1.gpa <= s2.gpa) order by s1.gpa desc;
--------------------------------------------------------------------
/*35. Write an SQL query to fetch three min gpa from a table using correlated subquery*/
select * from student s1 where 3 >= (select count(distinct gpa) from student s2 where s1.gpa >= s2.gpa) order by s1.gpa;
--------------------------------------------------------------------
/*36. Write an SQL query to fetch nth max gpa from a table*/
select distinct gpa from student s1 where 2 = (select count(distinct gpa) from student s2 where s1.gpa <= s2.gpa) order by s1.gpa desc;
--------------------------------------------------------------------
/*37. Write an SQL query to fetch major students along with the max gpa in each of these major students*/
select major, max(gpa) as Maximum from student 
group by major;
--------------------------------------------------------------------
/*38. Write an SQL query to fetch the names of students who has highest gpa*/
select concat(first_name,' ', last_name) as name, gpa from student where gpa = (select max(gpa) from student);
--------------------------------------------------------------------
/*39. Write an SQL query to show the current date and time*/
select curdate();
select now();
--------------------------------------------------------------------
/*40. Clone the table student*/
create table clone_student as select * from student;
select * from clone_student;
--------------------------------------------------------------------
/*41. Write an SQL query to update the GPA of all students in computer science major subject to 7.5*/
update student set gpa = 7.5 where major = 'Computer Science';
SET SQL_SAFE_UPDATES = 0;
select * from student;
--------------------------------------------------------------------
/*42. Write an SQL query to find the average gpa of each major*/
select major, avg(gpa) as Average
from student
group by major;
--------------------------------------------------------------------
/*43. Write an SQL query to show the top 3 students with highest gpa*/
select * from student order by gpa desc limit 3;
--------------------------------------------------------------------
/*44. Write an SQL query to find the number of students in each major who have a gpa greater than 7.5*/
select major, count(gpa) as Count
from student
where gpa >7.5
group by major;
--------------------------------------------------------------------
/*45. Write an SQL query to find the students who have the same gpa as 'Shivansh Mahajan*/
select * from student where gpa = (select gpa from student where first_name = 'Shivansh' and last_name='Mahajan');
--------------------------------------------------------------------
/*46. */



