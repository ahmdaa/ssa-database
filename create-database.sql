# Group: Ahmed Abdalla, Parash Sherpa, Joseph Ruocco
# CSCI 435 Database System Project
# Project: Smart Student Advisor System
# Database Creation Script

USE sass;

CREATE TABLE DEPARTMENT (
	dept_title		varchar(100) NOT NULL,
    PRIMARY KEY		(dept_title)
);

CREATE TABLE PROGRAM (
	program_title	varchar(100) NOT NULL,
    dept_title		varchar(100) NOT NULL,
    PRIMARY KEY		(program_title),
    FOREIGN KEY		(dept_title) REFERENCES DEPARTMENT(dept_title)
);

CREATE TABLE STUDENT (
	student_id 		int NOT NULL,
	student_name 	varchar(100) NOT NULL,
    student_credits	int NOT NULL,
    program_title	varchar(100) NOT NULL,
    PRIMARY KEY 	(student_id),
    FOREIGN KEY		(program_title) REFERENCES PROGRAM(program_title)
);

CREATE TABLE FACULTY (
	faculty_id		int NOT NULL,
    faculty_name	varchar(100) NOT NULL,
    faculty_email	varchar(100) NOT NULL,
    dept_title		varchar(100) NOT NULL,
    PRIMARY KEY		(faculty_id),
    FOREIGN KEY		(dept_title) REFERENCES DEPARTMENT(dept_title)
);

CREATE TABLE COURSE (
	course_id		int NOT NULL,
    course_title	varchar(100) NOT NULL,
    course_credits	int NOT NULL,
    faculty_id		int NOT NULL,
    dept_title		varchar(100) NOT NULL,
    PRIMARY KEY		(course_id),
    FOREIGN KEY		(faculty_id) REFERENCES FACULTY(faculty_id),
    FOREIGN KEY		(dept_title) REFERENCES DEPARTMENT(dept_title)
);

CREATE TABLE REQUIREMENT (
	requirement_name	varchar(100) NOT NULL,
    requirement_type	varchar(100) NOT NULL,
    PRIMARY KEY			(requirement_name)
);

CREATE TABLE OBJECTIVE (
	course_id			int NOT NULL,
    requirement_name	varchar(100) NOT NULL,
    program_title		varchar(100) NOT NULL,
    PRIMARY KEY			(course_id),
    FOREIGN KEY			(course_id) REFERENCES COURSE(course_id),
    FOREIGN KEY			(requirement_name) REFERENCES REQUIREMENT(requirement_name),
    FOREIGN KEY			(program_title) REFERENCES PROGRAM(program_title)
);

