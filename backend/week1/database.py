import sqlite3
con = sqlite3.connect("redirect.db")
cur = con.cursor()
res = cur.execute("insert into location values('aaaaa','https://google.com')")
for row in cur.execute("select short,long from location"):
    print(row)
print("executed")
con.commit()