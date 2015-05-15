var express = require('express');
var app = express();
var port = process.env.PORT || 5010;

app.use(express.static('public'));
app.use(express.static('build/public'));

app.get('/', function(req, res){
  res.send('hello world');
});

app.listen(port);
console.log("surver running at localhost:" + port);
