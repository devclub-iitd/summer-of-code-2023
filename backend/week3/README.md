# DevClub Summer of Code 2023

## Backend Development: Week 3

**Note:** We will be continuing with the project we started in the previous week. If you haven't completed the tasks from the previous week, please complete them first.

### Task 3A: Installing Django REST Framework
You have to install Django REST Framework in your project. You can refer to the [official documentation](https://www.django-rest-framework.org/) for more details.
- Install Django REST Framework using pip in the virtual environment.
- Update `settings.py` file to add Django REST Framework to the installed apps.

### Task 3B: Transforming Django project into a REST API
Now we will be transforming our existing Django project into a REST API. You can refer to the [official documentation](https://www.django-rest-framework.org/tutorial/quickstart/) for more details.
- Modify `views.py` to add the necessary logic for the APIs. You are **only** allowed to use function based views for this task.
- Create 5 APIs for each of the following:
    - Get all products
    - Get a single product (by id)
    - Add a product
    - Delete a product
    - Purchase a product
- Test the APIs using Postman and make sure they are working as expected.

**Note:** You can create new models and/or modify the existing models if you want to.

### Task 3C: Authentication using Simple JWT
You have to add authentication to your project. You can refer to the [official documentation](https://django-rest-framework-simplejwt.readthedocs.io/en/latest/) for more details.
- Install Simple JWT using pip in the virtual environment.
- Update `settings.py`, `urls.py` and other neccessary files to add Simple JWT to the project.
- Create 2 APIs for each of the following:
    - Login
    - Signup
- Test the APIs using Postman and make sure they are working as expected.
- Make `Add Product` and `Purchase Product` APIs created in the previous task accessible only to authenticated users and `Delete Product` API accessible only to the user who created the product. Put necessary restrictions on `Purchase Product` API so that a user can only purchase a product once, a user cannot purchase a product created by them, etc. (**DO NOT** delete the product after it has been purchased.)

### Task 3D: Documentation
Now we will be finally documenting our APIs in Postman. You can refer to the [official documentation](https://learning.postman.com/docs/getting-started/introduction/) for more details.
- Create a new collection in Postman and add all the APIs created in the previous tasks to it.
- Add documentation for each API in the collection.
- Test all the APIs and make sure they are working as expected.
- Explain the working of each API in the documentation in 30-50 words.
- Export the collection as a JSON file and add it to the `backend` directory.

## Bonus Task
1. Learn about class based views in Django and convert all the function based views created in Task 3B to class based views.
2. Learn about [Django CORS Headers](https://pypi.org/project/django-cors-headers/) and add it to your project.
3. Learn about [OpenAPI](https://www.openapis.org/), and use [Swagger](https://django-rest-swagger.readthedocs.io/en/latest/) to make an OpenAPI compatible documentation for your project