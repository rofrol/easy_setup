#!/usr/bin/env node
var config = require('./config.js');
var chdir = require('./chdir');

if(process.env.OFFLINE === 'true') {
  process.exit();
}

require('shelljs/global');
var fs = require('fs-extra');

exec('npm i -g grunt');

var path = require('path');

chdir(process.env.RTT_HOME + '/xbg-rtt-web', function() {
  fs.removeSync('node_modules')
  exec('npm i node-sass@3.4.2');
  exec('npm i');
  exec('grunt');
});
