const express = require('express')
const app = express()

app.get('/', (req, res) => res.send('Hello World!'))

app.get('/api/hello', (req, res) => {
  res.send({ express: 'Hello From Express' });
});

app.listen(5000, () => console.log('Example app listening on port 5000!'))
