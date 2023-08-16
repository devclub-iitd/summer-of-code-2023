from http.server import BaseHTTPRequestHandler, HTTPServer
from urllib.parse import urlparse
import sqlite3

class urlShortener(BaseHTTPRequestHandler):

    def do_GET(self):
        parsed_path = urlparse(self.path)
        path_parts = parsed_path.path.split('/')
        
        if(path_parts[1] == 'redirect'):
            try:
                shortCode = path_parts[2]

                url = self.find_code(shortCode)

                if url:
                    if not self.headers.get('Cookie') or shortCode in self.headers.get('Cookie'):
                        url['visits'] += 1
                    else:
                        url['visits'] += 1
                        url['unique_visits'] += 1

                    self.update_url(shortCode, url)
                    self.send_response(302)
                    self.send_header('Location', f"https://{url['longUrl']}")
                    self.send_cookie(shortCode)
                    self.end_headers()
                else:
                    self.send_response(404)
                    self.end_headers()
            except Exception as e:
                    print(e)
                    self.send_response(500)
                    self.end_headers()
        else:
            self.send_response(404)
            self.send_header('Content-Type', 'text/plain')
            self.end_headers()
            self.wfile.write('Route Not Found: Please use the redirect endpoint'.encode())

    def find_code(self, shortCode):
        conn = sqlite3.connect('Url.db')
        cursor = conn.cursor()

        cursor.execute("SELECT * FROM urls WHERE shortCode = ?", (shortCode,))
        result = cursor.fetchone()

        cursor.close()
        conn.close()

        if result:
            return {
                'shortCode': result[0],
                'longUrl': result[1],
                'visits': result[2],
                'unique_visits': result[3]
            }
        else:
            return None
        
    def update_url(self, shortCode, url):
        conn = sqlite3.connect('Url.db')
        cursor = conn.cursor()

        cursor.execute("UPDATE urls SET longUrl = ?, visits = ?, unique_visits = ? WHERE shortCode = ?",(url['longUrl'], url['visits'], url['unique_visits'], shortCode))

        conn.commit()
        cursor.close()
        conn.close()

    def send_cookie(self, shortCode):
        cookie_value = 'true'
        cookie_max_age = 60 * 60 * 24
        self.send_header('Set-Cookie', f"{shortCode}={cookie_value}; Max-Age={cookie_max_age}; Path=/")

    def do_POST(self):
        parsed_path = urlparse(self.path)
        path_parts = parsed_path.path.split('/')

        if(path_parts[1] == 'create'):
            shortCode = path_parts[2]
            longUrl = ''.join(path_parts[3:])

            if shortCode and longUrl:
                try:
                    url = self.find_url(longUrl)

                    if url:
                        self.send_response(200)
                        self.send_header('Content-Type', 'text/plain')
                        self.end_headers()
                        self.wfile.write('Exists'.encode())
                    else:
                        self.create_url(shortCode, longUrl)
                        self.send_response(201)
                        self.end_headers()
                except Exception as e:
                    print(e)
                    self.send_response(500)
                    self.end_headers()
            else:
                self.send_response(401)
                self.end_headers()
        else:
            self.send_response(404)
            self.send_header('Content-Type', 'text/plain')
            self.end_headers()
            self.wfile.write('Route Not Found: Please use the create endpoint'.encode())

    def do_PATCH(self):
        parsed_path = urlparse(self.path)
        path_parts = parsed_path.path.split('/')

        if(path_parts[1] == 'update'):
            shortCode = path_parts[2]
            longUrl = ''.join(path_parts[3:])

            if shortCode and longUrl:
                try:
                    url = self.find_code(shortCode)

                    if not url:
                        self.send_response(400)
                        self.end_headers()
                    else:
                        url['longUrl'] = longUrl
                        self.update_url(shortCode, url)
                        self.send_response(200)
                        self.end_headers()

                except Exception as e:
                    print(e)
                    self.send_response(500)
                    self.end_headers()
            else:
                self.send_response(401)
                self.end_headers()
        else:
            self.send_response(404)
            self.send_header('Content-Type', 'text/plain')
            self.end_headers()
            self.wfile.write('Route Not Found: Please use the update endpoint'.encode())

    def find_url(self, longUrl):
        conn = sqlite3.connect('Url.db')
        cursor = conn.cursor()

        cursor.execute("SELECT * FROM urls WHERE longUrl = ?", (longUrl,))
        result = cursor.fetchone()

        cursor.close()
        conn.close()

        if result:
            return result
        else:
            return None

    def create_url(self, shortCode, longUrl):
        conn = sqlite3.connect('Url.db')
        cursor = conn.cursor()

        cursor.execute("INSERT INTO urls (shortCode, longUrl, visits, unique_visits) VALUES (?, ?, 0, 0)", (shortCode, longUrl))
        conn.commit()

        cursor.close()
        conn.close()

def run():
    host = 'localhost'
    port = 5000
    server = HTTPServer((host, port), urlShortener)
    print(f'Server running on port {port}')
    server.serve_forever()


if __name__ == '__main__':
    run()