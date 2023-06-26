# DevClub Summer of Code 2023

## Frontend Development: Week 2

This week, we'll learn how to create dynamic and interactive pages with JavaScript and Bootstrap.

### Task 1

### Task 2

In this task we're going to make changes to our previous webpage to make it resizable for multiple screens, and add interactive components. 

1. Add the following lines to your code. Note that link is used to add Boostrap's CSS and script is used to add Boostraps JavaScript
```
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

3. Now use the column class to enlcose the actual content (like images, text, etc). The order in Bootstrap is container->row->column. A column must always be withing a row and a container. 

4. For positing within the container, use padding and margins. Try to position the rows first. You can also try to change the alignment of the columns. Finally if you need to use CSS try vw (viewport width) and vh (viewport height) units. 

**Bonus**: You will notice the positioning looks out of place in a mobile view. To solve this read about breakpoints. Try to fix this for bonus points.

**Bonus**: You will notice the font size looks too big or too small in some views. Study about different font units in CSS. Try to fix this for bonus points.

5. Use the navbar class to redesign the navbar. The hover effects mentioned last week should also be there. 

**Bonus**: Try to create a vertical navbar for mobile view using all the properties mentioned earlier.
