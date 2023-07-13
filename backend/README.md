# DevClub Summer of Code 2023

## Backend Development

### Why learn this?
Backend development encompasses the creation and maintenance of the server-side components that power web applications. It involves designing, developing, and managing the logic, databases, and infrastructure required to handle data processing, user authentication, business logic, and integrations. Backend developers work with programming languages like Python, Ruby, Java, or Node.js to build robust APIs, implement server-side functionalities, and ensure smooth communication between the frontend and backend. They focus on performance, security, and scalability, enabling the seamless functioning of web applications and delivering a reliable and efficient user experience.

### What we'll be building?
This year the theme for DevClub Summer of Code is [e-commerce](https://github.com/devclub-iitd/summer-of-code-2023#theme-and-project)! We'll be building an e-commerce website from scratch. For the website, we will have a frontend and a backend. The frontend will be built using React and the backend will be built using Django. We'll be using Django REST Framework to build the API for our website. We'll be using PostgreSQL as our database. 
##

## Timeline
### Week 1

#### Concepts
- Introduction
    - What backend development entails.
    - Overview of the server-side architecture and its role in web applications.
    - Comparison with frontend development and understanding the need for both.
- Networking
    - Showing how various websites communicate with backend using browser developer tools.
    - Various components of a HTTP request, like headers, body, etc.
    - Cookies, authentication, session and tokens
- Database
    - Databases and their importance in web applications.
    - Overview of different types of databases (relational, NoSQL, etc.).
    - Structured Query Language (SQL) and its usage for data manipulation.
- APIs
    - Definition and significance of Application Programming Interfaces (APIs).
    - RESTful APIs and their role in client-server communication.
    - Overview of HTTP methods (GET, POST, PUT, DELETE) and their purpose.
    - API endpoints, request/response formats, and status codes.
- Running a simple HTTP Server in Python
    - Overview of the HTTP protocol and its role in web communication.
    - Python's built-in `http.server` module for running an HTTP server.
    - Demonstration of how to write a simple Python script to start an HTTP server.
    - Testing the server and accessing it through a web browser.

#### Resources
- DevClub's [Introduction to Backend Engineering](https://www.youtube.com/watch?v=T4o1oxfz02w): This is an introductory video which discusses why we need a backend and the basic concepts in real world.
- Google Chrome Developer's [Inspect Network Activity - Chrome DevTools 101](https://www.youtube.com/watch?v=e1gAyQuIFQo) A nice tutorial on how to analyse webpages using the Chrome DevTools by the Google team themselves!
- Mozilla's [HTTP Status Codes](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status)
- Mozilla's [HTTP Headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers)
- CloudFlare's [HTTP Cookies](https://www.cloudflare.com/en-gb/learning/privacy/what-are-cookies/)
- [JSON Web Tokens](https://jwt.io/): Try to find where JWTs are used in day-to-day activities and authorization requests, and see what content they store
- Python's [http.server](https://docs.python.org/3/library/http.server.html): You can use this packe to make a simple backend server, which takes a request with data like URL and body, and returns reponse of headers and content
- Python's [sqlite3](https://docs.python.org/3/library/sqlite3.html): You can use this python package to interact with a sqlite3 database
- [ngrok](https://ngrok.com/): You can use this to forward your `localhost` port to the web for everyone to see!
- [Postman](https://www.postman.com/): You can use this to write about APIs you've written or found, and share or use them conveniently later

#### [Task](week1) 
Learn how a backend works by analysing a real-world website, and then make your own backend, using raw Python & SQL and use it to create a simple URL shortener

### Week 2
#### Concepts
- Virtual Environment
    - What is a virtual environment and why do we need it.
    - Setting up a virtual environment for our project.
- Installing Django
    - Installing Django using pip in the newly created virtual environment.
    - Creating a new Django project.
- Creating Apps
    - Creating apps for our project.
    - Understanding the structure of a Django app.
    - Adding the app to the main project.
- Creating models
    - Creating models for our app.
    - Understanding the structure of a Django model.
    - Adding the models to the database.
    - Adding data to the model using the admin panel.
- Template Rendering
    - Creating templates for our app.
    - Rendering the templates using views and data from the database.
- Using Django's powerful inbuilt Authentication and Form features

#### Resources
- Documentation for Python's [venv](https://docs.python.org/3/library/venv.html) module
- Installation guide for [Django](https://docs.djangoproject.com/en/4.2/topics/install/)
- Introduction to [Django](https://www.youtube.com/watch?v=rHux0gMZ3Eg)
- GitHub's [Advanced Markdown Formatting](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/creating-diagrams#creating-mermaid-diagrams)
- Digital Ocean's [PostgreSQL Setup](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-22-04)
- [NGINX](https://nginx.org/en/)
- Django's guide to [deployment](https://docs.djangoproject.com/en/4.2/howto/deployment/)

#### [Task](week2)
Setup a Django backend server, and learn database models, rendering templates, user authentication and forms. Bonus: make it production-ready!

### Week 3
#### Concepts
- Django REST Framework
    - What is Django REST Framework and why do we need it.
    - Installing Django REST Framework using pip in the virtual environment.
    - Transforming our Django project into a REST API.
- Function Based Views
    - Creating function based views for our app.
    - Understanding the structure of a Django function based view.
    - Adding the views to the main project.
- Authentication using Simple JWT
    - Understanding the concept of JWT.
    - Installing Simple JWT using pip in the virtual environment.
    - Adding JWT authentication to our project.
- Documentation
    - Understanding how to document our API.
    - Installing Postman and using it to test our API.
    - Writing documentation for all APIs used in our project.


#### Resources
- Django REST Framework's [Quickstart](https://www.django-rest-framework.org/tutorial/quickstart/)
- Django Simple JWT's [Quickstart](https://django-rest-framework-simplejwt.readthedocs.io/en/latest/getting_started.html)
- Postman's [Quickstart](https://learning.postman.com/docs/getting-started/introduction/)

#### [Task](week3)

Convert your Django backend into a REST API, and learn about function based views, JWT authentication and documentation with Postman. Bonus: make it enterprise-grade!

### Week 4
#### Concepts
- Cloud Platforms
    - What are cloud platforms and why do we need them.
    - Overview of different cloud platforms (AWS, GCP, Azure, etc.).
    - Setting up a cloud platform account.
- Virtual Machines
    - What are virtual machines and why do we need them.
    - Overview of different virtual machine providers (AWS EC2, GCP Compute Engine, Azure Virtual Machines, etc.).
    - Creating a virtual machine on the cloud platform.
    - Connecting to the virtual machine using SSH.
- Deploying our Django project
    - Setting up git on the virtual machine.
    - Setting up postgresql on the virtual machine.
    - Cloning our Django project from GitHub.
    - Installing all dependencies and running the project.
    - Making `settings.py` production ready.
    - Using NGINX and Gunicorn to serve our project.
- Domain Name
    - How to get a domain name.
    - What is DNS and how does it work.
    - Connecting our domain name to our virtual machine.
- HTTPS
    - What is HTTPS and why do we need it.
    - Getting a SSL certificate for our domain name.
    - Setting up HTTPS on our virtual machine.

#### Resources
- Microsoft Azure [Student Account](https://azure.microsoft.com/en-in/free/students/)
- Azure Virtual Machines [Documentation](https://docs.microsoft.com/en-us/azure/virtual-machines/)
- How to [SSH into a Virtual Machine (Windows)](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/ssh-from-windows)
- How to [SSH into a Virtual Machine (Linux)](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/ssh-from-linux)
- How to [SSH into a Virtual Machine (MacOS)](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/ssh-from-macos)
- Digital Ocean's [Guide to Deploying Django](https://www.digitalocean.com/community/tutorials/how-to-set-up-django-with-postgres-nginx-and-gunicorn-on-ubuntu-22-04)
- Digital Ocean's [Guide to Domain Names](https://www.digitalocean.com/community/tutorials/an-introduction-to-dns-terminology-components-and-concepts)
- Getting SSL Certificate using [Certbot](https://www.digitalocean.com/community/tutorials/
how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-20-04)
- [Docker Compose](https://realpython.com/django-development-with-docker-compose-and-machine/)
- GitHub [WebHooks](https://docs.github.com/en/webhooks-and-events/webhooks/about-webhooks)

#### [Task](week4)

Deploy your Django project on Microsoft Azure cloud platform, and learn about virtual machines, domain names and HTTPS.