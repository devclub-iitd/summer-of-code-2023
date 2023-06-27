import http.server
import json
import random
import string
import sqlite3

conn = sqlite3.connect('url_shortener.db')
c = conn.cursor()

cookies = {}  # Empty dict with cookie to user mapping

# Create URLs table
c.execute('''
    CREATE TABLE IF NOT EXISTS urls (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        short_code TEXT NOT NULL,
        destination_url TEXT NOT NULL,
        user TEXT NOT NULL,
        visit_count INTEGER DEFAULT 0
    )
''')

# Create user table
c.execute('''
    CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL
    )
''')

class URLShortenerHandler(http.server.BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path.startswith('/login'):
            # Verify login credentials and generate cookie
            content_length = int(self.headers.get('Content-Length', 0))
            payload = self.rfile.read(content_length)
            payload = json.loads(payload)
            username = payload.get('username')
            password = payload.get('password')
            if verify_login(username, password):
                cookie = generate_cookie()
                cookies[cookie] = username
                self.send_response(200)
                self.send_header('Content-Type', 'application/json')
                self.send_header('Set-Cookie', f'cookie={cookie}')
                self.end_headers()
                response = {
                    'message': 'Login successful',
                    'cookie': cookie
                }
                self.wfile.write(json.dumps(response).encode())
            else:
                self.send_error(401, 'Unauthorized')

        elif self.path.startswith('/redirect/'):
            # Redirect to the original URL and increase visit count
            short_code = self.path.split('/')[-1]
            c.execute('SELECT * FROM urls WHERE short_code = ?', (short_code,))
            result = c.fetchone()
            if result:
                url_id, _, destination_url, _, visit_count = result
                visit_count += 1
                c.execute('UPDATE urls SET visit_count = ? WHERE id = ?', (visit_count, url_id))
                conn.commit()
                self.send_response(302)
                self.send_header('Location', destination_url)
                self.end_headers()
            else:
                self.send_error(404, 'Short URL not found')

        else:
            self.send_error(404, 'Not Found')

    def do_POST(self):
        if self.path.startswith('/signin'):
            # Sign in and create a new user
            content_length = int(self.headers.get('Content-Length', 0))
            payload = self.rfile.read(content_length)
            payload = json.loads(payload)
            username = payload.get('username')
            password = payload.get('password')
            if username_exists(username):
                self.send_error(409, 'Username already exists')
            else:
                cookie = generate_cookie()
                cookies[cookie] = username
                c.execute('INSERT INTO users (username, password) VALUES (?, ?)', (username, password))
                conn.commit()
                self.send_response(201)
                self.send_header('Content-Type', 'application/json')
                self.send_header('Set-Cookie', f'cookie={cookie}')
                self.end_headers()
                response = {
                    'message': 'User created successfully',
                    'cookie': cookie
                }
                self.wfile.write(json.dumps(response).encode())

        elif self.path.startswith('/create/'):
            # Create a new short URL
            short_code = self.path.split('/')[-2]
            destination_url = self.path.split('/')[-1]
            cookie = self.headers.get('Cookie')
            username = cookies.get(cookie)
            if username is None:
                self.send_error(401, 'Session expired, please log in')
            else:
                if short_code_exists(short_code):
                    self.send_error(409, 'Short code already exists')
                else:
                    c.execute('INSERT INTO urls (short_code, destination_url, user) VALUES (?, ?, ?)',
                              (short_code, destination_url, username))
                    conn.commit()
                    self.send_response(201)
                    self.send_header('Content-Type', 'application/json')
                    self.end_headers()
                    response = {
                        'message': 'Short URL created successfully'
                    }
                    self.wfile.write(json.dumps(response).encode())

        else:
            self.send_error(404, 'Not Found')

    def do_PATCH(self):
        if self.path.startswith('/update/'):
            # Update the destination URL
            short_code = self.path.split('/')[-2]
            destination_url = self.path.split('/')[-1]
            cookie = self.headers.get('Cookie')
            username = cookies.get(cookie)
            if username is None:
                self.send_error(401, 'Session expired, please log in')
            else:
                if user_matches_short_code(username, short_code):
                    c.execute('UPDATE urls SET destination_url = ?, visit_count = 0 WHERE short_code = ?',
                              (destination_url, short_code))
                    conn.commit()
                    self.send_response(200)
                    self.send_header('Content-Type', 'application/json')
                    self.end_headers()
                    response = {
                        'message': 'URL destination updated successfully'
                    }
                    self.wfile.write(json.dumps(response).encode())
                else:
                    self.send_error(403, 'Forbidden')

        else:
            self.send_error(404, 'Not Found')

def generate_cookie():
    # Generate a random cookie
    return ''.join(random.choices(string.ascii_uppercase + string.digits, k=16))

def verify_login(username, password):
    # Verify the login credentials against the user table
    c.execute('SELECT * FROM users WHERE username = ? AND password = ?', (username, password))
    return c.fetchone() is not None

def username_exists(username):
    # Check if a username exists in the user table
    c.execute('SELECT * FROM users WHERE username = ?', (username,))
    return c.fetchone() is not None

def short_code_exists(short_code):
    # Check if a short code exists in the urls table
    c.execute('SELECT * FROM urls WHERE short_code = ?', (short_code,))
    return c.fetchone() is not None

def user_matches_short_code(username, short_code):
    # Check if the given user matches the user associated with the short code
    c.execute('SELECT user FROM urls WHERE short_code = ?', (short_code,))
    result = c.fetchone()
    return result is not None and result[0] == username

def run_server():
    server_address = ('', 8000)
    httpd = http.server.HTTPServer(server_address, URLShortenerHandler)
    httpd.serve_forever()

if __name__ == '__main__':
    run_server()
