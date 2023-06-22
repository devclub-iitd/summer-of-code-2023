from http.server import HTTPServer, BaseHTTPRequestHandler
import sqlite3

HOST = "localhost"
PORT = 8196
DATABASE_FILE = "shorten.db"

class urlShortener(BaseHTTPRequestHandler):

    def do_GET(self):

        if self.path == '/':

            self.send_response(200)

            self.send_header("Content-type", "text/html")
            self.end_headers()

            self.wfile.write(bytes("<html><body><h1>If you're seeing this, the server works!!</h1></body></html>", "utf-8"))


        elif self.path.split("/")[1] == "redirect" and len(self.path.split("/")) > 2:

            self.db = sqlite3.connect(DATABASE_FILE)
            self.cursor = self.db.cursor()

            if self.path.split("/")[2] == "myCode": # to do check in db

                self.send_response(302)
                self.send_header("Location", "https://www.google.com") # to do fetch from db
                self.end_headers()
        
            else:

                self.send_error(404)
        
        else:
            self.send_error(404)

    def do_POST(self):


        if self.path.split("/")[1] == "create" and len(self.path.split("/")) > 3:

            shortCode = self.path.split("/")[2]
            destinationUrl = self.path.split("/")[3]

            self.db = sqlite3.connect(DATABASE_FILE)
            self.cursor = self.db.cursor()

            if shortCode is not "myCode": # to do check in db
                self.send_response(201)
                # to do add to db

            else:
                self.send_error(403)
        
        else:
            self.send_error(404)



shortenServer = HTTPServer((HOST, PORT), urlShortener   )

print("Server is running!")
shortenServer.serve_forever()

shortenServer.server_close()