import sqlite3
con = sqlite3.connect("redirect.db")
cur = con.cursor()
# res = cur.execute("insert into location values('aaaaa','https://google.com',0)")
# cur.execute("CREATE TABLE location(short CHAR(100),long CHAR(100),count INT)")
cur.execute("DELETE FROM location")
# cur.execute("DROP TABLE location")

for row in cur.execute("select short,long,count from location"):
    print(row)
print("executed")
con.commit()