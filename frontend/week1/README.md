# DevClub Summer of Code 2023

## Frontend Development: Week 1 

This week, we'll learn how websites work, and then learn how to build a simple website using HTML and CSS. 

### Task 1

For this task, visit [Moodle](https://moodle.iitd.ac.in), and open up **Elements** tab in the DevTools
- Observe how the page is divided into nested elements. Check if it forms a tree structure.
- Try to edit properties of elements and see how that changes the way the page looks.
- Try to find the "CSS Selectors" for elements, and use the `document.querySelector` command in the **Console** to select them. For a start, try `document.querySelector("#username")`, then use the `.` operator to explore more options how you can manipulate this element and get information like `value` from it
- Now go to the **Network** tab, and reload the page. Go through the network requests. Find the corresponding `<link>` or `<script>` tag for each request. Observe how options like `Disable Cache` and `throttling` affect the loading.

Finally, create a file in this repo as `frontend/week1/report.md` and write your observations here, try to include screenshots too!

#### Bonus
- Observe how the styles are inherited. See if the fullform of "CSS" is justified
- Pick any popular modern interactive website. See the `Event Listeners` in them, and what happens if you remove the ones on interactive elements like buttons etc.
- Observe the HTTP requests, and see what `(memory cache)` and `(disk cache)` mean. Why is the size of the page transferred less than the total resources?

### Task 2

In this task you have to implement a basic [figma design](https://www.figma.com/file/N7yxyydXHp3mFS5jW8N0Bl/E-commerce-(Website)-(Community)?type=design&t=3bpoeKePi2CJRpBb-1) using HTML and CSS. 

Create a navbar with 3 links and a logo. The links should be white and turn light blue on clicking them. We're only concerned with the Home page right now but we'll be adding routing and linking other sites very soon ;)

Create a carousel and add the image with two buttons.
**Bonus:** Use Javascript to turn this into a slide show 

Add a section heading ("What we do to help our customers in the digital era") with 3 cards. The cards should have an image, some text, and a link.
Hint: Use absolute positioning, and don't forget to use div tag.

Add a section heading ("How it works") with 3 cards, this time side by side. This is meant to help the customers, so keep your instructions short and clear.

In the "What our clients say" section, you can add a photo of yourself or your friend and write a review beside it. Don't forget to add the buttons, as we will need it when we learn JavaScript

In the last section, make a footer and add the logo with your name.

Save your main file as `frontend/week1/website/index.html`.
Store the css files and images etc at `frontend/week1/website/assets/` 

Finally, **deploy** this repository using **GitHub Pages**, your webpage would now be accessible at `https://<github_handle>.github.io/summer-of-code-2023/frontend/week1/website`
