### React Express Boilerplate

Feel free to use this to get your project rolling or take a look at the steps below to get the same thing up and running.


### Creating the boilerplate from scratch

## Prerequisite Installations
Node
If you haven't already, install `create-react-app` globally
```
npm install -g create-react-app
```

## Create a new node project
```
mkdir project
cd project
npm init
```

## Server setup
```
mkdir server
npm install --save express
npm install --save-dev concurrently
```

Edit the `package.json` scripts to be the following
```
"scripts": {
  "build": "cd client && npm run build",
  "start": "node server",
  "test": "echo \"Error: no test specified\" && exit 1"
},
```

Make a file called `server/index.js` and paste the following as its contents:

```
const express = require('express');
const path = require('path');

const PORT = process.env.PORT || 5000;

const app = express();

// Priority serve any static files.
app.use(express.static(path.resolve(__dirname, '../client/build')));

// Answer API requests.
app.get('/api', function (req, res) {
  res.set('Content-Type', 'application/json');
  res.send('{"message":"Hello from the custom server!"}');
});

// All remaining requests return the React app, so it can handle routing.
app.get('*', function(request, response) {
  response.sendFile(path.resolve(__dirname, '../client/build', 'index.html'));
});

app.listen(PORT, function () {
  console.error(`Node cluster worker ${process.pid}: listening on port ${PORT}`);
});
```

## Client setup
```
create-react-app client
```

Add `"proxy": "http://localhost:5000/"` to `client/package.json`

The server uses the build assets to 
````
cd client && npm run build
```

