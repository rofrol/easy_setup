#!/usr/bin/env node
var config = require('./config.js');

var connect = require('connect');
var serveStatic = require('serve-static');
var history = require('connect-history-api-fallback');
var http = require('http');
var app = connect();
var path = require('path');

app.use(require('connect-livereload')({
  port: 35729,
  ignore: ['.svg']
}));

app.use(history());

var dir = path.dirname(path.dirname(config.projectWar())) + '/src/main/webapp';
console.log('web dir:', dir);
app.use(serveStatic(dir));
app.use(serveStatic(__dirname + '/static'));

http.createServer(app).listen(8126);
