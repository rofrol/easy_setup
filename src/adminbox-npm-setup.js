#!/usr/bin/env node
var config = require('./config.js');
var chdir = require('./chdir');
var npm_install = require('./npm_install');

if(process.env.OFFLINE === 'true') {
  process.exit();
}

require('shelljs/global');
var fs = require('fs-extra');

npm_install('grunt');

var path = require('path');

chdir(process.env.ADMINBOX_HOME + '/xbg-ab-web', function() {
  fs.removeSync('node_modules')
  exec('npm i node-sass@3.4.2');
  exec('npm i');
  exec('grunt');
});
