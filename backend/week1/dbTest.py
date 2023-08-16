import sqlite3

#THIS IS A DEBUG FILE

DATABASE_FILE = "shorten.db"

db = sqlite3.connect(DATABASE_FILE)
cur = db.cursor()
print(cur.execute("SELECT * FROM shortener").fetchall())
print(cur.execute("SELECT * FROM uniques").fetchall())