import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="rohan",
  password="",
  database=""
)
def insert(val):
    mycursor = mydb.cursor()
    sql = "INSERT INTO URL (short, complete) VALUES (%s, %s)"
    mycursor.executemany(sql, val)
    mydb.commit()
    print(mycursor.rowcount, "was inserted.")