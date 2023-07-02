from http.server import BaseHTTPRequestHandler, HTTPServer
import time

hostname = "localhost"
port = 5000

class Myserver(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(201)
        self.send_header("Content-type","Working")
        self.end_headers()
    
if __name__ == '__main__':
    webServer = HTTPServer((hostname,port),Myserver)
    print('yes ye syes')
    try:
        webServer.serve_forever()
    except KeyboardInterrupt:
        pass
    webServer.server_close()
    print('closed')