# URL Shortener Backend

This is the backend server for a URL shortener application. It provides APIs for creating short URLs, redirecting to original URLs, updating URL destinations, and user authentication.

## Base URL

The base URL for the backend server is: `http://localhost:8000`

## Endpoints

### Login

Request:
- Method: POST
- URL: `/login`
- Headers:
  - Content-Type: application/json
- Body:
  ```json
  {
    "username": "your_username",
    "password": "your_password"
  }
  ```

Response:
- Status Code: 200 (OK)
- Headers:
  - Content-Type: application/json
- Body:
  ```json
  {
    "message": "Login successful",
    "cookie": "your_cookie"
  }
  ```

### Signin

Request:
- Method: POST
- URL: `/signin`
- Headers:
  - Content-Type: application/json
- Body:
  ```json
  {
    "username": "your_username",
    "password": "your_password"
  }
  ```

Response:
- Status Code: 200 (OK)
- Headers:
  - Content-Type: application/json
- Body:
  ```json
  {
    "message": "Login successful",
    "cookie": "your_cookie"
  }
  ```

### Create Short URL

Request:
- Method: POST
- URL: `/create/<short_code>/<destination_url>`
- Headers:
  - Content-Type: application/json
  - Cookie: your_cookie (received from the login response)
- Example URL: `/create/abc123/http://www.example.com`

Response:
- Status Code: 201 (Created)
- Headers:
  - Content-Type: application/json
- Body:
  ```json
  {
    "message": "Short URL created successfully"
  }
  ```

### Redirect to Original URL

Request:
- Method: GET
- URL: `/redirect/<short_code>`
- Example URL: `/redirect/abc123`

Response:
- Status Code: 302 (Found)
- Headers:
  - Location: http://www.example.com (original destination URL)

### Update URL Destination

Request:
- Method: PATCH
- URL: `/update/<short_code>/<new_destination_url>`
- Headers:
  - Content-Type: application/json
  - Cookie: your_cookie (received from the login response)
- Example URL: `/update/abc123/http://www.new-example.com`

Response:
- Status Code: 200 (OK)
- Headers:
  - Content-Type: application/json
- Body:
  ```json
  {
    "message": "URL destination updated successfully"
  }
  ```

## Error Handling

In case of errors, the server will respond with appropriate status codes and error messages in the response body. Here are some common status codes and their corresponding meanings:

- 401 (Unauthorized): Invalid login credentials or session expired.
- 403 (Forbidden): User does not have permission to perform the requested action.
- 404 (Not Found): The requested resource or URL does not exist.
- 409 (Conflict): Short code or username already exists.

Please ensure that you handle these error responses properly in your frontend application.

## Authentication

To authenticate requests, you need to include a cookie header with the received cookie value from the login response. Make sure to send the cookie with each subsequent request that requires authentication.

## Contributing

If you encounter any issues or have suggestions for improvement, please feel free to contribute to this project by submitting bug reports or pull requests.

Thank you for using the URL shortener backend!
