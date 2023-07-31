from http.server import HTTPServer, BaseHTTPRequestHandler
import sqlite3

#In the destination url, don't write "https://", eg: instead of https://apple.com write apple.com.
#Eg. : localhost/9999/create/abc.com/apple.com        -> for the POST request

# Connecting to the SQLite database
conn = sqlite3.connect("database.db")
cursor = conn.cursor()

# Create the "urls" table
cursor.execute("""
    CREATE TABLE IF NOT EXISTS urls (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        short_code TEXT NOT NULL,
        destination_url TEXT NOT NULL
    )
""")

# Commit the changes and close the connection
conn.commit()
conn.close()


HOST = "localhost"
PORT = 9999

class urlShortener(BaseHTTPRequestHandler):

    def do_GET(self):

        global response
        if self.path == '/':
            self.send_response(200, 'HTTP/1.1')
            self.send_header("Content-type", "text/html")
            self.end_headers()
            response = "<html><body><h1>Welcome to the home page</h1></body></html>"
            self.wfile.write(response.encode('utf-8'))

        elif self.path.split("/")[1] == "redirect" and len(self.path.split("/")) > 2:
            short_code = self.path.split("/")[2]
            conn = sqlite3.connect('database.db')
            cursor = conn.cursor()
            cursor.execute("SELECT destination_url FROM urls WHERE short_code = ?", (short_code,))
            result = cursor.fetchone()

            if result:
                # Short code exists, perform redirect
                destination_url = result[0]
                self.send_response(302, 'HTTP/1.1')  # Found
                self.send_header('Location', destination_url)
                self.end_headers()
            else:
                self.send_response(404, 'HTTP/1.1')
                self.end_headers()
                response = "<html><body><h1>Short code not found.</h1></body></html>"
                self.wfile.write(response.encode('utf-8'))

        else:
            self.send_response(404, 'HTTP/1.1')
            self.end_headers()
            response = "<html><body><h1>Wrong request!</h1></body></html>"
            self.wfile.write(response.encode('utf-8'))


    def do_POST(self):

        if self.path.startswith('/create/') and len(self.path.split("/")) > 3:
            short_code = self.path.split("/")[2]
            destination_url = self.path.split("/")[3]
            conn = sqlite3.connect('database.db')
            cursor = conn.cursor()
            cursor.execute("SELECT destination_url FROM urls WHERE short_code = ?", (short_code,))
            existing_url = cursor.fetchone()

            if existing_url:
                self.send_response(409, 'HTTP/1.1')
                self.end_headers()
                response = "<html><body><h1>Short code already exists.</h1></body></html>"
            else:
                # Insert the short code and destination URL into the database
                #cursor.execute("INSERT INTO urls (short_code, destination_url) VALUES (?, ?)", (short_code, destination_url))
                cursor.execute("INSERT INTO urls (short_code, destination_url) VALUES (?, ?)", (short_code, "https://" + destination_url))

                conn.commit()

                # Return a success response
                self.send_response(201, 'HTTP/1.1')
                self.end_headers()
                response = "<html><body><h1>Short URL created successfully.</h1></body></html>"

            self.send_header('Content-type', 'text/plain')
            self.end_headers()

        else:
            self.send_response(404, 'HTTP/1.1')
            self.end_headers()
            response = "<html><body><h1>Wrong request!</h1></body></html>"

        self.wfile.write(response.encode('utf-8'))

shorteningServer = HTTPServer((HOST, PORT), urlShortener)
print("Server started!")
shorteningServer.serve_forever()
print("Server closed!")
shorteningServer.server_close()

