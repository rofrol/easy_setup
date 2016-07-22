#!/usr/bin/env node
var config = require('./config.js');
var chdir = require('./chdir');

if(process.env.OFFLINE === 'true') {
  process.exit();
}

require('shelljs/global');
var fs = require('fs-extra');
var path = require('path');

exec('npm i -g gulp');

chdir(process.env.PA_HOME + '/pa-web', function() {
  if(process.env.NPM_CLEAN === 'true') fs.removeSync('node_modules');
  exec('npm i node-sass@3.4.2');
  exec('npm i');
  exec('gulp development');
});
