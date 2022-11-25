const express = require('express')
const bodyParser = require('body-parser')
const request = require('request');

const app = express();
const port = 3000
const prismUrl = "http://127.0.0.1:4010"

app.use(bodyParser.urlencoded({ extended: true }));
app.set('state', null)

app.get('/state', (req, res) => {
  res.json({state: app.settings.state})
})

app.post('/state', (req, res) => {
  app.set('state', req.body.state);
  console.log(`state changed to ${req.body.state}`)
  res.sendStatus(200);
})

// https://stackoverflow.com/questions/7559862/no-response-using-express-proxy-route/20539239#20539239
app.use('/prism', function(req, res) {
  var url = prismUrl + req.url;
  req.headers['prefer'] = `example=${app.settings.state}`
  req.pipe(request(url)).pipe(res);
});

app.listen(port, (err) => {
  if (err) {
    return console.log('something bad happened', err)
  }
  console.log(`server is listening on ${port}`)
})
