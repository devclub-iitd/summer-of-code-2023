## Analyzing the network requests and their initiation points
As we go to the domain "[https://moodle.iitd.ac.in/](https://moodle.iitd.ac.in/)", these are the requests that we see in the network activity: -

<img width="1440" alt="Screenshot 2023-06-25 at 1 01 10 AM" src="https://github.com/HarshSaini13/summer-of-code-2023/assets/78219532/2e87fa64-38af-421b-9929-af22e0c54bf8">

The exactly same request are made again by the browser when we click on `Home` button. Also the cookies (including google analytics & 
Moodle Session) are same for all these request. If we click on `Log in as a guest` button, the request sent to server returns a status 
code of `303 See Other` which means it redirects this request to another page which is [https://moodle.iitd.ac.in/login/index.php](https://moodle.iitd.ac.in/login/index.php) only.

When we click on the `?` after "Cookies must be enabled in your browser", a request is sent to server that is a XMLHttpRequest. The server
response with a `application/json` file.

## Understanding the headers in the server response
Let's take `index.php` network request and understand the headers: -
### Request Headers
The request header contain many headers in it, the browser sends many informatin to the server such as our OS, Host, etc. The Host request 
header specifies the host and port number of the server to which the request is being sent. There is one interesting header: `Cookie` that
contain 3 cookies, 2 of them are of google analytics and one is of `MoodelSession`.
These 3 cookies are always sent to the server when any request is made.

### Response Headers
The response header give information about the resoponse by the server. These include `Content-Type`, `Date`, `Server`, etc.

## Investigating the login process in Moodle
As we fill details and press the `login` button, a new `POST` request is sent to the server. The server response is a `303 See Other` status
code with a redirect page to `https://moodle.iitd.ac.in/login/index.php?testsession=38924` along with a new cookie for `MoodleSession`, the
previous cookie is deleted.
So now, a request is sent to server, this request contain new cookie and to get this new page that is `GET /login/index.php?testsession=38924 HTTP/1.1`.
The response is an `303` which again redirects our request to `https://moodle.iitd.ac.in/my/`. Another request is made to server to get this `/my` page 
along with the same cookie that was sent by the server. Finally the response from the server is `200 OK`, that is the moodle page for my profile
now opens.

## Understanding cookies and their role in authentication
Cookies allow the server to recognize and associate subsequent requests from the same user. When I logged in, the server generates
a unique session identifier (usually in the form of a session ID) and sends it to the browser as a cookie. As it can be seen, the browser stores this cookie locally
and includes it in subsequent requests to the server, allowing the server to identify and authenticate the user.
