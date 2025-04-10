# align to common types pulling entities from the DB
from typing import List, Dict, Any, Optional, Tuple, TypedDict, Literal, Union

class Department(TypedDict):
    department_id: int
    name: str
    building: Optional[str]
    budget: Optional[float]

class Person(TypedDict):
    person_id: int
    name: str
    email: str
    street: Optional[str]
    city: Optional[str]
    state: Optional[str]
    zip: Optional[str]
    date_of_birth: Optional[str] # Assuming YYYY-MM-DD string format
    created_at: Optional[str] # Assuming ISO format string

class PersonPhone(TypedDict):
    person_id: int
    phone_number: str
    phone_type: Optional[Literal['HOME', 'WORK', 'MOBILE']]

class Student(TypedDict):
    person_id: int
    enrollment_year: int
    major: Optional[str]
    status: Optional[Literal['ACTIVE', 'GRADUATED', 'ON_LEAVE', 'WITHDRAWN']]

class Instructor(TypedDict):
    person_id: int
    hire_date: str # Assuming YYYY-MM-DD string format
    rank: Optional[Literal['PROFESSOR', 'ASSOCIATE', 'ASSISTANT', 'ADJUNCT']]
    department_id: int

class Course(TypedDict):
    course_id: int
    code: str
    title: str
    description: Optional[str]
    credits: Optional[int]
    department_id: int

class OnlineCourse(TypedDict):
    course_id: int
    platform: str
    url: Optional[str]
    synchronous: Optional[int] # SQLite uses 0/1 for BOOLEAN

class ClassroomCourse(TypedDict):
    course_id: int
    building: Optional[str]
    room_number: Optional[str]
    max_capacity: Optional[int]

class CourseSection(TypedDict):
    course_id: int
    section_number: str
    semester: str
    year: int
    instructor_id: Optional[int]
    room_number: Optional[str]
    schedule: Optional[str]

class Enrollment(TypedDict):
    student_id: int
    course_id: int
    section_number: str
    semester: str
    year: int
    enrollment_date: str # Assuming YYYY-MM-DD string format
    status: Optional[Literal['ENROLLED', 'DROPPED', 'COMPLETED', 'WITHDRAWN']]

class Assignment(TypedDict):
    assignment_id: int
    course_id: int
    section_number: str
    semester: str
    year: int
    title: str
    description: Optional[str]
    due_date: Optional[str] # Assuming ISO format string
    max_points: Optional[float]
    weight: Optional[float]

class Grade(TypedDict):
    student_id: int
    assignment_id: int
    grade_value: Optional[float]
    submission_date: Optional[str] # Assuming ISO format string
    feedback: Optional[str]
    graded_by: Optional[int]

class Prerequisite(TypedDict):
    course_id: int
    prereq_id: int

class Project(TypedDict):
    project_id: int
    title: str
    description: Optional[str]
    start_date: Optional[str] # Assuming YYYY-MM-DD string format
    end_date: Optional[str] # Assuming YYYY-MM-DD string format
    funding_amount: Optional[float]

class ProjectSponsor(TypedDict):
    project_id: int
    student_id: int
    instructor_id: int
    role: Optional[str]
    join_date: Optional[str] # Assuming YYYY-MM-DD string format