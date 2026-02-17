#  3NF JUSTIFICATION

## First Normal Form (1NF)

- Each table has a primary key
- No repeating groups or multi-valued attributes
- Each column contains atomic values (The data in a table cell cannot be devided into separate parts)
- No duplicate rows

## Second Normal Form (2NF)

- 1NF is satisfied
- Junction tables (Program_Course, Class_Course, Teacher_Course) contain only foreign keys
- All non-prime attributes are fully dependent on the whole primary key
- No partial dependency exists

## Third Normal Form (3NF)

- 2NF is satisfied
- No transitive dependencies exist
- Sensitive student information is separated into the Student_ID table
- Company information is stored in the Company table, not inside Consultant
- Campus information is stored in the Campus table
- Program details are stored only in the Program table
- Non-prime attributes depend only on their primary key



## Example 1

## Table Student

- student_id (PK)
- first_name
- last_name
- email
- student_identity_id (FK, UNIQUE)
- class_id (FK)

## 3NF Explanation

- student_id uniquely identifies each student
- first_name, last_name, and email depend only on student_id
- Sensitive information (personal number) is stored in Student_ID table
- No transitive dependency exists


## Example 2

## Table Consultant

- consultant_id (PK)
- employment_type
- company_id (FK)

## 3NF Explanation

- consultant_id uniquely identifies each consultant
- employment_type depends only on consultant_id
- Company details are not stored here
- Company data is stored separately in Company table
- No transitive dependency exists


## Example 3

## Table Program

- program_id (PK)
- program_name
- campus_id (FK)
- program_manager_id (FK)

## 3NF Explanation

- program_id uniquely identifies each program
- program_name depends only on program_id
- Campus details are stored in Campus table
- Program manager details are stored in Program_Manager table
- No non-prime attribute depends on another non-prime attribute


## Final Conclusion

The database is normalized to Third Normal Form (3NF) because each table has a primary key, all non-prime attributes depend fully on that key, and no transitive dependencies exist. Data is separated into independent entities (Student, Program, Campus, Company, Consultant, Program_Manager), which prevents redundancy and ensures data integrity.