#  Relationship  Statements

## Student & Student ID
- A Student has particular one Student ID (sensitive info)
- A Student ID belongs to one Student
(1 : 1)


## Student & Class
- A Student enrolls in exactly one class.
- A class has many students.
(1 : many)


## Program & Class
- A program creates exactly three classes.
- A class belongs to exactly one Program.
(3 : 1)


## Program & Course
- A Program contains many Courses
- A Course belongs to exactly one Program.
(many : 1)


## Class & Course
- A Class includes many Courses.
- A Course can be included in many Classes.
(many : many)


## Class & Program Manager
- A Class is manage by only one Program Manager.
- A Program Manager manages many classes.
(1 : many)


## Program Manager & Campus
- A Program Manager works exactly one Campus.
- A Campus employs many Program Managers.
(1 : many)


## Class & Campus
- A Class is held at one Campus.
- A Campus hosts many Classes.
(1 : many)


## Teacher & Course
- A Teacher can teach many Courses.
- A Course can be taught by many Teachers.
(many : many)


## Teacher & Campus
- A Teacher works at one Campus.
- A Campus employs many Teachers.
(1 : many)


## Consultant & Company
- A Consultant works  for one Company.
- A Company can have many Consultants.
(1 : many)


## Teacher & Consultant
- A Teacher may be a Consultant.
- A Consultant must be one Teacher.
(1 : 1)
