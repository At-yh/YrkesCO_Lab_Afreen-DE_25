# Logical data model with many to many Junction Tables by following Conceptual model 

## Program - Course
->  Program - ProgramCourse
- A Program is associated with one or many ProgramCourses
- A ProgramCourse belongs to one & only one Program


->  Course - ProgramCourse
- A Course may be associated with zero or many ProgramCourse
- A ProgramCourse belongs to one & only one Course


## Class - Course
->  Class - ClassCourse
- A Class is associated with one or many ClassCourses
- A ClassCourse belongs to one and only one Class

->   Course – ClassCourse

- A Course may be associated with zero or many ClassCourses

- A ClassCourse belongs to one and only one Course


## Educator - Course
->  Educator - EducatorCourse
- An Educator is associated with one or many Educator Courses
- An EducatorCourse belongs to one and only one Educator

->   Course – EducatorCourse

- A Course is associated with one or many EducatorCourses

- An EducatorCourse belongs to one and only one Course