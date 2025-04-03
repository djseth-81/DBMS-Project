pragma foreign_keys = on;

create table department
(
    department_id INTEGER primary key,
    name          varchar(100) not null,
    building      varchar(50),
    budget        decimal(12, 2),
    constraint unique_dept_name unique (name)
);


create table person
(
    person_id     INTEGER primary key,
    name          varchar(100)        not null,
    email         varchar(100) unique not null,
    street        varchar(100),
    city          varchar(50),
    state         varchar(2),
    zip           varchar(10),
    date_of_birth DATE,
    created_at    datetime default current_timestamp
);


create table personphones
(
    person_id    INTEGER,
    phone_number varchar(15),
    phone_type   varchar(10) check (phone_type in ('HOME',
                                                   'WORK',
                                                   'MOBILE')),
    primary key (person_id,
                 phone_number),
    foreign key (person_id) references person (person_id) on delete cascade
);


create table student
(
    person_id       INTEGER primary key,
    enrollment_year INTEGER not null,
    major           varchar(100),
    status          varchar(20) check (status in ('ACTIVE',
                                                  'GRADUATED',
                                                  'ON_LEAVE',
                                                  'WITHDRAWN')),
    foreign key (person_id) references person (person_id) on delete cascade
);


create table instructor
(
    person_id     INTEGER primary key,
    hire_date     DATE    not null,
    rank          varchar(50) check (rank in ('PROFESSOR',
                                              'ASSOCIATE',
                                              'ASSISTANT',
                                              'ADJUNCT')),
    department_id INTEGER not null,
    foreign key (person_id) references person (person_id) on delete cascade,
    foreign key (department_id) references department (department_id)
);


create table course
(
    course_id     INTEGER primary key,
    code          varchar(10)  not null,
    title         varchar(200) not null,
    description   TEXT,
    credits       INTEGER check (credits > 0),
    department_id INTEGER      not null,
    constraint unique_course_code unique (code),
    foreign key (department_id) references department (department_id)
);


create table onlinecourse
(
    course_id   INTEGER primary key,
    platform    varchar(50) not null,
    url         varchar(200),
    synchronous BOOLEAN default false,
    foreign key (course_id) references course (course_id) on delete cascade
);


create table classroomcourse
(
    course_id    INTEGER primary key,
    building     varchar(50),
    room_number  varchar(10),
    max_capacity INTEGER,
    foreign key (course_id) references course (course_id) on delete cascade
);


create table coursesection
(
    course_id      INTEGER,
    section_number varchar(10),
    semester       varchar(10),
    year           INTEGER,
    instructor_id  INTEGER,
    room_number    varchar(10),
    schedule       TEXT,
    primary key (course_id,
                 section_number,
                 semester,
                 year),
    foreign key (course_id) references course (course_id) on delete cascade,
    foreign key (instructor_id) references instructor (person_id)
);


create table enrollment
(
    student_id      INTEGER,
    course_id       INTEGER,
    section_number  varchar(10),
    semester        varchar(10),
    year            INTEGER,
    enrollment_date DATE not null default current_date,
    status          varchar(20)   default 'ENROLLED' check (status in ('ENROLLED',
                                                                       'DROPPED',
                                                                       'COMPLETED',
                                                                       'WITHDRAWN')),
    primary key (student_id,
                 course_id,
                 section_number,
                 semester,
                 year),
    foreign key (student_id) references student (person_id) on delete cascade,
    foreign key (course_id,
                 section_number,
                 semester,
                 year) references coursesection (course_id, section_number, semester, year) on delete cascade
);


create table assignment
(
    assignment_id  INTEGER primary key,
    course_id      INTEGER,
    section_number varchar(10),
    semester       varchar(10),
    year           INTEGER,
    title          varchar(200) not null,
    description    TEXT,
    due_date       datetime,
    max_points     decimal(5, 2),
    weight         decimal(4, 2),
    foreign key (course_id,
                 section_number,
                 semester,
                 year) references coursesection (course_id, section_number, semester, year) on delete cascade
);


create table grade
(
    student_id      INTEGER,
    assignment_id   INTEGER,
    grade_value     decimal(5, 2) check (grade_value >= 0
        and grade_value <= 100),
    submission_date datetime default current_timestamp,
    feedback        TEXT,
    graded_by       INTEGER,
    primary key (student_id,
                 assignment_id),
    foreign key (student_id) references student (person_id) on delete cascade,
    foreign key (assignment_id) references assignment (assignment_id) on delete cascade,
    foreign key (graded_by) references instructor (person_id)
);


create table prerequisites
(
    course_id INTEGER,
    prereq_id INTEGER,
    primary key (course_id,
                 prereq_id),
    foreign key (course_id) references course (course_id) on delete cascade,
    foreign key (prereq_id) references course (course_id)
);


create table project
(
    project_id     INTEGER primary key,
    title          varchar(200) not null,
    description    TEXT,
    start_date     DATE,
    end_date       DATE,
    funding_amount decimal(12, 2),
    check (end_date > start_date)
);


create table projectsponsor
(
    project_id INTEGER,
    student_id INTEGER,
    instructor_id INTEGER,
    role varchar(50),
    join_date DATE default current_date,
    primary key (project_id,
        student_id,
        instructor_id),
    foreign key (project_id) references project (project_id) on delete cascade,
    foreign key (student_id) references student (person_id) on delete cascade,
    foreign key (instructor_id) references instructor (person_id) on delete cascade
);

create view studentages as
select person_id,
       name,
       date_of_birth,
       (strftime('%Y', 'now') - strftime('%Y', date_of_birth)) -
       (strftime('%m-%d', 'now') < strftime('%m-%d', date_of_birth)) as age
from person;


create view studentgpa as
select s.person_id,
       p.name,
       round(avg(g.grade_value), 2) as gpa
from student s
         join person p on s.person_id = p.person_id
         join grade g on s.person_id = g.student_id
group by s.person_id,
         p.name;


create view departmentstats as
select d.department_id,
       d.name                      as department_name,
       count(distinct c.course_id) as num_courses,
       count(distinct i.person_id) as num_instructors,
       count(distinct s.person_id) as num_students
from department d
         left join course c on d.department_id = c.department_id
         left join instructor i on d.department_id = i.department_id
         left join student s on s.major = d.name
group by d.department_id,
         d.name;

create index idx_enrollment_student on enrollment (student_id);
create index idx_enrollment_course on enrollment (course_id);
create index idx_grade_student on grade (student_id);
create index idx_grade_assignment on grade (assignment_id);
create index idx_course_department on course (department_id);
create index idx_person_email on person (email);
