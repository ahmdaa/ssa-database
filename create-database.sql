# Group: Ahmed Abdalla, Parash Sherpa, Joseph Ruocco
# CSCI 435 Database System Project
# Project: Smart Student Advisor System
# Database Creation Script

USE SSAS;

CREATE TABLE DEPARTMENT (
dept_title varchar(100) NOT NULL,
dept_id	varchar(50) NOT NULL,
PRIMARY KEY (dept_id)
);

CREATE TABLE PROGRAM (
program_title varchar(100) NOT NULL,
program_type varchar(50) NOT NULL,
dept_id	varchar(10) NOT NULL,
PRIMARY KEY (program_title, program_type),
FOREIGN KEY (dept_id) REFERENCES DEPARTMENT(dept_id)
);

CREATE TABLE STUDENT (
student_id int NOT NULL,
student_name varchar(100) NOT NULL,
student_credits int NOT NULL,
program_title varchar(100),
program_type varchar(50),
PRIMARY KEY (student_id),
FOREIGN KEY (program_title, program_type) REFERENCES PROGRAM(program_title, program_type)
);

CREATE TABLE FACULTY (
faculty_id int NOT NULL,
faculty_name varchar(100) NOT NULL,
faculty_email varchar(100) NOT NULL,
dept_id varchar(10) NOT NULL,
PRIMARY KEY (faculty_id),
FOREIGN KEY (dept_id) REFERENCES DEPARTMENT(dept_id)
);

CREATE TABLE COURSE (
course_id varchar(50) NOT NULL,
course_title varchar(100) NOT NULL,
course_credits int NOT NULL,
faculty_id int NOT NULL,
dept_id	varchar(10) NOT NULL,
PRIMARY KEY (course_id),
FOREIGN KEY (faculty_id) REFERENCES FACULTY(faculty_id),
FOREIGN KEY (dept_id) REFERENCES DEPARTMENT(dept_id)
);

CREATE TABLE REQUIREMENT (
requirement_name varchar(100) NOT NULL,
requirement_type varchar(100) NOT NULL,
requirement_id varchar(20) NOT NULL,
PRIMARY KEY (requirement_id)
);

CREATE TABLE OBJECTIVE (
course_id varchar(50) NOT NULL,
requirement_id varchar(20) NOT NULL,
program_title varchar(100),
degree_type varchar(50),
PRIMARY KEY (course_id),
FOREIGN KEY (course_id) REFERENCES COURSE(course_id),
FOREIGN KEY (requirement_id) REFERENCES REQUIREMENT(requirement_id),
FOREIGN KEY (program_title, degree_type) REFERENCES PROGRAM(program_title, degree_type)
);

CREATE TABLE HISTORY (
student_id int NOT NULL,
course_id varchar(50) NOT NULL,
school_year int NOT NULL,
semester varchar(100) NOT NULL,
PRIMARY KEY (student_id, course_id),
FOREIGN KEY (student_id) REFERENCES STUDENT(student_id),
FOREIGN KEY (course_id) REFERENCES COURSE(course_id)
);

