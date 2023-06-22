import sqlite3

#IN case you dont have the db file already.

DATABASE_FILE = "shorten.db"

db = sqlite3.connect(DATABASE_FILE)
cur = db.cursor()

try:
    cur.execute("CREATE TABLE shortener(shortCode, destinationUrl, timesVisited)")
    cur.execute("INSERT INTO shortener VALUES ('myCode', 'https://www.google.com', 0)")
except:
    pass

db.commit()