require('dotenv').config({path: '.env'});

if(process.env.OFFLINE === 'true') {
  process.exit();
}

require('shelljs/global');
var fs = require('fs-extra');

exec('npm i -g grunt');

var path = require('path');

try {
  process.chdir(process.env.ADMINIBOX_HOME + '/xbg-ab-web');
  fs.removeSync('node_modules')
  exec('npm i node-sass@3.4.2');
  exec('npm i');
  exec('grunt');
}
catch (err) {
  console.log('chdir: ' + err);
}
