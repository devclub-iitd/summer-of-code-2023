import http.server
import json
import urllib.parse

class URLHandler(http.server.BaseHTTPRequestHandler):
    def do_POST(self):
        url = urllib.parse.urlparse(self.path)
        print(url)
        self.send_header("Hello", url)
        return
def run_server():
    server_address = ('', 8000)
    httpd = http.server.HTTPServer(server_address, URLHandler)
    print('Starting server on port 8000...')
    httpd.serve_forever()
if __name__ == '__main__':
    run_server()