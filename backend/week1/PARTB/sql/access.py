import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="myusername",
  password="mypassword",
  database="URL"
)
def get(short):
    mycursor = mydb.cursor()
    sql = "SELECT * FROM URL WHERE short = '"+short +"'"
    mycursor.execute(sql)
    myresult = mycursor.fetchall()
    if(myresult==[]):
        return "Error"
    else :return myresult[0][-1]