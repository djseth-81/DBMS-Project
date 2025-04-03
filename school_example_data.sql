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
