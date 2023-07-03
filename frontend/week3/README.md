# DevClub Summer of Code 2023

## Frontend Development: Week 3

This week, we'll learn how to create a React Web Application. 

### Task 

We're going to create a new page for Contact Us using [this design](https://www.figma.com/file/N7yxyydXHp3mFS5jW8N0Bl/E-commerce-(Website)-(Community)?type=design&node-id=0-1&mode=design&t=rTpq6IsP5VAJK9M9-0).

1. First start by creating a react app using terminal and npm. Npm is the package manager for Javascript and the default manager for runtime environment Node.js. Explore the various folders and files created, but don't make any changes to them .

2. Next we're going to add react components. In the src folder create a folder Home. Add the files: Home.js, Landing.js and HowitWorks.js. Creat app components for Landing and HowitWorks. Then import them into Home.js. Think which other components you should create in Home folder. Import them too, and then arrange them on Home.js.

3. Repeat the process for About Us folder and Contact Us folder. The actual content can be added later, first we're going to set up the routing. 

4. Make a navbar and footer. Use Bootstrap documentation to create the navbar. Note that both components are common to both pages (Home and Contact Us), so they shouldn't be added to Home.js.

5. Add the routing to App.js. Go through the resources to understand how routing is done. Keep in mind that the lates version of React uses { BrowserRouter, Routes, Route } for routing.

6. Now add the HTML code to the respective .js files. If you've made the last assignment on Bootstrap you can add the code as it is and it will render. Create CSS files according to your convinience.

7. Test your app on terminal by using "yarn" and "yarn start" commands.

8. We're going to experiment with useState and useEffect to understand states in React better.
   
- Add the following text to "What our customers say" section:

`I bought a {Review.product} from {Review.brand} on {Review.date} and the experience was amazing. There were a few hiccups since I wasn’t familiar with the process but {Review.person} from Customer Service Department was there to help me at every step.`
	
- Now create a function :

```js
function Review() {
  const [review, setReview] = useState({
    product: "soap",
    brand: "Lux",
    date: "5th June",
    person: "Amy"
  });
```

- Add this code to the end:
```js
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Car />);
```

8.4 Notice the changes in the text when your change the constant. 

#### Bonus:

1. Create a carousel for the landing. The design should be similar to the one given above in figma.

2. Create a "fake" carousel for the  "what our customers say" section using useState. When you click the forward button, it should display a new const with a different product, brand, date and person. When you click back it should show the initial constant. Use onClick to acheieve this.

3. Migrate the codebase to use
- `TypeScript` instead of `JavaScript`
- `yarn` instead of `npm`
- `vite` instead of `create-react-app`
- Setup a pre-commit hook for [prettier](https://prettier.io/docs/en/precommit.html)

4. Deploy your website to [vercel](https://vercel.com/)
