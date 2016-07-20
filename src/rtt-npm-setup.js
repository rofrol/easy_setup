require('dotenv').config({path: '../.env'});

if(process.env.OFFLINE === 'true') {
  process.exit();
}

require('shelljs/global');
var fs = require('fs-extra');

exec('npm i -g grunt');

var path = require('path');

var PROJECT_HOME = process.env[process.env.MAIN + '_HOME'];


try {
  process.chdir(PROJECT_HOME + '/xbg-rtt-web');
  fs.removeSync('node_modules')
  exec('npm i node-sass@3.4.2');
  exec('npm i');
  exec('grunt');
}
catch (err) {
  console.log('chdir: ' + err);
}
