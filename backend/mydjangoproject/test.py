import requests
from faker import Faker
from random import randint
import json
fake = Faker()
baseurl = "http://127.0.0.1:8000/"

class User:
    def __init__(self, username, pwd):
        self.username = username
        self.pwd = pwd
        self.headers = {"Content-Type": "application/json"}

    def add_token(self, token):
        self.headers["Authorization"] = f"Bearer {token}"

    def signup(self):
        print("signup...")
        response = requests.post(f'{baseurl}api/signup/', {'username': self.username, 'password': self.pwd})
        print(response)
        print(response.text)

    def login(self):
        print("login...")
        response = requests.post(f'{baseurl}api/token/', {'username': self.username, 'password': self.pwd})
        print(response)
        self.add_token(response.json()["access"])

    def get_all_products(self):
        print("get_all_products...")
        response = requests.get(f'{baseurl}products/', headers=self.headers)
        print(response)
        print(response.json())

    def get_product(self, product_id):
        print("get_product...")
        response = requests.get(f'{baseurl}products/{product_id}/', headers=self.headers)
        print(response)
        print(response.json())

    def delete_product(self, product_id):
        print("delete_product...")
        response = requests.delete(f'{baseurl}products/{product_id}/', headers=self.headers)
        print(response)
        print(response.text)

    def purchase_product(self, product_id):
        print("purchase_product...")
        response = requests.get(f'{baseurl}products/{product_id}/purchase/', headers=self.headers)
        print(response)
        print(response.text)
    def add_product(self):
        print("add_product...")
        data = {'name':fake.name(),'description':fake.text(),'price':randint(1,100)}
        print(data)
        response = requests.post(f'{baseurl}products/add/',json.dumps(data),headers=self.headers)
        print(response)
        print(response.text)


# Create two different dummy users
user1 = User("user1", "password1")
user2 = User("user2", "password2")
user3 = User("user3", "password3")
user4 = User("user4", "password4")
# user1.login()
# user2.login()
# user3.login()
# user4.login()

user3.purchase_product(45)