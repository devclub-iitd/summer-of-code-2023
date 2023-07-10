# DevClub Summer of Code 2023

## Backend Development: Week 4

**Note:** We will be continuing with the project we started in the previous week. If you haven't completed the tasks from the previous week, please complete them first.

### Task 4A: Setting Up Microsoft Azure
All the students enrolled at IIT Delhi (or any other educational institute) are eligible for a free Microsoft Azure account. We will be using Azure to host our Django project. Follow the steps below to set up your Azure account:
- Go to [Azure for Students](https://azure.microsoft.com/en-in/free/students/) and click on **Start Free**.
- Sign in with your Microsoft account associated with your institutional email address (@iitd.ac.in)
- Complete the sign up process and verify your account. No credit card is required for this. You will be given a $100 credit to use Azure services for free.
- Once you have completed the sign up process, go to the [Azure Portal](https://portal.azure.com/) and search for **Virtual Machines**.
- Create a Virtual Machine in **Central India** region and choose the basic configuration (Standard B1s (1 vcpu, 1 GiB memory)) for the virtual machine. Choose Ubuntu 20.04 LTS as the operating system for the Virtual Machine.
- Once the Virtual Machine is created, go to the **Overview** tab and click on **Connect**. Follow the instructions to connect to your Virtual Machine using SSH. [How to SSH?](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/ssh-from-windows)

### Task 4B: Setting up the Virtual Machine
Once you have connected to your Virtual Machine, follow the steps below to set up the Virtual Machine:
- Install git on the Virtual Machine using the command `sudo apt install git`
- Install postgresql on the Virtual Machine using the command `sudo apt install postgresql`
- Clone your Django project from GitHub on the Virtual Machine using the command `git clone <your-repo-url>`
- Install all the dependencies for your Django project in a virtual environment using the command `pip install -r requirements.txt`
- Run your Django project on the Virtual Machine using the command `python manage.py runserver`.
- If everything works well, update your `settings.py` file to make it production ready. You can refer to the `settings.py` file in the [Django documentation](https://docs.djangoproject.com/en/3.2/ref/settings/) for this.
- Setup a postgresql database on the Virtual Machine and update the `settings.py` file to use this database. You can refer to the [Django documentation](https://docs.djangoproject.com/en/3.2/ref/databases/) for this.

### Task 4C: Using NGINX and Gunicorn
We will be using NGINX and Gunicorn to serve our Django project. Follow the steps below to set up NGINX and Gunicorn:
- Install NGINX on the Virtual Machine using the command `sudo apt install nginx`
- Install Gunicorn in the virtual environment using the command `pip install gunicorn`
- Follow the steps in this [Digital Ocean tutorial](https://www.digitalocean.com/community/tutorials/how-to-set-up-django-with-postgres-nginx-and-gunicorn-on-ubuntu-22-04) to configure NGINX and Gunicorn to serve your Django project.

### Task 4D: Setting up a Domain Name
We will be setting up a domain name for our Django project. Follow the steps below to get a domain name:
- Raise a request for a domain name by [sending an email](mailto:ee1211108@iitd.ac.in?subject=DevClub%20Summer%20of%20Code%202022:%20Domain%20Name%20Request&body=Name:%0D%0AEntry%20Number:%0D%0AGitHub%20Username:%0D%0AVM%20Public%20IP%20Address:) from your institutional email address (@iitd.ac.in). The subject of the email should be **DevClub Summer of Code 2022: Domain Name Request**. The body of the email should contain your name, entry number, your github username and your Virtual Machine's Public IP Address. You will be given a domain name in the format `<your-github-username>.iitd.site`.
- Reconfigure your Django and NGINX settings to allow requests from your domain name. You can refer to the [Django documentation](https://docs.djangoproject.com/en/3.2/ref/settings/#allowed-hosts) and the [NGINX documentation](https://docs.nginx.com/nginx/admin-guide/web-server/web-server/#setting-http-headers) for this.

### Task 4E: Setting up HTTPS
We will be setting up HTTPS for our domain name. Follow the steps below to get a SSL certificate for your domain name:
- Follow the steps in this [Digital Ocean tutorial](https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-20-04) to get a SSL certificate for your domain name.
- Reconfigure your NGINX settings (if not reconfigured automatically) to use HTTPS instead of HTTP. You can refer to the [NGINX documentation](https://docs.nginx.com/nginx/admin-guide/web-server/web-server/#setting-http-headers) for this.


## Bonus Task
1. Learn about Docker and Docker Compose. Realise the importance of Docker in the world of software development. If you have time, try to dockerize your Django project and deploy it on your Virtual Machine.
2. Learn about CI/CD and how it can be used to automate the deployment process. If you have time, try to set up a CI/CD pipeline for your Django project using GitHub Actions.