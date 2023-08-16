from http.server import BaseHTTPRequestHandler, HTTPServer
import time
from sql.access import get
from sql.store import insert
hostName = "localhost"
serverPort = 8080

class MyServer(BaseHTTPRequestHandler):
    def do_GET(self):
        # self.send_response(200)
        # self.send_header("Content-type", "text/html")
        # self.end_headers()
        if(str(self.path).__contains__('/redirect/')):
            recogniser=str(self.path)[str(self.path).index('/redirect/')+10:]
            res=get(recogniser)
            if(res!="Error"):
                self.send_response(302)
                self.send_header("Location", res)
                self.end_headers()
                self.wfile.write(bytes(res,"utf-8"))
            else:
                self.send_error(400,"URL not in the database")
        else: self.send_error(400,"NOT VALID URL FORM")


    def do_POST(self):
        # self.send_response(200)
        # self.send_header("Content-type", "text/html")
        # self.end_headers()
        if(str(self.path).__contains__('/create/')):
            recogniser=str(self.path)[str(self.path).index('/create/')+10:]
            res=get(recogniser)
            if(res=="Error"):
                insert(tuple(recogniser.split('/')[:2]))
                self.send_response(201)
                self.send_header("Created", "done")
                self.end_headers()
            else:
                self.send_error(400,"URL already in the database")
        else: self.send_error(400,"NOT VALID URL FORM")




if __name__ == "__main__":        
    webServer = HTTPServer((hostName, serverPort), MyServer)
    print("Server started http://%s:%s" % (hostName, serverPort))

    try:
        webServer.serve_forever()
    except KeyboardInterrupt:
        pass

    webServer.server_close()
    print("Server stopped.")