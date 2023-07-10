# DevClub Summer of Code 2023

## Frontend Development: Week 4   

Welcome to the final stride of the DSoC '23 Frontend track! 

During this week, you will implement a real-time chatroom using [Websockets][0]. This integration will be useful for the e-commerce website for query redressal and customer feedback while also teaching you the fundamentals of Websockets and how they work.   

## Types of Chatrooms

Note that there are different types of chatrooms based on the channels and how they communicate. Broadly, they can be of two types:
1. One-on-One chatrooms: There are exactly two users at the two ends of a socket and communication is between them only.
2. Broadcast chatrooms: There can be any number of users listening on the channel and any emitted message is broadcasted to everyone else.

# TASK: Build a broadcast chatroom

Keeping things simple, you will build a broadcast based chatroom where any logged in user can enter any of the predefined (and immutable) list of chatrooms and communicate with others. If you are familiar with apps like [Discord][1] or [Slack][2], then we are aiming to build something similar but much simpler using sockets.

Note: You are already familiar with React concepts like state management using hooks (`useState` and `useEffect`) and routing techniques like `navigator`. We will use these ideas in this assignment. If you don't, then no worries! This is a good time to pause and learn about those.   

## REQUIREMENT

We want to expose a form to the user where they can enter a username and choose a chatroom from a dropdown menu. Upon clicking "Join Room", the form data is passed to the backend which connects the client to a socket room and allows the user to broadcast messages from a newly redirected "Chat" page. The user can also see the list of messages by other users and see the most recent X messages (You're free to choose the value of X but 100 is a good starting point), send a message to the room which appears there, and leave the chatroom.

On the frontend, you should atleast implement a new Chat page and a Join Chatroom component in React (or whatever equivalent it is in the framework you are using). You can also choose to have a separate page for the Join Chatroom component. You are free to design your app as you see fit! 

On the backend, you would need to write endpoints to support requests sent by the client and handle connections, disconnections, and other functionalities. Moreover, each message has to be persisted, that is, saved to a database and read when that chatroom is visited.    

## PACKAGES TO INSTALL   

Websockets is supported by all modern browsers and can be assessed by its JS object on browser runtime but to make things simple, we will use a wrapper, in this case, socket.io. Choose your package based on the language of your backend server ([NodeJS][4], [Python/Django][3]) and the [client package][5] as per your need.


## OUTLINE OF STEPS

1. Make the "Join Room" component which, in its most basic form, is a simple form. On the frontend, import the socket client and emit a `join_room` message to the server (If you haven't written a server then you have to write one for this task. You can write in Django or NodeJS.) Something like the following:

```javascript

  const socket = io.connect('http://localhost:4000'); // URL of your backend server

  const joinRoomHandler = () => {
    if (room !== '' && username !== '') { // room and username are state variables
      socket.emit('join_room', { username, room });
    }

    navigate('/chat', { replace: true }); // See react-navigate or react-router-dom packages
  };
```

`room` and `username` are state variables and should be manipulated by hooks only. 

2. As the frontend emits events, the backend must be setup to listen for these. The following snippet shows how to listen for events in NodeJS:

```js

const express = require('express');
const app = express();

const { Server } = require('socket.io');
const server = http.createServer(app);

const io = new Server(server, {
  cors: {
    origin: 'http://localhost:3000', // URL of your frontend
    methods: ['GET', 'POST'],
  },
});

// Listen for when the client connects via socket.io-client
io.on('connection', (socket) => {
  console.log(`User connected ${socket.id}`);
});

```

3. Implementing rooms: Read up on [Sockets.io docs][6] to understand how rooms work. Using the Promise paradigm above (callbacks and using `.then()`), figure out how to emit a custom event from the frontend and handle it on the backend by listening for it. Or you can use the modern `async/await` paradigm. It's all up to you!   

4. Once a user joins a room, emit a notification to all other users saying something like `{Username} has joined the room` and a welcome message to the recently joined user. Similarly, add a leave button and show appropriate message to the channel. Read up on `socket.leave(room)` function.

5. The Chat page should have a list of users in the channel (keep an array on the server and update it on each user join or leave), the last 100 messages fetched from the database (for now you can keep an array on the server itself), and a form to submit a message. The "Send" button should trigger a `send_message` event and appropriately handle it on the server. Try to setup a database (MongoDB, PostgreSQL, HarperDB, or any of your fav!) locally or use a service online and write to the database on each new message. This can be of the following form:

```json
{
    username: USERNAME,
    room: ROOM,
    message: MESSAGE,
    timestamp: TIMESTAMP
}
```

6. We have successfully written to the database, now to read data on the frontend, use the `useEffect()` hook to run only once and update a state variable array to contain the list of most recent 100 messages sent so far. Once you get this data from the server (which reads from the DB), render it on the page. Until then show a loader (Figure out how to conditionally render components based on the value of state variables in React. Hint: use [`ternary operators`][7]). 

7. [Good UI/UX]: As new messages keep coming, it's a good idea to scroll the screen to the latest message and appropriately shift the topmost messages. Read up on `useRef()` React hook and when to use it.  

```js
 // Something like this
 // Scroll to the most recent message
  useEffect(() => {
    messagesColumnRef.current.scrollTop =
      messagesColumnRef.current.scrollHeight;
  }, [messagesRecieved]);
```

8. Render the user list by listening for `receive_chatroom_user_data` events from the server as follows:

```js
seEffect(() => {
    socket.on('receive_chatroom_user_data', (data) => {
      console.log(data);
      setRoomUsers(data); // new state variable, can you guess the type?
    });

    return () => socket.off('receive_chatroom_user_data');
  }, [socket]);
```

Loop over the list and render your components accordingly.   

9. Note that once a user leaves, you should handle the following things atleast: Disconnect user from socket using `socket.leave()`, update the user list currently in the room, emit a `User left the chat` message to the room, emit the newly updated list of users to the room, and redirect the user who left back to the "Join Chat" page.

10. [Good UI/UX]: If a user disconnects due to network drop, you should handle the case and broadcast a "user Left" accordingly. Socket.io provides a `disconnect` event for the same.   

```js
socket.on("disconnect", () => {
    ...
})
```

## CHALLENGES

This is, by no means, a "good" chat application so here are a few suggestions:   

1. Improve the user interface by writing CSS (or use a framework like [Bootstrap][8]).
2. Can you figure out how to send images? How can you save images in the database. Look at encoding methods like [Base64][9], etc. Research how industry chat apps store images and other media files. (Hint: typically storage buckets like AWS S3, etc)
3. Instead of a broadcast app, can you make a one-on-one chat option where all requests are sent to an `ADMIN USER` who can respond to each request. Note that this requires you to have authentication set up to identify who is who and appropriately change the UI. You may have to implement a page to see all pending conversations just like the home screen of whatsapp. 



[0]: https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API
[1]: https://discord.com
[2]: https://slack.com
[3]: https://pypi.org/project/python-socketio/
[4]: https://socket.io/docs/v4/server-installation/  
[5]: https://socket.io/docs/v4/client-installation/
[6]: https://socket.io/docs/v3/rooms/
[7]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Conditional_operator
[8]: https://getbootstrap.com/
[9]: https://en.wikipedia.org/wiki/Base64