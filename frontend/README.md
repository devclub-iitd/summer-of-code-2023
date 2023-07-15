# DevClub Summer of Code 2023

## Frontend Development

#### Why learn this?

The first impression of any organisation or product goes through how well their website looks. A great frontend both looks easy on the eyes, and helps the users get the right information from the webpage. To make an engaging website, you should understand the underlying features provided by the browser, to optimise how your webpage loads and looks.

#### What we'll be building?

We'll start by learning how to make simple webpages, and then we'll build an **e-commerce portal** where users would be able to buy and sell items!

##

### Week 1
#### Concepts
- HTML

HTML (Hyper Text Markup Language) is the standard markup for web pages. A markup language is an encoding system which consists of a set of symbols which when inserted in text control it's structure. HTML is based on markup meta languages XML and SGML. Meta languages are used to define a documents structure and the relation between it's parts rather than how it will be displayed. Thus colors, padding, position, etc are rarely specified in HTML. 

- CSS

CSS (Cascading Style Sheets) is used to describe the presentation of a document written in a markup language like HTML. CSS can be used to separately control layout, color and font of different elements. 

It can be added in the HTML file (inline) or be linked separately in a style sheet. 
In case of multiple styles, in line take preference over an external style sheet. 

- DevTools
Built right inside your browser, this provides the most powerful set of tools to a frontend developer for understanding how a webpage is working!

- GitHub Pages

This is a service provided by GitHub where we can host our static files easily and it gets updated on each push too!


#### Resources

- DevClub's [Introduction to Web Development](https://www.youtube.com/watch?v=NeA-qRb7xNo)
- Google Chrome's [DevTools](https://developer.chrome.com/docs/devtools/overview/) 
- Mozilla's [Developer Docs](https://developer.mozilla.org/en-US/docs/Learn)
- web.dev's [CSS](https://web.dev/learn/css/)
- [W3Schools](https://www.w3schools.com/)
- ProgrammingWithMosh's [HTML](https://www.youtube.com/watch?v=qz0aGYrrlhU)
- Hussein Nasser's [Web](https://www.youtube.com/watch?v=dh406O2v_1c)
- CS50 [HTML CSS JS](https://www.youtube.com/watch?v=2VauFS071pg)
- GitHub Pages [Documentation](https://docs.github.com/en/pages)

- #### [Task](week1) 
Learn how websites work using DevTools, and then learn how to build a simple static website using HTML and CSS, taking designs from Figma and host it on GitHub Pages

### Week 2 
#### Concepts 
- Javascript
Javascript is the programming language which runs on the web! Today, it also powers many backend servers and user applications. We use Javascript on the frontend to add logic to our webpage to make it interactive, using both Browser APIs and Web APIs.

- Bootstrap 
Bootstrap is the world's most popular framework for building responsive, mobile first sites. It utilises SaaS, a pre-built grid and powerful Javascript plug-ins. Saas is a scripting language that is compiled into CSS. Due to its structured syntax and additional features Saas is preferred over CSS. 

#### Resources 
- Programming with Mosh's [JavaScript Tutorial for Beginners](https://www.youtube.com/watch?v=W6NZfCO5SIk)
- DevClub's [JavaScript and using APIs to power up your webpage](https://www.youtube.com/watch?v=gC4X0ZRiJo4)
- [The Modern JavaScript Tutorial](https://javascript.info/)
- Hussein Nasser's [GitHub REST API Crash Course](https://www.youtube.com/watch?v=5QlE6o-iYcE)
- [Bootstrap Documentation](https://getbootstrap.com/docs/4.3/getting-started/introduction/#quick-start)
- [Bootstrap Free Code Camp](https://youtube.com/watch?v=-qfEOE4vtxE&feature=share8)

- #### [Task](week2) 
Use Javascript to create a repository network analyzer consuming the GitHub API, and use Bootstrap to make our previous webpage responsive!


### Week 3

#### Concepts

- ReactJS
React JS is a Javascript library for building websites. It's main advantage is that applications can be created on a single page and that website components are reusable. It divides a website into reusable "components", to make the process of development faster - so you don't ever have to copy paste for making a navbar or list etc, this is accomplished by using **JSX**. It provides us a **declarative** way to manage the UI state, where rather than manipulating each piece of content that has to change on an action, we describe those states and it efficiently renders them.

- JSX
JSX is a syntax extension of Javascript and commonly used on React. JSX allows us to write HTML elements in JavaScript and place them in the DOM without any createElement() and/or appendChild() methods. It provides a very neat and intuitive way to look at the components. After compilation, JSX expressions become regular JavaScript function calls.

- State
ReactJS is made of components. The State of a component is an object that holds some information that may change with time or user interaction. State can be used with React Hooks like useState. They are mutable and React re-renders the component whenever its state changes, manipulating the DOM accordingly.

#### Resources
- Mosh's [React Tutorial for Beginners](https://www.youtube.com/watch?v=SqcY0GlETPk)
- ReactJS's [Official Tutorial](https://react.dev/learn). This gives the best understanding of React, and how to think in it. It gives a complete introduction as well as explanation and exercises to check your understanding
- [JSX](https://legacy.reactjs.org/docs/introducing-jsx.html)
- [React Router](https://reactrouter.com/en/main) This is one of the most popular routing packages for React - which allows you to render different components based on the URL, similar to how a server serves different files for different URLs.
- [useState hook in React with examples](https://www.w3schools.com/react/react_usestate.asp)

#### [Task](week3)
Learn ReactJS, and make your website better using JSX components and State management. Bonus: improve the code quality too!

### Week 4: Powering your React app with a public API

#### Concepts 

- Integrating frontend with backend: Use our [public marketplace API][1] to design frontend pages to list, create, update, and delete products. Learn about JSON, fetch/axios, state management, HTTP status codes, and a bunch of other concepts!   

- React Hooks - useState, useEffects, etc. 

#### Resources  

Resources and code snippets are shared in `week4/README.md` so check it out!      

#### [Task](week4)
Design pages to render, create, and update products. Fetch this data from a public API and understand the interface using API specs. Learn about status codes, state management, error handling, and much more!   


[0]: https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API
[1]: https://marketplace-1-b3203472.deta.app/docs#/
[3]: https://pypi.org/project/python-socketio/
[6]: https://socket.io/docs/v3/rooms/


