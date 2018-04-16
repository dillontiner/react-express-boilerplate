```
npm init react-express-boilerplate
cd react-express-boilerplate
touch README.md

mkdir server
touch index.js
npm install --save express
npm install --save-dev concurrently
```
Scripts from tutorial https://medium.freecodecamp.org/how-to-make-create-react-app-work-with-a-node-backend-api-7c5c48acb1b0

```
create-react-app client
cd client
vi package.json
```
Add line for proxy to package.json
`"proxy": "http://localhost:5000/"`

We can make our repo
```
git remote add origin [repo .git file]
git add -A .
git commit -m "Initialize"
git push -u origin master
```

examples of what I hope to accomplish
https://github.com/mars/heroku-cra-node
http://ericsowell.com/blog/2017/5/16/create-react-app-and-express


Creating a server folder with file index.js creates a module we can run by calling npm server.
Paste express hello world code in `server/index.js` https://expressjs.com/en/starter/hello-world.html

Create react app client, we want to expose this through the express server


