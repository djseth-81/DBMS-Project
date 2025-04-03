-- Group Carter Brehm & Seth Johnson
-- Project 1 Phase 2

-- BEGIN EXAMPLE DATA
    
-- Departments (6 tuples)
INSERT INTO department (department_id, name, building, budget) VALUES
                                                                   (1, 'Computer Science', 'Tech Building', 1000000.00),
                                                                   (2, 'Mathematics', 'Science Hall', 750000.00),
                                                                   (3, 'Physics', 'Science Hall', 900000.00),
                                                                   (4, 'English', 'Humanities Center', 600000.00),
                                                                   (5, 'Biology', 'Life Sciences', 800000.00),
                                                                   (6, 'History', 'Old Main', 500000.00);

-- Persons (20 tuples)
INSERT INTO person (person_id, name, email, street, city, state, zip, date_of_birth) VALUES
                                                                                         (1,  'John Doe',         'john.doe@email.com',         '123 Main St',    'Anytown',   'CA', '12345', '1990-05-15'),
                                                                                         (2,  'Jane Smith',       'jane.smith@email.com',       '456 Oak Ave',    'Somewhere', 'NY', '67890', '1988-09-22'),
                                                                                         (3,  'Bob Johnson',      'bob.johnson@email.com',      '789 Pine Rd',    'Nowhere',   'TX', '54321', '1995-03-10'),
                                                                                         (4,  'Alice Brown',      'alice.brown@email.com',      '321 Elm St',     'Everywhere','FL', '98765', '1992-11-30'),
                                                                                         (5,  'Charlie Black',    'charlie.black@email.com',    '111 Cedar Ln',   'Smallville','IL', '11111', '1993-07-21'),
                                                                                         (6,  'Diana White',      'diana.white@email.com',      '222 Maple Dr',   'Bigcity',   'CA', '22222', '1985-02-14'),
                                                                                         (7,  'Evan Green',       'evan.green@email.com',       '333 Birch Rd',   'Anytown',   'TX', '33333', '1996-12-01'),
                                                                                         (8,  'Fiona Orange',     'fiona.orange@email.com',     '444 Spruce St',  'Somewhere', 'NY', '44444', '1994-03-25'),
                                                                                         (9,  'George Purple',    'george.purple@email.com',    '555 Willow Way', 'Anycity',   'WA', '55555', '1991-11-11'),
                                                                                         (10, 'Hannah Gold',      'hannah.gold@email.com',      '666 Aspen Ct',   'Townsville','OR', '66666', '1989-08-08'),
                                                                                         (11, 'Ian Silver',       'ian.silver@email.com',       '777 Cherry Ln',  'Smalltown', 'NV', '77777', '1992-04-17'),
                                                                                         (12, 'Jackie Bronze',    'jackie.bronze@email.com',    '888 Walnut St',  'Bigville',  'CO', '88888', '1990-06-06'),
                                                                                         (13, 'Karen Indigo',     'karen.indigo@email.com',     '999 Redwood Rd', 'Metropolis','CA','99999','1987-01-30'),
                                                                                         (14, 'Larry Lime',       'larry.lime@email.com',       '101 Palm Dr',    'Capitol',   'DC', '10101','1986-05-05'),
                                                                                         (15, 'Monica Magenta',   'monica.magenta@email.com',   '202 Ivy Blvd',   'Midtown',   'NY', '20202','1993-09-09'),
                                                                                         (16, 'Nina Navy',        'nina.navy@email.com',        '303 Oak St',     'Springfield','IL','30303','1994-10-10'),
                                                                                         (17, 'Oscar Olive',      'oscar.olive@email.com',      '404 Elm Ave',    'Gotham',    'NJ', '40404','1988-12-12'),
                                                                                         (18, 'Paula Peach',      'paula.peach@email.com',      '505 Pine St',    'Stars Hollow','CT','50505','1991-03-03'),
                                                                                         (19, 'Quentin Quartz',   'quentin.quartz@email.com',   '606 Maple Ave',  'Riverdale', 'NY', '60606','1989-07-07'),
                                                                                         (20, 'Rachel Ruby',      'rachel.ruby@email.com',      '707 Birch Blvd', 'Hilltown',  'TX', '70707','1990-11-11');

-- Person Phones (12 tuples)
INSERT INTO personphones (person_id, phone_number, phone_type) VALUES
                                                                   (1,  '555-123-4567', 'MOBILE'),
                                                                   (1,  '555-987-6543', 'HOME'),
                                                                   (2,  '555-456-7890', 'WORK'),
                                                                   (3,  '555-789-0123', 'MOBILE'),
                                                                   (4,  '555-234-5678', 'WORK'),
                                                                   (5,  '555-345-6789', 'HOME'),
                                                                   (6,  '555-456-7891', 'MOBILE'),
                                                                   (7,  '555-567-8901', 'HOME'),
                                                                   (8,  '555-678-9012', 'WORK'),
                                                                   (9,  '555-789-0124', 'MOBILE'),
                                                                   (10, '555-890-1234', 'HOME'),
                                                                   (11, '555-901-2345', 'WORK');

-- Students (12 tuples; note that some persons are non‐students)
INSERT INTO student (person_id, enrollment_year, major, status) VALUES
                                                                    (1, 2020, 'Computer Science', 'ACTIVE'),
                                                                    (2, 2019, 'Mathematics', 'ACTIVE'),
                                                                    (3, 2021, 'Physics', 'ACTIVE'),
                                                                    (5, 2022, 'Computer Science', 'ACTIVE'),
                                                                    (7, 2020, 'Biology', 'ACTIVE'),
                                                                    (8, 2018, 'History', 'GRADUATED'),
                                                                    (9, 2021, 'English', 'ACTIVE'),
                                                                    (10, 2020, 'Mathematics', 'ACTIVE'),
                                                                    (11, 2022, 'Physics', 'ON_LEAVE'),
                                                                    (12, 2019, 'Computer Science', 'ACTIVE'),
                                                                    (13, 2020, 'Biology', 'ACTIVE'),
                                                                    (14, 2021, 'History', 'ACTIVE');

-- Instructors (4 tuples)
INSERT INTO instructor (person_id, hire_date, rank, department_id) VALUES
                                                                       (4,  '2015-08-15', 'ASSOCIATE', 1),
                                                                       (6,  '2012-09-01', 'PROFESSOR',  2),
                                                                       (15, '2018-01-10', 'ASSISTANT',  3),
                                                                       (17, '2016-06-20', 'ADJUNCT',    4);

-- Courses (8 tuples)
INSERT INTO course (course_id, code, title, description, credits, department_id) VALUES
                                                                                     (1, 'CS101',   'Introduction to Programming', 'Basic programming concepts', 3, 1),
                                                                                     (2, 'MATH201', 'Calculus I',                  'Limits, derivatives, and integrals', 4, 2),
                                                                                     (3, 'PHYS101', 'General Physics',             'Mechanics and thermodynamics', 4, 3),
                                                                                     (4, 'ENG101',  'English Literature',          'Study of classic literature', 3, 4),
                                                                                     (5, 'BIO101',  'Introductory Biology',        'Foundations of biology', 4, 5),
                                                                                     (6, 'HIST101', 'World History',               'Overview of global historical events', 3, 6),
                                                                                     (7, 'CS201',   'Data Structures',             'Introduction to data structures', 3, 1),
                                                                                     (8, 'MATH301', 'Linear Algebra',              'Matrix theory and applications', 3, 2);

-- Online Courses (4 tuples)
INSERT INTO onlinecourse (course_id, platform, url, synchronous) VALUES
                                                                     (1, 'Zoom',    'https://zoom.us/cs101',       1),
                                                                     (5, 'Teams',   'https://teams.microsoft.com/bio101', 0),
                                                                     (7, 'Google Meet', 'https://meet.google.com/cs201', 1),
                                                                     (8, 'Zoom',    'https://zoom.us/math301',     0);

-- Classroom Courses (4 tuples)
INSERT INTO classroomcourse (course_id, building, room_number, max_capacity) VALUES
                                                                                 (2, 'Science Hall', 'SH101', 30),
                                                                                 (3, 'Science Hall', 'SH201', 25),
                                                                                 (4, 'Humanities Center', 'HC101', 20),
                                                                                 (6, 'Old Main', 'OM201', 35);

-- Course Sections (8 tuples)
INSERT INTO coursesection (course_id, section_number, semester, year, instructor_id, room_number, schedule) VALUES
                                                                                                                (1, 'A', 'Fall', 2023, 4,  'Online', 'Mon,Wed 10:00-11:30'),
                                                                                                                (2, 'B', 'Fall', 2023, 6,  'SH101', 'Tue,Thu 13:00-14:30'),
                                                                                                                (3, 'A', 'Fall', 2023, 15, 'SH201', 'Mon,Wed,Fri 9:00-10:00'),
                                                                                                                (4, 'A', 'Fall', 2023, 17, 'HC101', 'Tue,Thu 10:00-11:30'),
                                                                                                                (5, 'B', 'Spring', 2024, 4,  'Teams', 'Mon,Wed 14:00-15:30'),
                                                                                                                (6, 'A', 'Spring', 2024, 6,  'OM201', 'Tue,Thu 09:00-10:30'),
                                                                                                                (7, 'B', 'Spring', 2024, 15, 'Online', 'Mon,Wed 12:00-13:30'),
                                                                                                                (8, 'A', 'Spring', 2024, 17, 'SH101', 'Fri 10:00-12:00');

-- Enrollments (20 tuples)
INSERT INTO enrollment (student_id, course_id, section_number, semester, year, enrollment_date, status) VALUES
                                                                                                            (1, 1, 'A', 'Fall', 2023, '2023-08-25', 'ENROLLED'),
                                                                                                            (2, 2, 'B', 'Fall', 2023, '2023-08-26', 'ENROLLED'),
                                                                                                            (3, 3, 'A', 'Fall', 2023, '2023-08-27', 'ENROLLED'),
                                                                                                            (5, 7, 'B', 'Spring', 2024, '2024-01-15', 'ENROLLED'),
                                                                                                            (7, 5, 'B', 'Spring', 2024, '2024-01-16', 'ENROLLED'),
                                                                                                            (8, 4, 'A', 'Fall', 2023, '2023-08-28', 'COMPLETED'),
                                                                                                            (9, 6, 'A', 'Spring', 2024, '2024-01-20', 'ENROLLED'),
                                                                                                            (10,2, 'B', 'Fall', 2023, '2023-08-29', 'ENROLLED'),
                                                                                                            (11,3, 'A', 'Fall', 2023, '2023-08-30', 'DROPPED'),
                                                                                                            (12,4, 'A', 'Fall', 2023, '2023-08-31', 'ENROLLED'),
                                                                                                            (13,1, 'A', 'Fall', 2023, '2023-09-01', 'ENROLLED'),
                                                                                                            (14,2, 'B', 'Fall', 2023, '2023-09-02', 'ENROLLED'),
                                                                                                            (1, 7, 'B', 'Spring', 2024, '2024-01-10', 'ENROLLED'),
                                                                                                            (2, 8, 'A', 'Spring', 2024, '2024-01-11', 'ENROLLED'),
                                                                                                            (5, 2, 'B', 'Fall', 2023, '2023-09-03', 'ENROLLED'),
                                                                                                            (7, 3, 'A', 'Fall', 2023, '2023-09-04', 'WITHDRAWN'),
                                                                                                            (8, 5, 'B', 'Spring', 2024, '2024-01-12', 'ENROLLED'),
                                                                                                            (9, 7, 'B', 'Spring', 2024, '2024-01-13', 'ENROLLED'),
                                                                                                            (10,8, 'A', 'Spring', 2024, '2024-01-14', 'ENROLLED'),
                                                                                                            (11,6, 'A', 'Spring', 2024, '2024-01-15', 'ENROLLED');

-- Assignments (10 tuples)
INSERT INTO assignment (assignment_id, course_id, section_number, semester, year, title, description, due_date, max_points, weight) VALUES
                                                                                                                                        (1, 1, 'A', 'Fall', 2023, 'Programming Project 1', 'Create a simple calculator', '2023-10-15 23:59:59', 100.00, 0.25),
                                                                                                                                        (2, 2, 'B', 'Fall', 2023, 'Calculus Midterm', 'Exam covering chapters 1-5', '2023-11-01 14:00:00', 100.00, 0.30),
                                                                                                                                        (3, 3, 'A', 'Fall', 2023, 'Physics Lab Report', 'Write-up of pendulum experiment', '2023-10-30 23:59:59', 50.00, 0.15),
                                                                                                                                        (4, 4, 'A', 'Fall', 2023, 'Essay on Shakespeare', 'Analysis of Hamlet', '2023-10-20 23:59:59', 100.00, 0.20),
                                                                                                                                        (5, 5, 'B', 'Spring', 2024, 'Biology Field Report', 'Field observations', '2024-03-15 23:59:59', 80.00, 0.20),
                                                                                                                                        (6, 6, 'A', 'Spring', 2024, 'History Presentation', 'Presentation on ancient civilizations', '2024-04-01 14:00:00', 90.00, 0.25),
                                                                                                                                        (7, 7, 'B', 'Spring', 2024, 'Data Structures Homework', 'Linked lists and trees', '2024-02-28 23:59:59', 100.00, 0.30),
                                                                                                                                        (8, 8, 'A', 'Spring', 2024, 'Linear Algebra Exam', 'Matrix problem set', '2024-03-05 10:00:00', 100.00, 0.35),
                                                                                                                                        (9, 2, 'B', 'Fall', 2023, 'Calculus Final Exam', 'Comprehensive exam', '2023-12-10 14:00:00', 100.00, 0.40),
                                                                                                                                        (10,3, 'A', 'Fall', 2023, 'Physics Final Lab', 'Final laboratory work', '2023-12-05 23:59:59', 60.00, 0.20);

-- Grades (10 tuples)
INSERT INTO grade (student_id, assignment_id, grade_value, submission_date, feedback, graded_by) VALUES
                                                                                                     (1, 1, 92.50, '2023-10-14 22:30:00', 'Great work!', 4),
                                                                                                     (2, 2, 88.00, '2023-11-01 13:55:00', 'Good effort', 4),
                                                                                                     (3, 3, 45.00, '2023-10-29 23:50:00', 'Need more detail in analysis', 4),
                                                                                                     (5, 7, 95.00, '2024-02-27 22:00:00', 'Excellent job', 15),
                                                                                                     (7, 5, 82.00, '2024-03-14 21:30:00', 'Solid work', 6),
                                                                                                     (8, 4, 77.50, '2023-10-19 20:00:00', 'Well written', 17),
                                                                                                     (9, 6, 85.00, '2024-03-31 19:45:00', 'Good presentation', 6),
                                                                                                     (10,8, 90.00, '2024-03-04 10:15:00', 'Strong understanding', 15),
                                                                                                     (11,9, 87.00, '2023-12-09 13:45:00', 'Good performance', 17),
                                                                                                     (12,10, 78.50, '2023-12-04 22:15:00', 'Satisfactory', 4);

-- Prerequisites (4 tuples)
INSERT INTO prerequisites (course_id, prereq_id) VALUES
                                                     (2, 1),
                                                     (3, 2),
                                                     (7, 1),
                                                     (8, 2);

-- Projects (3 tuples)
INSERT INTO project (project_id, title, description, start_date, end_date, funding_amount) VALUES
                                                                                               (1, 'Research Project', 'Investigating algorithms', '2023-09-01', '2024-05-31', 50000.00),
                                                                                               (2, 'History Documentary', 'Documenting world events', '2023-10-01', '2024-06-30', 30000.00),
                                                                                               (3, 'Biology Research', 'Study on ecosystems', '2024-01-15', '2024-12-15', 45000.00);

-- Project Sponsors (6 tuples)
INSERT INTO projectsponsor (project_id, student_id, instructor_id, role, join_date) VALUES
                                                                                        (1, 1, 4,  'Research Assistant', '2023-09-01'),
                                                                                        (1, 2, 4,  'Data Analyst', '2023-09-15'),
                                                                                        (2, 5, 6,  'Field Reporter', '2023-10-05'),
                                                                                        (2, 7, 6,  'Content Producer', '2023-10-10'),
                                                                                        (3, 9, 15, 'Lab Assistant', '2024-01-20'),
                                                                                        (3, 11,15, 'Data Collector', '2024-01-25');


-- BEGIN EXAMPLE QUERIES

-- list all departments sorted by budget, descending
SELECT department_id, name, building, budget
FROM department
ORDER BY budget DESC;

-- output
-- +-------------+----------------+-----------------+----------+
-- |department_id|name            |building         |budget    |
-- +-------------+----------------+-----------------+----------+
-- |1            |Computer Science|Tech Building    |1000000.00|
-- |3            |Physics         |Science Hall     |900000.00 |
-- |5            |Biology         |Life Sciences    |800000.00 |
-- |2            |Mathematics     |Science Hall     |750000.00 |
-- |4            |English         |Humanities Center|600000.00 |
-- |6            |History         |Old Main         |500000.00 |
-- +-------------+----------------+-----------------+----------+


-- list all persons along with their phone numbers (if any), using a left join
SELECT p.person_id, p.name, ph.phone_number, ph.phone_type
FROM person p
         LEFT JOIN personphones ph ON p.person_id = ph.person_id
ORDER BY p.person_id, ph.phone_type;

-- output
-- +---------+--------------+------------+----------+
-- |person_id|name          |phone_number|phone_type|
-- +---------+--------------+------------+----------+
-- |1        |John Doe      |555-987-6543|HOME      |
-- |1        |John Doe      |555-123-4567|MOBILE    |
-- |2        |Jane Smith    |555-456-7890|WORK      |
-- |3        |Bob Johnson   |555-789-0123|MOBILE    |
-- |4        |Alice Brown   |555-234-5678|WORK      |
-- |5        |Charlie Black |555-345-6789|HOME      |
-- |6        |Diana White   |555-456-7891|MOBILE    |
-- |7        |Evan Green    |555-567-8901|HOME      |
-- |8        |Fiona Orange  |555-678-9012|WORK      |
-- |9        |George Purple |555-789-0124|MOBILE    |
-- |10       |Hannah Gold   |555-890-1234|HOME      |
-- |11       |Ian Silver    |555-901-2345|WORK      |
-- |12       |Jackie Bronze |null        |null      |
-- |13       |Karen Indigo  |null        |null      |
-- |14       |Larry Lime    |null        |null      |
-- |15       |Monica Magenta|null        |null      |
-- |16       |Nina Navy     |null        |null      |
-- |17       |Oscar Olive   |null        |null      |
-- |18       |Paula Peach   |null        |null      |
-- |19       |Quentin Quartz|null        |null      |
-- |20       |Rachel Ruby   |null        |null      |
-- +---------+--------------+------------+----------+


-- list students with their personal details (from person table) and major
SELECT p.person_id, p.name, p.email, s.major, s.enrollment_year, s.status
FROM student s
         JOIN person p ON s.person_id = p.person_id
ORDER BY s.enrollment_year;

-- output
-- +---------+-------------+-----------------------+--------------------+---------------+---------+
-- |person_id|name         |email                  |major               |enrollment_year|status   |
-- +---------+-------------+-----------------------+--------------------+---------------+---------+
-- |8        |Fiona Orange |fiona.orange@email.com |History             |2018           |GRADUATED|
-- |2        |Jane Smith   |jane.smith@email.com   |Mathematics         |2019           |ACTIVE   |
-- |12       |Jackie Bronze|jackie.bronze@email.com|Computer Science    |2019           |ACTIVE   |
-- |1        |John Doe     |john.doe@email.com     |Software Engineering|2020           |ACTIVE   |
-- |7        |Evan Green   |evan.green@email.com   |Biology             |2020           |ACTIVE   |
-- |10       |Hannah Gold  |hannah.gold@email.com  |Mathematics         |2020           |ACTIVE   |
-- |13       |Karen Indigo |karen.indigo@email.com |Biology             |2020           |ACTIVE   |
-- |3        |Bob Johnson  |bob.johnson@email.com  |Physics             |2021           |ACTIVE   |
-- |9        |George Purple|george.purple@email.com|English             |2021           |ACTIVE   |
-- |14       |Larry Lime   |larry.lime@email.com   |History             |2021           |ACTIVE   |
-- |5        |Charlie Black|charlie.black@email.com|Computer Science    |2022           |ACTIVE   |
-- |11       |Ian Silver   |ian.silver@email.com   |Physics             |2022           |ON_LEAVE |
-- +---------+-------------+-----------------------+--------------------+---------------+---------+


-- list instructors with department information
SELECT p.person_id, p.name, i.hire_date, i.rank,
       d.name AS department_name, d.building
FROM instructor i
         JOIN person p ON i.person_id = p.person_id
         JOIN department d ON i.department_id = d.department_id
ORDER BY p.name;

-- output
-- +---------+--------------+----------+---------+----------------+-----------------+
-- |person_id|name          |hire_date |rank     |department_name |building         |
-- +---------+--------------+----------+---------+----------------+-----------------+
-- |4        |Alice Brown   |2015-08-15|ASSOCIATE|Computer Science|Tech Building    |
-- |6        |Diana White   |2012-09-01|PROFESSOR|Mathematics     |Science Hall     |
-- |15       |Monica Magenta|2018-01-10|ASSISTANT|Physics         |Science Hall     |
-- |17       |Oscar Olive   |2016-06-20|ADJUNCT  |English         |Humanities Center|
-- +---------+--------------+----------+---------+----------------+-----------------+


-- show all students, even those without enrollments (outer join)
SELECT p.person_id, p.name, s.major, e.course_id
FROM student s
         JOIN person p ON s.person_id = p.person_id
         LEFT JOIN enrollment e ON s.person_id = e.student_id
ORDER BY p.person_id;

-- output
-- +---------+-------------+--------------------+---------+
-- |person_id|name         |major               |course_id|
-- +---------+-------------+--------------------+---------+
-- |1        |John Doe     |Software Engineering|1        |
-- |1        |John Doe     |Software Engineering|7        |
-- |2        |Jane Smith   |Mathematics         |2        |
-- |2        |Jane Smith   |Mathematics         |8        |
-- |3        |Bob Johnson  |Physics             |3        |
-- |5        |Charlie Black|Computer Science    |2        |
-- |5        |Charlie Black|Computer Science    |7        |
-- |7        |Evan Green   |Biology             |5        |
-- |8        |Fiona Orange |History             |4        |
-- |8        |Fiona Orange |History             |5        |
-- |9        |George Purple|English             |6        |
-- |9        |George Purple|English             |7        |
-- |10       |Hannah Gold  |Mathematics         |2        |
-- |10       |Hannah Gold  |Mathematics         |8        |
-- |11       |Ian Silver   |Physics             |3        |
-- |11       |Ian Silver   |Physics             |6        |
-- |12       |Jackie Bronze|Computer Science    |4        |
-- |13       |Karen Indigo |Biology             |1        |
-- |14       |Larry Lime   |History             |2        |
-- +---------+-------------+--------------------+---------+


-- alias columns showing student name, major and enrollment year
SELECT p.name AS StudentName, s.major AS Major, s.enrollment_year AS EnrollmentYear
FROM student s
         JOIN person p ON s.person_id = p.person_id;

-- output
-- +-------------+--------------------+--------------+
-- |StudentName  |Major               |EnrollmentYear|
-- +-------------+--------------------+--------------+
-- |John Doe     |Software Engineering|2020          |
-- |Jane Smith   |Mathematics         |2019          |
-- |Bob Johnson  |Physics             |2021          |
-- |Charlie Black|Computer Science    |2022          |
-- |Evan Green   |Biology             |2020          |
-- |Fiona Orange |History             |2018          |
-- |George Purple|English             |2021          |
-- |Hannah Gold  |Mathematics         |2020          |
-- |Ian Silver   |Physics             |2022          |
-- |Jackie Bronze|Computer Science    |2019          |
-- |Karen Indigo |Biology             |2020          |
-- |Larry Lime   |History             |2021          |
-- +-------------+--------------------+--------------+


-- aggregate the number of students enrolled in each course section
SELECT course_id, section_number, semester, year, COUNT(student_id) AS num_students
FROM enrollment
GROUP BY course_id, section_number, semester, year
ORDER BY num_students DESC;

-- output
-- +---------+--------------+--------+----+------------+
-- |course_id|section_number|semester|year|num_students|
-- +---------+--------------+--------+----+------------+
-- |2        |B             |Fall    |2023|4           |
-- |7        |B             |Spring  |2024|3           |
-- |1        |A             |Fall    |2023|2           |
-- |3        |A             |Fall    |2023|2           |
-- |4        |A             |Fall    |2023|2           |
-- |5        |B             |Spring  |2024|2           |
-- |6        |A             |Spring  |2024|2           |
-- |8        |A             |Spring  |2024|2           |
-- +---------+--------------+--------+----+------------+


-- aggregate course sections with more than one enrollment.
SELECT course_id, section_number, semester, year, COUNT(student_id) AS enrollment_count
FROM enrollment
GROUP BY course_id, section_number, semester, year
HAVING COUNT(student_id) > 1;

-- output
-- +---------+--------------+--------+----+----------------+
-- |course_id|section_number|semester|year|enrollment_count|
-- +---------+--------------+--------+----+----------------+
-- |1        |A             |Fall    |2023|2               |
-- |2        |B             |Fall    |2023|4               |
-- |3        |A             |Fall    |2023|2               |
-- |4        |A             |Fall    |2023|2               |
-- |5        |B             |Spring  |2024|2               |
-- |6        |A             |Spring  |2024|2               |
-- |7        |B             |Spring  |2024|3               |
-- |8        |A             |Spring  |2024|2               |
-- +---------+--------------+--------+----+----------------+


-- using union, list unique course codes from online courses and classroom courses
SELECT c.code, 'Online' AS Source
FROM course c JOIN onlinecourse oc ON c.course_id = oc.course_id
UNION
SELECT c.code, 'Classroom' AS Source
FROM course c JOIN classroomcourse cc ON c.course_id = cc.course_id;

-- output
-- +-------+---------+
-- |code   |Source   |
-- +-------+---------+
-- |BIO101 |Online   |
-- |CS101  |Online   |
-- |CS201  |Online   |
-- |ENG101 |Classroom|
-- |HIST101|Classroom|
-- |MATH201|Classroom|
-- |MATH301|Online   |
-- |PHYS101|Classroom|
-- +-------+---------+


-- using intersections, show courses that are offered both online and in the classroom
-- in our school system, there are no such courses!
SELECT c.code FROM course c JOIN onlinecourse oc ON c.course_id = oc.course_id
INTERSECT
SELECT c.code FROM course c JOIN classroomcourse cc ON c.course_id = cc.course_id;

-- output
-- +----+
-- |code|
-- +----+


-- using except, list courses offered online that are not offered in a classroom
SELECT c.code FROM course c JOIN onlinecourse oc ON c.course_id = oc.course_id
EXCEPT
SELECT c.code FROM course c JOIN classroomcourse cc ON c.course_id = cc.course_id;

-- output
-- +-------+
-- |code   |
-- +-------+
-- |BIO101 |
-- |CS101  |
-- |CS201  |
-- |MATH301|
-- +-------+

-- using a nested query, list all persons who are not students
SELECT person_id, name, email
FROM person
WHERE person_id NOT IN (SELECT person_id FROM student);

-- output
-- +---------+--------------+------------------------+
-- |person_id|name          |email                   |
-- +---------+--------------+------------------------+
-- |4        |Alice Brown   |alice.brown@email.com   |
-- |6        |Diana White   |diana.white@email.com   |
-- |15       |Monica Magenta|monica.magenta@email.com|
-- |16       |Nina Navy     |nina.navy@email.com     |
-- |17       |Oscar Olive   |oscar.olive@email.com   |
-- |18       |Paula Peach   |paula.peach@email.com   |
-- |19       |Quentin Quartz|quentin.quartz@email.com|
-- |20       |Rachel Ruby   |rachel.ruby@email.com   |
-- +---------+--------------+------------------------+


-- another nested query, also using not exists to show persons with no phone numbers
SELECT p.person_id, p.name
FROM person p
WHERE NOT EXISTS (
    SELECT 1 FROM personphones ph WHERE ph.person_id = p.person_id
);

-- output
-- +---------+--------------+
-- |person_id|name          |
-- +---------+--------------+
-- |12       |Jackie Bronze |
-- |13       |Karen Indigo  |
-- |14       |Larry Lime    |
-- |15       |Monica Magenta|
-- |16       |Nina Navy     |
-- |17       |Oscar Olive   |
-- |18       |Paula Peach   |
-- |19       |Quentin Quartz|
-- |20       |Rachel Ruby   |
-- +---------+--------------+


-- this time, the nested query is in the from clause to show average grade by assignment
SELECT a.title, avg_grd
FROM assignment a,
     (SELECT assignment_id, AVG(grade_value) AS avg_grd
      FROM grade
      GROUP BY assignment_id) AS g
WHERE a.assignment_id = g.assignment_id;

-- output
-- +------------------------+-------+
-- |title                   |avg_grd|
-- +------------------------+-------+
-- |Programming Project 1   |88.75  |
-- |Calculus Midterm        |88     |
-- |Physics Lab Report      |45     |
-- |Essay on Shakespeare    |77.5   |
-- |Biology Field Report    |82     |
-- |History Presentation    |85     |
-- |Data Structures Homework|95     |
-- |Linear Algebra Exam     |90     |
-- |Calculus Final Exam     |87     |
-- |Physics Final Lab       |78.5   |
-- +------------------------+-------+


-- using with, list courses with average grade greater than 80
WITH AvgGrades AS (
    SELECT a.course_id, AVG(g.grade_value) AS avg_grade
    FROM assignment a
             JOIN grade g ON a.assignment_id = g.assignment_id
    GROUP BY a.course_id
)
SELECT c.code, c.title, ag.avg_grade
FROM course c
         JOIN AvgGrades ag ON c.course_id = ag.course_id
WHERE ag.avg_grade > 80;

-- output
-- +-------+---------------------------+---------+
-- |code   |title                      |avg_grade|
-- +-------+---------------------------+---------+
-- |CS101  |Introduction to Programming|88.75    |
-- |MATH201|Calculus I                 |87.5     |
-- |BIO101 |Introductory Biology       |82       |
-- |HIST101|World History              |85       |
-- |CS201  |Data Structures            |95       |
-- |MATH301|Linear Algebra             |90       |
-- +-------+---------------------------+---------+


-- using delete, remove the student's enrollment if they withdrew
DELETE FROM enrollment
WHERE status = 'WITHDRAWN';

-- no output for this one


-- basic update to change a student's major
UPDATE student
SET major = 'Software Engineering'
WHERE person_id = 1;

-- no output for this one


-- select statement into an insertion statement
INSERT INTO grade (student_id, assignment_id, grade_value, submission_date, feedback, graded_by)
SELECT 2, 1, 85.00, datetime('now'), 'Retake improvement', 4
WHERE NOT EXISTS (
    SELECT 1 FROM grade WHERE student_id = 2 AND assignment_id = 1
);

-- no output for this one


-- this one SHOULD fail, testing our constraints on the phone number
INSERT INTO personphones (person_id, phone_number, phone_type)
VALUES (3, '555-000-0000', 'FAX');

-- output:
-- A CHECK constraint failed (CHECK constraint failed: phone_type IN ('HOME', 'WORK', 'MOBILE')


-- enumerate courses and their prereqs
SELECT c.code AS Course, p2.code AS Prerequisite
FROM prerequisites pr
         JOIN course c ON pr.course_id = c.course_id
         JOIN course p2 ON pr.prereq_id = p2.course_id
ORDER BY c.code;

-- output
-- +-------+------------+
-- |Course |Prerequisite|
-- +-------+------------+
-- |CS201  |CS101       |
-- |MATH201|CS101       |
-- |MATH301|MATH201     |
-- |PHYS101|MATH201     |
-- +-------+------------+


-- using group and order by to count enrollments in a course
SELECT c.code, COUNT(e.student_id) AS enrollment_count
FROM enrollment e
         JOIN course c ON e.course_id = c.course_id
GROUP BY c.code
ORDER BY enrollment_count DESC;

-- output
-- +-------+----------------+
-- |code   |enrollment_count|
-- +-------+----------------+
-- |MATH201|4               |
-- |CS201  |3               |
-- |PHYS101|2               |
-- |MATH301|2               |
-- |HIST101|2               |
-- |ENG101 |2               |
-- |CS101  |2               |
-- |BIO101 |2               |
-- +-------+----------------+


-- huge cross-table join to show projects and their student/faculty members
SELECT pjt.project_id, pjt.title, ps.student_id, per.name AS student_name, ps.instructor_id,
       pin.name AS instructor_name, ps.role, ps.join_date
FROM project pjt
         JOIN projectsponsor ps ON pjt.project_id = ps.project_id
         JOIN person per ON ps.student_id = per.person_id
         JOIN person pin ON ps.instructor_id = pin.person_id
ORDER BY pjt.project_id;

-- output
-- +----------+-------------------+----------+-------------+-------------+---------------+------------------+----------+
-- |project_id|title              |student_id|student_name |instructor_id|instructor_name|role              |join_date |
-- +----------+-------------------+----------+-------------+-------------+---------------+------------------+----------+
-- |1         |Research Project   |1         |John Doe     |4            |Alice Brown    |Research Assistant|2023-09-01|
-- |1         |Research Project   |2         |Jane Smith   |4            |Alice Brown    |Data Analyst      |2023-09-15|
-- |2         |History Documentary|5         |Charlie Black|6            |Diana White    |Field Reporter    |2023-10-05|
-- |2         |History Documentary|7         |Evan Green   |6            |Diana White    |Content Producer  |2023-10-10|
-- |3         |Biology Research   |9         |George Purple|15           |Monica Magenta |Lab Assistant     |2024-01-20|
-- |3         |Biology Research   |11        |Ian Silver   |15           |Monica Magenta |Data Collector    |2024-01-25|
-- +----------+-------------------+----------+-------------+-------------+---------------+------------------+----------+


-- using a select query inside the where to prepare an SQL date object
-- this raises the funding on all projects made after that date
UPDATE project
SET funding_amount = funding_amount * 1.10
WHERE start_date > (SELECT DATE('2025-12-31'));

-- no output for this one


-- deletion with nested query, remove any enrollments from persons who are not students
DELETE FROM enrollment
WHERE student_id IN (
    SELECT person_id FROM person
    EXCEPT
    SELECT person_id FROM student
);

-- no output for this one


-- Begin Seth Queries
-- Display all enrolled students that have dropped a class in 2023, but not 2024
select student_id from enrollment where year = 2023 and status="DROPPED"
except
select student_id from enrollment where year = 2024 and status="DROPPED";
-- Output
student_id
----------
11

-- Display names and course codes for students that were enrolled in courses in 2023
select name,code from person natural join course where person_id in (select student_id from enrollment where year=2023 and status="ENROLLED") and course_id in (select student_id from enrollment where year=2023 and status="ENROLLED");
-- Output
name           code   
-------------  -------
John Doe       CS101  
John Doe       MATH201
John Doe       PHYS101
John Doe       BIO101 
Jane Smith     CS101  
Jane Smith     MATH201
Jane Smith     PHYS101
Jane Smith     BIO101 
Bob Johnson    CS101  
Bob Johnson    MATH201
Bob Johnson    PHYS101
Bob Johnson    BIO101 
Charlie Black  CS101  
Charlie Black  MATH201
Charlie Black  PHYS101
Charlie Black  BIO101 
Hannah Gold    CS101  
Hannah Gold    MATH201
Hannah Gold    PHYS101
Hannah Gold    BIO101 
Jackie Bronze  CS101  
Jackie Bronze  MATH201
Jackie Bronze  PHYS101
Jackie Bronze  BIO101 
Karen Indigo   CS101  
Karen Indigo   MATH201
Karen Indigo   PHYS101
Karen Indigo   BIO101 
Larry Lime     CS101  
Larry Lime     MATH201
Larry Lime     PHYS101
Larry Lime     BIO101 

-- List all courses that are listed with codes starting with 'CS'
select title from course where code like 'CS%';
-- Output
title                      
---------------------------
Introduction to Programming
Data Structures

-- verifying unique ID constraint on assignment_id. This should fail
insert into assignment (assignment_id,course_id,section_number,semester,year,title,description,due_date,max_points,weight) VALUES (3,4,'A','Fall',2023,'Literature Final','Comprehensive exam',2023-12-04,100,0.3);
-- Output
Runtime error: UNIQUE constraint failed: assignment.assignment_id (19)

-- Displaying the courses that John Doe has is enrolled in
select code,title from course where course_id in(select course_id from enrollment where student_id in (select person_id from person where name="John Doe" and status="ENROLLED"));
-- Output
code   title                      
-----  ---------------------------
CS101  Introduction to Programming
CS201  Data Structures

-- Remove departments with no instructors. Should remove Biology and History
delete from department where name in (select department_name from departmentstats where num_instructors = 0);
select * from deparment;
-- output
department_id  name              building           budget 
-------------  ----------------  -----------------  -------
1              Computer Science  Tech Building      1000000
2              Mathematics       Science Hall       750000 
3              Physics           Science Hall       899999 
4              English           Humanities Center  600000 
