select * from course;
select * from department;
select * from faculty;
select * from lecturer;
select * from person;
select * from salaried_employee;
select * from student;
select * from studies;
select * from worker;

select Course_Name, count(*)
from studies, student, course
where student.GPA > 1.5 and studies.Course_ID = course.Course_ID 
and studies.Student_ID = student.ID
group by Course_Name;

select Course_Name, First_Name, Second_Name, person.ID
from studies, student, course, person
where student.GPA > 1.5 and studies.Course_ID = course.Course_ID 
and studies.Student_ID = student.ID and student.ID = person.ID
order by Course_Name;

select distinct person.First_Name, person.Email
from person, lecturer, salaried_employee
where person.ID = salaried_employee.ID
AND lecturer.ID = salaried_employee.ID
AND person.Date_Of_Birth > "1950-11-01";