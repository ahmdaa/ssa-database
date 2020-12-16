# Group: Ahmed Abdalla, Parash Sherpa, Joseph Ruocco
# CSCI 435 Database System Project

import mysql.connector

config = {
    'user': 'root',
    'password': '',             # Replace with your user password
    'host': 'localhost',
    'database': '',             # Replace with your own database name
    'raise_on_warnings': True
}

# Connect to MySQL database
mydb = mysql.connector.connect(**config)
mycursor = mydb.cursor()

def driver():
    print("Welcome to the Smart Student Advisor System")
    id = input("Enter your student id: ...")
    while(1):

        option = int(input('''
		   Select one of the following: 
		   \t Enter 1 to see what program a student belongs to
		   \t Enter 2 to see the department of the program the student belongs to
		   \t Enter 3 to see the degree type of the particular program the student belongs to
		   \t Enter 3 to see the degree type of the particular program the student belongs to
		   \t Enter 4 to see what count the total number of programs being offered
		   \t Enter 5 to see the count the total number of departments
		   \t Enter 6 to see the count the total number of students in every particular program
		   \t Enter 7 to quit
		   '''))
        if(option == 1):
            mycursor.execute("select program_title from Student where student_id = %s", (id,))
        elif(option == 2):
            mycursor.execute("SELECT dept_id FROM PROGRAM WHERE program_title = (SELECT program_title from STUDENT where student_id = %s) AND program_type = (SELECT program_type from STUDENT where student_id = %s)", (id, id,))
        elif(option == 3):
            mycursor.execute("select program_type from STUDENT where student_id = %s", (id,))
        elif (option == 4):
            mycursor.execute("select count(*) as total from Program;")
        elif(option == 5):
            mycursor.execute("select count(*) as total from Department")
        elif (option == 6):
            mycursor.execute("select program_title, count(*) as total from Student group by program_title")
        elif(option == 7):
            mycursor.execute("select requirement_title from Requirement where requirement_id =  (select requirement_id from Objective where course_id in (select course_id from History where student_id = %s))",(id,))
        elif(option == 8):
            mycursor.execute("select course_id, A.requirement_name from (select OBJECTIVE.course_id, REQUIREMENT.requirement_name from OBJECTIVE join REQUIREMENT on OBJECTIVE.requirement_id = REQUIREMENT.requirement_id) as A where course_id in (select course_id from HISTORY where student_id = %s)", (id,))
        elif(option == 9):
            print("thank you. Good bye")

        myresult = mycursor.fetchall()
        for x in myresult:
            print(x)

driver()

mydb.close()
