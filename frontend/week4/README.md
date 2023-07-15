# DevClub Summer of Code 2023

## Powering your React app with a public API
### Frontend Development: Week 4  

Welcome to the final stride of the DSoC '23 Frontend track! 

In this task, you will be querying a backend service to get data and render it on the React frontend, thus completing the basic structure of any modern frontend application.

This task will allow you to understand React hooks `useState()` and `useEffect()` in more depth, how state management works, and how to handle network requests and parse the output. 

## Understanding the API   

Applications communicate via APIs because they are flexible and make software development modular. Go to this [API specification page][0] and just play around with it. Read about [endpoints][2] and different [HTTP request types][3], what parameters they require. You should also read about [JSON format][1], the de-facto format for transferring data on the web.   

The API contains CRUD (Create, Read, Update, Delete) endpoints for a Product model. You have to design and implement a frontend in React to support these operations.  

You may work on the React project from before. You will have to implement few new pages:

1. Product List page
2. Product Page
3. Create a new Product Page
4. Update a Product Page

Note that the API is not protected by any authentication mechanism so anyone can change or update the database. This is generally a bad idea but we'll keep it that way for simplicity. 

You are free to design the pages as you wish but they should be consistent in color palette with the previous given design. You are free to choose any layout as you wish for each page. For inspiration checkout popular e-commerce websites like Amazon, Flipkart, etc. 

## STEPS   


1. Wireframe your designs in Figma. It is generally a good idea to do so. 
2. Read the API specs carefully and figure out what fields you will get for each object. This is called the `schema` of the `model` in backend parlance.  

The product model is given below along with their data types:

```json
{
  "title": "string",
  "category": "string",
  "price": 0,
  "location": "string",
  "description": "string",
  "img_url": "string",
  "metadata_user": "string",
  "isNegotiable": true,
  "isFeatured": true,
  "isPromoted": true
}
```

3. Based on this information, design the fields you'll render in Product card component. The same goes for the form you'll use for "Create new Product" page. Note that these are still stateless. We'll make them reactive in the next step.

4. Using [`useState()`][5] define appropriate state variables for each product model. Update them accordingly when you get data from the API but for this step you can make dummy arrays. This is how you can test rendering of individual components.  

```js
const Card = ({ product }) => {
    const { name, quantity, type, description } = product;

    return {
        <div>
            <p>Name: {name}</p>
            <p>Quantity: {quantity}</p>
            <p>Type: {type}</p>
            <p>Description: {description}</p>
        </div>
    }
}

const List = () => {
    const [products, setProducts] = useState([]);
    return {products.map(product => <Card product={product}></Card>)}
}
```

5. Once you are satisfied with your components, read up on [`useEffect()`][4] and when to use it. It is a React hook which executes a callback whenever any state variable that it is watching to is changed. 

```js
useEffect(() => {
    // do stuff
}, []);    // [] is where your state variables go
```

As the API requests are asynchronous, you should show a loader/spinner until the data arrives. Use a ternary operator to conditionally render your content based on the values of the state variables. _This is the power of React. It makes clunky html elements reactive and more "reactive"._   

6. Read up on `fetch()` or `axios()`, these are libraries that makes HTTP calls from the browser. Figure out how to send GET, POST, PATCH, and DELETE requests and what are the contents for Headers and Body. 

Network requests may fail sometimes. You have to handle these using the HTTP code you receive. 200/201 means OK, 4xx request means error, etc. 

Make your app more robust by handling cases and showing appropriate message to your user if the call fails.

```js
const response = await fetch("https://marketplace.com/get/products/all", { method: "GET" });
if (response.status == 200) {
    const data = await response.json() // parse the data into JSON
    return { error: false, message: data.products };
} else if (response.status == 401) {
    const data = await response.json()
    return { error: true, message: data.error };
}
```

This is just a code snippet to show how to do it. You are free to do it in any other way!  

7. You have to render a list of product cards on the Product List page, a single Product (choose the appropriate endpoint by reading the specs), a Create New Product page, an Update Product page.

8. To delete a product, there is no need to implement a page for obvious reasons. Instead, when the user clicks the "Delete Product" button, send a request to the endpoint with the product id and once you get back the successful response, redirect the user to the list page. This is good UI/UX and you should keep this in mind when designing your pages. :)

You may also implement a pop-up modal to first confirm if the user is really sure of deleting the product.   

## BONUS   

1. Read up on how popular [auth mechanism][11] like [JWT][9] and [Session Cookies][10] work. How will you incorporate such an API into your project? Specifically, what changes will you make to the requests and payloads? What is [OAuth][12] and why is it so popular? How does it work?

2. What is the difference between a query and a parameter in API endpoints? 

3. Can you implement a [filter][8] search on the product list page? Is it better to get all products and then filter then on the frontend using JavaScript or you should make a call everytime the filter text box is changed? What are the tradeoffs? You may include a small PDF noting your observations.   

4. Imagine if there are 1000 products. Can you implement [pagination][7] for the list page? Pagination is sometimes UX obstrusive so people don't really like it (How many of us visit the second page of Google search results?) What are your other options? Read up on [lazy loading][6]. Where have you seen this being used?


[0]: https://marketplace-1-b3203472.deta.app/docs#/
[1]: https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/JSON
[2]: https://www.contentful.com/blog/api-endpoint/
[3]: https://www.geeksforgeeks.org/different-kinds-of-http-requests/
[4]: https://www.w3schools.com/react/react_useeffect.asp
[5]: https://www.w3schools.com/react/react_usestate.asp
[6]: https://www.javascripttutorial.net/javascript-dom/javascript-infinite-scroll/
[7]: https://www.techtarget.com/whatis/definition/pagination
[8]: https://upmostly.com/tutorials/react-filter-filtering-arrays-in-react-with-examples
[9]: https://www.bezkoder.com/jwt-json-web-token/
[10]: https://www.ibm.com/docs/en/sva/9.0?topic=cookies-session-concepts
[11]: https://stackoverflow.com/questions/58339005/what-is-the-most-common-way-to-authenticate-a-modern-web-app
[12]: https://auth0.com/intro-to-iam/what-is-oauth-2