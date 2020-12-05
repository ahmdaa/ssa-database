# Group: Ahmed Abdalla, Parash Sherpa, Joseph Ruocco
# CSCI 435 Database System Project
# Smart Student Advisor System Interface

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

mycursor.execute("SHOW TABLES")

# Print tables in database
for x in mycursor:
    print(x)
    
mydb.close()
