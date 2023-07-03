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

7. We're going to experiment with useState and useEffect to understand states in React better.
   
    7.1.  Add the following text to "What our customers say" section:
   
         ```I bought a {product} from {brand} omn {date} and the experience was amazing. There were a few hiccups since I wasn’t familiar with the process but {person} from Customer Service Department was there to help me at every step.
   ```
