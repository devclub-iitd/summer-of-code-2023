"""This is an API for creating shorturl for more instructions read server.md"""
import http.server
import sqlite3
import json
from urllib.parse import parse_qs
import uuid

# Empty dictionary to store cookies
cookies = {}

# Database connection
conn = sqlite3.connect("url_shortener.db")
c = conn.cursor()

# Create URLs table if it doesn't exist
c.execute('''
    CREATE TABLE IF NOT EXISTS urls (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        short_code TEXT NOT NULL,
        destination_url TEXT NOT NULL,
        user TEXT NOT NULL,
        visit_count INTEGER DEFAULT 0
    )
''')

# Create users table if it doesn't exist
c.execute('''
    CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL
    )
''')

# Function to handle login request
def login_handler(body):
    username = body.get("username", [""])[0]
    password = body.get("password", [""])[0]

    c.execute("SELECT * FROM users WHERE username=?", (username,))
    user = c.fetchone()

    if user:
        if user[2] == password:
            user_id = str(uuid.uuid4())
            cookies[user_id] = username
            return (200, {"message": "Login successful", "user_id": user_id})
        else:
            return (401, {"message": "Invalid password"})
    else:
        return (401, {"message": "Invalid username"})

# Function to handle signin request
def signin_handler(body):
    username = body.get("username", [""])[0]
    password = body.get("password", [""])[0]

    c.execute("SELECT * FROM users WHERE username=?", (username,))
    user = c.fetchone()

    if user:
        return (409, {"message": "User already exists"})
    else:
        user_id = str(uuid.uuid4())
        cookies[user_id] = username
        c.execute("INSERT INTO users (username, password) VALUES (?, ?)", (username, password))
        conn.commit()
        return (200, {"message": "Signin successful", "user_id": user_id})

# Function to handle create short URL request
def create_handler(short_code, destination_url, user_cookie):
    if user_cookie not in cookies:
        return (401, {"message": "Session expired. Please login again"})
    
    user = cookies[user_cookie]
    
    c.execute("SELECT * FROM urls WHERE short_code=?", (short_code,))
    url = c.fetchone()
    
    if url:
        return (409, {"message": "Short code already exists"})
    
    c.execute("INSERT INTO urls (short_code, destination_url, user) VALUES (?, ?, ?)", (short_code, destination_url, user))
    conn.commit()
    return (201, {"message": "Short URL created successfully"})


# Function to handle redirect request
def redirect_handler(short_code):
    c.execute("SELECT * FROM urls WHERE short_code=?", (short_code,))
    url = c.fetchone()
    
    if url:
        visit_count = url[4] + 1
        c.execute("UPDATE urls SET visit_count=? WHERE short_code=?", (visit_count, short_code))
        conn.commit()
        return (302, {"Location": url[2]})
    else:
        return (404, {"message": "Short URL not found"})


# Function to handle update request
def update_handler(short_code, new_destination_url, user_cookie):
    if user_cookie not in cookies:
        return (401, {"message": "Session expired. Please login again"})
    
    user = cookies[user_cookie]
    
    c.execute("SELECT * FROM urls WHERE short_code=?", (short_code,))
    url = c.fetchone()
    
    if url:
        if url[3] != user:
            return (403, {"message": "You don't have permission to update this URL"})
        
        c.execute("UPDATE urls SET destination_url=?, visit_count=0 WHERE short_code=?", (new_destination_url, short_code))
        conn.commit()
        return (200, {"message": "URL destination updated successfully"})
    else:
        return (404, {"message": "Short URL not found"})


# Custom HTTP request handler
class RequestHandler(http.server.BaseHTTPRequestHandler):
    
    # Set response headers
    def set_headers(self, status_code, user_id=None):
        self.send_response(status_code)
        self.send_header("Content-Type", "application/json")
        if user_id:
            self.send_header("Set-Cookie", f"{user_id}")
        self.end_headers()
    
 
        
    
    # Parse the request body
    def parse_body(self):
        content_length = int(self.headers.get("Content-Length", 0))
        body = self.rfile.read(content_length).decode("utf-8")
        return parse_qs(body)
    
    # Handle login request
    def handle_login(self):
        body = self.parse_body()
        status_code, response_body = login_handler(body)
        user_id = response_body.get("user_id")
        self.set_headers(status_code, user_id)
        self.wfile.write(bytes(json.dumps(response_body), "utf-8"))
    
    
    # Handle signin request
    def handle_signin(self):
        body = self.parse_body()
        status_code, response_body = signin_handler(body)
        user_id = response_body.get("user_id")
        self.set_headers(status_code, user_id)
        self.wfile.write(bytes(json.dumps(response_body), "utf-8"))
    
    
    # Handle create short URL request
    def handle_create(self, short_code, destination_url):
        user_cookie = self.headers.get("Cookie", "")
        status_code, response_body = create_handler(short_code, destination_url, user_cookie)
        self.set_headers(status_code)
        self.wfile.write(bytes(json.dumps(response_body), "utf-8"))
    
    # Handle redirect request
    def handle_redirect(self, short_code):
        status_code, response_body = redirect_handler(short_code)
        self.set_headers(status_code)
        if status_code == 302:
            self.send_header("Location", response_body["Location"])
        self.wfile.write(bytes("", "utf-8"))
    
    # Handle update request
    def handle_update(self, short_code, new_destination_url):
        user_cookie = self.headers.get("Cookie", "")
        status_code, response_body = update_handler(short_code, new_destination_url, user_cookie)
        self.set_headers(status_code)
        self.wfile.write(bytes(json.dumps(response_body), "utf-8"))
    
    # Handle HTTP GET requests
    def do_GET(self):
        if self.path.startswith("/redirect/"):
            short_code = self.path[len("/redirect/"):]
            self.handle_redirect(short_code)
    
    # Handle HTTP POST requests
    def do_POST(self):
        if self.path == "/login":
            self.handle_login()
        elif self.path == "/signin":
            self.handle_signin()
        elif self.path == "/create":
            body = self.parse_body()
            short_code = body.get("short_code", [""])[0]
            destination_url = body.get("destination_url", [""])[0]
            self.handle_create(short_code, destination_url)
    
    # Handle HTTP PATCH requests
    def do_PATCH(self):
        if self.path.startswith("/update/"):
            short_code = self.path[len("/update/"):]
            body = self.parse_body()
            new_destination_url = body.get("destination_url", [""])[0]
            self.handle_update(short_code, new_destination_url)


# Run the server
def run(server_class=http.server.HTTPServer, handler_class=RequestHandler):
    server_address = ("", 8000)
    httpd = server_class(server_address, handler_class)
    httpd.serve_forever()


if __name__ == "__main__":
    run()
