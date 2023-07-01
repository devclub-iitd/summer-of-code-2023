# DevClub Summer of Code 2023

## Frontend Development: Week 2

This week, we'll learn how to create dynamic and interactive pages with JavaScript and Bootstrap.

### Task 1
In this task, we'll use Javascript to create a simple dashboard to monitor the forks of Summer of Code using GitHub API!
- The objective is to have a dashboard where someone can see the status of the progress in all forks at a glance.
  - For starts, have a list of all forks, and under each fork have a list of the branches, and under that a list of commits with the commit messages. 
  - You can also fetch the details of the user from `authors.json`. 
  - Decide how you want to display the data as per your taste, and also handle empty cases
- Use Javascript's [fetch](https://javascript.info/fetch) function to load data from the [GitHub REST API](https://docs.github.com/en/rest). 
  - If you encounter `net::ERR_FAILED`, then make sure to run a local server first, using [`serve`](https://www.npmjs.com/package/serve) or [`http.server`](https://realpython.com/python-http-server/), so you have a valid `origin`
  - If you encounter an `HTTP 429` error, [authenticate](https://docs.github.com/en/rest/overview/authenticating-to-the-rest-api) your requests! You can hard-code the token initially, then find better ways to input and store it
  - Some helpful endpoints: [repos/forks](https://docs.github.com/en/rest/repos/forks?apiVersion=2022-11-28#list-forks), [branches](https://docs.github.com/en/rest/branches/branches?apiVersion=2022-11-28#list-branches), [commits](https://docs.github.com/en/rest/commits/commits?apiVersion=2022-11-28#list-commits) and [repos/contents](https://docs.github.com/en/rest/repos/contents?apiVersion=2022-11-28#get-repository-content)
- Use JS DOM manipulation functions like [`document.querySelector`](https://www.w3schools.com/jsref/met_document_queryselector.asp), [`document.createElement`](https://www.w3schools.com/jsref/met_document_createelement.asp) and [`document.appendChild`](https://www.javascripttutorial.net/javascript-dom/javascript-appendchild/) to update the data received on the webpage

#### Bonus
- Make the lists collapsible using Javascript's `click` or `hover` event
- Add features to **sort** by either name, last committed, no of commits, or which track they are following (frontend/backend/app/machine-learning). You can also observe any interesting **insights** and show them live
  - Hint: You can check the track by the paths of the files they have committed to.
- Use **Bootstrap** to make the UI look professional
- Find some nice **JS library** for rendering charts/network graphs/trees, and use it instead of HTML lists
- (Optional) If you are comfortable with deploying a full-stack application, create a **GitHub App** with OAuth!

### Task 2

In this task we're going to make changes to our previous webpage to make it resizable for multiple screens, and add interactive components. 

1. Add the following lines to your code. Note that link is used to add Boostrap's CSS and script is used to add Boostraps JavaScript
```html
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>E-commerce Website</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"   crossorigin="anonymous">
</head>

<body>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
```

2. Remove all your positioning properties in the CSS file. Use the container and row class appropriately to enclose the components. Remember that the container is the basic building block of Bootstrap and doesn't have actual content. The same applies to the row class.  

3. Now use the column class to enclose the actual content (like images, text, etc). The order in Bootstrap is container->row->column. A column must always be withing a row and a container. 

4. For positing within the container, use padding and margins. Try to position the rows first. You can also try to change the alignment of the columns. Finally if you need to use CSS try vw (viewport width) and vh (viewport height) units. 

5. Use the navbar class to redesign the navbar. The hover effects mentioned last week should also be there. 

#### Bonus

- You will notice the positioning looks out of place in a mobile view. To solve this read about breakpoints. Try to fix this for bonus points.
- You will notice the font size looks too big or too small in some views. Study about different font units in CSS. Try to fix this for bonus points.
- Try to create a vertical navbar for mobile view using all the properties mentioned earlier.
