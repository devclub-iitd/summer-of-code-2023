from http.server import HTTPServer, BaseHTTPRequestHandler
import sqlite3

HOST = "localhost"
PORT = 8196
DATABASE_FILE = "shorten.db"

class urlShortener(BaseHTTPRequestHandler):


    def unzip(self, results):

        # pretty sure theres a faster inbuilt py function for this but was too lazy to look up LOL

        dic = {}

        for element in results:
            dic[element[0]] = (element[1], element[4])
        
        return dic


    def concat(self, listOfStrs):

        st = ""

        for str in listOfStrs:
            st = st + str + "/"
        
        return st[:-1]




    def do_GET(self):

        if self.path == '/':

            self.send_response(200)

            self.send_header("Content-type", "text/html")
            self.end_headers()

            self.wfile.write(bytes("<html><body><h1>If you're seeing this, the server works!!</h1></body></html>", "utf-8"))


        elif self.path.split("/")[1] == "redirect" and len(self.path.split("/")) > 2:

            db = sqlite3.connect(DATABASE_FILE)
            cur = db.cursor()
            results = cur.execute("SELECT * FROM shortener").fetchall()
            results = self.unzip(results)

            if self.path.split("/")[2] in results.keys():

                self.send_response(302)
                self.send_header("Location", results[self.path.split("/")[2]][0])

                query = "UPDATE shortener SET timesVisited = timesVisited + 1 WHERE shortCode = '"+self.path.split("/")[2]+"'"
                cur.execute(query)
                db.commit()

                query = "INSERT INTO uniques VALUES ('"+self.path.split("/")[2]+"', '"+self.client_address[0]+"')"
                cur.execute(query)
                db.commit()

                query = "UPDATE shortener SET uniqueVisitors = (SELECT COUNT(DISTINCT visitIP ) FROM uniques u WHERE u.shortCode = '"+self.path.split("/")[2]+"')"
                cur.execute(query)
                db.commit()

                self.end_headers()
        
            else:

                self.send_error(404)

        
        
        else:
            self.send_error(404)



    def do_POST(self):



        if self.path.split("/")[1] == "create" and len(self.path.split("/")) > 3:

            shortCode = self.path.split("/")[2]
            destinationUrl = self.concat(self.path.split("/")[3:])

            db = sqlite3.connect(DATABASE_FILE)
            cur = db.cursor()
            results = cur.execute("SELECT * FROM shortener").fetchall()
            results = self.unzip(results)

            if shortCode not in results.keys():

                try:
                    query = "INSERT INTO shortener VALUES ('"+shortCode+"', '"+destinationUrl+", 0')"
                    cur.execute(query)
                    db.commit()
                    self.send_response(201)

                except:
                    self.send_error(500)

            else:
                self.send_error(403)
        



        elif self.path.split("/")[1] == "patch" and len(self.path.split("/")) > 3:

            shortCode = self.path.split("/")[2]
            destinationUrl = self.concat(self.path.split("/")[3:])

            db = sqlite3.connect(DATABASE_FILE)
            cur = db.cursor()
            results = cur.execute("SELECT * FROM shortener").fetchall()
            results = self.unzip(results)

            if shortCode in results.keys():

                if results[shortCode][1] == self.client_address[0]:

                    try:
                        query = "UPDATE shortener SET destinationUrl = '"+destinationUrl+"' WHERE shortCode = '"+shortCode+"'"
                        cur.execute(query)  
                        db.commit()

                        self.send_response(201)
                        self.end_headers()

                    except:
                        self.send_error(500)

                else:
                    self.send_error(401)
        
            else:
                self.send_error(500)
        



        else:
            self.send_error(404)

shortenServer = HTTPServer((HOST, PORT), urlShortener)

print("Server is running!")
shortenServer.serve_forever()

shortenServer.server_close()