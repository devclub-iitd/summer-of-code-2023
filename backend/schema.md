# Schema

### Product model

|Field      |Type         |Description                             |
|-----------|-------------|----------------------------------------|
|id         |Integer      |Primary Key                             |
|name       |CharField    |Product name                            |
|description|CharField    |Product description                     |
|price      |Integer      |Product price                           |
|addDate    |DateTimeField|Date and time when the product was added|
|sold       |BooleanField |Indicates if the product is sold or not |
|image      |ImageField   |Product image                           |

### User model

|Field      |Type         |Description                             |
|-----------|-------------|----------------------------------------|
|id         |Integer      |Primary Key                             |
|username   |CharField    |User's username                         |
|password   |CharField    |User's hashed password                  |

# Mermaid diagram

```mermaid
classDiagram
    class Product {
        +int id
        +string name
        +string description
        +int price
        +datetime addDate
        +bool sold
        +string image
    }
    class User {
        +int id
        +string username
        +string password
        +string email
        +string first_name
        +string last_name
    }

    class ProductListView {
        +render()
    }

    class ProductDetailView {
        +render()
    }

    class AddProductView {
        +render()
    }

    class SignupView {
        +render()
    }

    class LoginView {
        +render()
    }

    class LogoutView {
        +render()
    }

    ProductListView --> Product : uses
    ProductDetailView --> Product : uses
    AddProductView --> Product : creates
    SignupView --> User : creates
    LoginView --> User : uses
    LogoutView --> User : uses
```
