select Course_Name, count(*)
from studies, student, course
where student.GPA > 1.5 and studies.Course_ID = course.Course_ID 
and studies.Student_ID = student.ID
group by Course_Name;

select Course_Name, First_Name, Second_Name, person.ID
from studies, student, course, person
where student.GPA > 1.5 and studies.Course_ID = course.Course_ID 
and studies.Student_ID = student.ID and student.ID = person.ID
group by Course_Name