delete from studies;
delete from student;
delete from worker;
delete from course;
delete from lecturer;
delete from salaried_employee;
delete from department;
delete from person;
delete from faculty;

delete person from person, student
where person.ID = student.ID and student.GPA < 2.0;

delete course from course
where course.Credit_Hours > 5;

delete person from person
where person.Date_Of_Birth > "2002-01-01";

delete person from studies, person
where person.ID = studies.Student_ID 
and studies.Course_ID = 338;