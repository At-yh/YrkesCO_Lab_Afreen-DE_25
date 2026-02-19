-- 1. Show all classes with their program name
SELECT 
    c.class_id,
    p.program_name,
    c.start_year
FROM yh.class c
JOIN yh.program p
    ON c.program_id = p.program_id;


-- 2. Show all standalone courses
SELECT 
    course_id,
    course_name
FROM yh.course
WHERE is_standalone = TRUE;


-- 3. Show all non-standalone courses
SELECT 
    course_id,
    course_name
FROM yh.course
WHERE is_standalone = FALSE;


-- 4. Count how many courses each class has
SELECT 
    c.class_id,
    COUNT(cc.course_id) AS total_courses
FROM yh.class c
JOIN yh.class_course cc
    ON c.class_id = cc.class_id
GROUP BY c.class_id;


-- 5. Show all facilities and number of classes in each
SELECT 
    f.city_name,
    COUNT(c.class_id) AS total_classes
FROM yh.facility f
LEFT JOIN yh.class c
    ON f.facility_id = c.facility_id
GROUP BY f.city_name;


-- 6. Show consultants and their companies
SELECT 
    e.first_name,
    e.last_name,
    comp.company_name,
    con.hourly_pay
FROM yh.consultant con
JOIN yh.educator e
    ON con.educator_id = e.educator_id
JOIN yh.company comp
    ON con.company_id = comp.company_id;


-- 7. Check how many classes each educational leader manages
SELECT 
    educational_leader_id,
    COUNT(class_id) AS total_classes
FROM yh.class
GROUP BY educational_leader_id;


-- 8. Show each educator with employment type
SELECT 
    e.first_name,
    e.last_name,
    et.type_name AS employment_type
FROM yh.educator e
JOIN yh.employment_type et
    ON e.employment_type_id = et.employment_type_id;