#!/usr/bin/env node
require('dotenv').config();

if(process.env.OFFLINE === 'true') {
  process.exit();
}

require('shelljs/global');
var fs = require('fs-extra');

exec('npm i -g gulp');

var path = require('path');

try {
  process.chdir(process.env.PA_HOME + '/pa-web');
  if(process.env.NPM_CLEAN === 'true') fs.removeSync('node_modules')
  exec('npm i node-sass@3.4.2');
  exec('npm i');
  exec('gulp development');
}
catch (err) {
  console.log('chdir: ' + err);
}
