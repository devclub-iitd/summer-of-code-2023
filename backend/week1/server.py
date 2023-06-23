import http.server
import urllib.parse

url_mappings = {}
class URLHandler(http.server.BaseHTTPRequestHandler):


    def do_POST(self):
        url = urllib.parse.urlparse(self.path).path
        try:
            url_ = url.replace("/create/","")
            short, dest = url_.split("/")
            url_mappings[short] = (dest, 0)
            self.send_response_only(201)
            self.send_header("content-type","text")
            self.end_headers()
            self.wfile.write(bytes(f"mapped {short} to {dest}\n", "utf-8"))
            return
        except Exception as e:
            self.send_response_only(406)
            return
        
    def do_GET(self):
        url = urllib.parse.urlparse(self.path).path
        url = url.replace("/redirect/", "")
        try:
            dest = url_mappings[url]
        except KeyError:
            self.send_response_only(404)
            self.send_header("error","Not Found")
            self.end_headers()
            self.wfile.write(bytes("Error\n", "utf-8"))
            return
        url_mappings[url] = (dest[0],dest[1]+1)
        self.send_response_only(302)
        self.send_header("content-type","text/html")
        self.end_headers()
        self.wfile.write(bytes(f"{dest[0]}\n", "utf-8"))
        return
    

def run_server():
    server_address = ('', 8000)
    httpd = http.server.HTTPServer(server_address, URLHandler)
    print('Starting server on port 8000...')
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        httpd.server_close()
        print("\nexiting....")
        exit()
    except Exception as e:
        print(e)
if __name__ == '__main__':
    run_server()