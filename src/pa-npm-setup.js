require('dotenv').config({path: '../.env'});
require('shelljs/global');
var fs = require('fs-extra');

exec('npm i -g gulp');

var path = require('path');

try {
  process.chdir(process.env.PROJECT_HOME + '/pa-web');
  fs.removeSync('node_modules')
  exec('npm i node-sass@3.4.2');
  exec('npm i');
}
catch (err) {
  console.log('chdir: ' + err);
}