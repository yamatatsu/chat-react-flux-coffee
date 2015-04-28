var http = require('http');
var express = require('express');
var app = express();
var port = process.env.PORT || 5010;

//////////////////////
// setting http
app.use(express.static(__dirname + '/public'));
app.use(express.static(__dirname + '/build/public'));

var server = http.createServer(app);
server.listen(port);
console.log("surver running at localhost:" + port);
