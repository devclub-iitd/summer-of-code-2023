# DevClub Summer of Code 2023

## Backend Development: Week 2

**Note:** Since we will be progressing with the project, we will be using the `backend` folder in the root of this repository as our project folder. So, make sure you have cloned this repository in your system.

### Task 2A: Creating a Virtual Environment and Installing Django
You have to create a python virtual environment for your project. You can use the `venv` module to create a virtual environment. You can refer to the [official documentation](https://docs.python.org/3/library/venv.html) for more details.
- Create a virtual environment named `venv` in the `backend` folder.
- Activate the virtual environment.
- Install Django in the virtual environment using `pip install django`.

### Task 2B: Creating a Django Project and App
You have to create a Django project. You can refer to the [official documentation](https://docs.djangoproject.com/en/4.2/intro/tutorial01/) for more details.
- Create a Django project. You can name it anything you like but make sure it is related to our project theme, i.e. E-commerce.
- Run the server and check if it is working.
- Create a Django app. You can name it anything you like. Add the app to the project and make necessary changes in the `settings.py` file.
- Write basic code for the app and check if it is working.

### Task 2C: Creating Models and Rendering Templates
You have to create models for your app and render templates using the models. You can refer to the [official documentation](https://docs.djangoproject.com/en/4.2/intro/tutorial02/) for more details.
- Create models for your app. You can start by creating a model `Product` which will have fields like `name`, `description`, `price`, etc.
- Apply migrations and add some fictional data to the database using the admin panel.
- Create templates for your app. You can start by creating a webpage to display all the products.

### Task 2D: Adding Authentication
You have to add authentication to your project. You can refer to the [official documentation](https://docs.djangoproject.com/en/4.2/topics/auth/) for more details.
- Create a basic login page and a signup page.
- Create POST methods for both the pages and add the necessary logic.
- The page must display Login if the user is not logged in and Logout if the user is logged in.

### Task 2E: Creating form for adding products
You have to create a form for adding products to the database. You can refer to the [official documentation](https://docs.djangoproject.com/en/4.2/topics/forms/) for more details.
- Create a form for adding products to the database.
- Make sure the form is only accessible to authenticated users.
- Add the necessary logic to add the product to the database.

## Bonus Task
- Check out Django REST Framework and try to convert your project into an API.
- Explore usage of JWTs in authentication and try to implement it in your project.