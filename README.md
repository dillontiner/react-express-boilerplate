# React Express Boilerplate

Use this to get your project rolling or take a look at the steps below to get the same thing boilerplate up and running from scratch.

To run the repository
```
git clone https://github.com/dillontiner/react-express-boilerplate.git my-project
cd my-project
npm run all-install && npm run build
npm start
```


# Deploying this as a Docker image

The `Makefile` in this repository contains a `zip` target that will prepare the assets for an Elastic Beanstalk deployment on AWS. From the project directory, run 
```
make zip
```
to create `react-express.zip` and upload it as part of [these steps](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/docker-singlecontainer-deploy.html) on deploying a Docker container to AWS.

# Creating the Boilerplate 

Follow these instructions if you're curious about how everything is actually put together.

http://ericsowell.com/blog/2017/5/16/create-react-app-and-express

### Prerequisite Installations
- [Node](https://nodejs.org/en/download/)
- Create React App CLI, `npm install -g create-react-app`
- [Docker CE](https://www.docker.com/community-edition)

### Create a new node project
```
mkdir project
cd project
npm init
```

### Server setup
```
mkdir server
npm install --save express
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

// All remaining requests return the React app, so it can handle routing.
app.get('*', function(request, response) {
  response.sendFile(path.resolve(__dirname, '../client/build', 'index.html'));
});

app.listen(PORT, function () {
  console.error(`Node listening on port ${PORT}`);
});
```

### Client setup
```
create-react-app client
```

Add `"proxy": "http://localhost:5000/"` to `client/package.json`

Our server uses the `client/build` directory to serve files, so run
```
cd client
npm run build
```

as a final step to prepare those files. Now, the project will work when we start it up from the project's root directory
```
# Make sure you're in the project's root directory
cd ../
npm start
```

# Resources

[Tutorial](https://medium.freecodecamp.org/how-to-make-create-react-app-work-with-a-node-backend-api-7c5c48acb1b0) that can help you get an express API