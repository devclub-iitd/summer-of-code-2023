import sqlite3

#IN case you dont have the db file already.

DATABASE_FILE = "shorten.db"

db = sqlite3.connect(DATABASE_FILE)
cur = db.cursor()

try:
    cur.execute("CREATE TABLE shortener(shortCode, destinationUrl, timesVisited, uniqueVisitors, creatorIP)")
    cur.execute("INSERT INTO shortener VALUES ('myCode', 'https://www.google.com', 0, 0, '127.0.0.1')")

    cur.execute("CREATE TABLE uniques(shortCode, visitIP)")
    cur.execute("INSERT INTO uniques VALUES ('myCode', '127.0.0.1')")
except:
    pass

db.commit()