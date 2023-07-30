import http.server
import socketserver
import sqlite3

con = sqlite3.connect("redirect.db")
cur = con.cursor()

port = 8000
class myhandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(302)
        # print(self.headers)
        print("Path was looking for : ",self.path)
        for row in cur.execute("select short,long,count from location"):
            if(row[0].lower() in self.path):
                self.send_header('Location',row[1])
                self.send_header("Cache-Control","no-cache")
                self.send_header("last-modified","Wed, 30 Nov 2022 00:00:00 GMT")
                cur.execute("UPDATE location SET count = REPLACE(count,?,?) where short = ?;",[row[2],row[2]+1,row[0]])
                print("Now count is : ",row[2])
                con.commit()
                break
        self.end_headers()

    def do_POST(self):
        self.send_response(201)
        print("Path was looking for : ",self.path)
        data = self.path.split('/',3)
        data.append(0)
        print("added : ",data[2],data[3],data[4])
        cur.execute("insert into location values(?,?,?)",data[2:5])
        con.commit()
        self.end_headers()
        


# we have just overrided the do get method of simplehttprequesthandler 
# and now we are just making a handler out of modified simplehttprequesthandler
http = socketserver.TCPServer(("",port),myhandler)
 
print("serving at port",port)
http.serve_forever()