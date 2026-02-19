-- Program Table

CREATE TABLE program (
    program_id SERIAL PRIMARY KEY,
    program_name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Course Table

CREATE TABLE course (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INTEGER NOT NULL,
    description TEXT,
    is_standalone BOOLEAN DEFAULT FALSE
);

-- Facility (Campus)

CREATE TABLE facility (
    facility_id SERIAL PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL,
    address TEXT NOT NULL
);

-- Personal Data

CREATE TABLE personal_data (
    personal_data_id SERIAL PRIMARY KEY,
    personal_number VARCHAR(12) NOT NULL,
    date_of_birth DATE NOT NULL,
    address TEXT NOT NULL
);

-- Educational Leader

CREATE TABLE educational_leader (
    educational_leader_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    personal_data_id INTEGER,
    FOREIGN KEY (personal_data_id)
        REFERENCES personal_data(personal_data_id)
);

-- Class Table

CREATE TABLE class (
    class_id SERIAL PRIMARY KEY,
    program_id INTEGER,
    educational_leader_id INTEGER,
    facility_id INTEGER,
    start_year DATE,
    FOREIGN KEY (program_id)
        REFERENCES program(program_id),
    FOREIGN KEY (educational_leader_id)
        REFERENCES educational_leader(educational_leader_id),
    FOREIGN KEY (facility_id)
        REFERENCES facility(facility_id)
);

-- Employment Type

CREATE TABLE employment_type (
    employment_type_id SERIAL PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL
);

-- Educator Table

CREATE TABLE educator (
    educator_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    employment_type_id INTEGER,
    personal_data_id INTEGER,
    FOREIGN KEY (employment_type_id)
        REFERENCES employment_type(employment_type_id),
    FOREIGN KEY (personal_data_id)
        REFERENCES personal_data(personal_data_id)
);

-- Student Table

CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    personal_data_id INTEGER,
    class_id INTEGER,
    FOREIGN KEY (personal_data_id)
        REFERENCES personal_data(personal_data_id),
    FOREIGN KEY (class_id)
        REFERENCES class(class_id)
);

-- Company Table

CREATE TABLE company (
    company_id SERIAL PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    organization_nr VARCHAR(20) NOT NULL,
    f_tax BOOLEAN,
    address TEXT
);

-- Consultant Table

CREATE TABLE consultant (
    consultant_id SERIAL PRIMARY KEY,
    educator_id INTEGER,
    company_id INTEGER,
    hourly_pay INTEGER,
    FOREIGN KEY (educator_id)
        REFERENCES educator(educator_id),
    FOREIGN KEY (company_id)
        REFERENCES company(company_id)
);


-- Junction Tables

-- Program and Course (Many to Many)
CREATE TABLE program_course (
    program_id INTEGER,
    course_id INTEGER,
    PRIMARY KEY (program_id, course_id),
    FOREIGN KEY (program_id)
        REFERENCES program(program_id),
    FOREIGN KEY (course_id)
        REFERENCES course(course_id)
);

-- Class and Course (Many to Many)
CREATE TABLE class_course (
    class_id INTEGER,
    course_id INTEGER,
    PRIMARY KEY (class_id, course_id),
    FOREIGN KEY (class_id)
        REFERENCES class(class_id),
    FOREIGN KEY (course_id)
        REFERENCES course(course_id)
);

-- Educator and Course (Many to Many)
CREATE TABLE educator_course (
    educator_id INTEGER,
    course_id INTEGER,
    PRIMARY KEY (educator_id, course_id),
    FOREIGN KEY (educator_id)
        REFERENCES educator(educator_id),
    FOREIGN KEY (course_id)
        REFERENCES course(course_id)
);