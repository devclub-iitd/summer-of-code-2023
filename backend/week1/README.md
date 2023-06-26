# DevClub Summer of Code 2023

## Backend Development: Week 1

### Task 1A: Network Report
This will be your first task. Explore how [Moodle](https://moodle.iitd.ac.in) and write your findings in a report. You'll be using the browser developer tools to make the network report.
In your report, write about
- What are the different requests made by the browser to the server, and where are they initiated inside the page
- What each header in the response from the server means
- What happens when you login to Moodle. (Explain how the browser makes a request to the server and how the server responds to the request.)
- What are the cookies and how are they used in the browser-server communication and authentication.

Finally, create a file in this repo as `backend/week1/report.md` and write your findings, make sure to insert screenshots wherever you can!

#### Bonus Task
- Check out tools like `telnet`/`nc`, `curl`, `wget` and learn how to make requests to these servers
- Check out how JWTs are used for authentication. Explore any of the daily websites you visit/APIs you use and see if they are using JWT for authentication, and see what information they store

### Task 1B: Create a URL Shortner
In this task you have to make a URL shortner using Python simple HTTP server. The following should be the features of your URL shortner:

- A redirect endpoint which takes a shortened URL and redirects to the original URL.  
`GET /redirect/<short_code` should return a response with header `HTTP 302 Found`

- A create endpoint which takes a URL and returns a shortened URL.
`POST /create/<short_code>/<destination_url>` should return a response with header `HTTP 201 Created`

We would recommend you to initially start with setting up a simple server which can return any arbitrary header and content for a given URL. Later, set up a database where you can write queries

Finally, put your source file in this repo as `backend/week1/server.py`

#### Bonus Task
Add the following features to your URL shortner:
- Count the number of times each shortened URL has been visited
- Find number of unique visitors for each click
- Try creating a `PATCH` endpoint to update the destination for a link. How can you ensure that only the user who created that shortlink is able to edit it?
