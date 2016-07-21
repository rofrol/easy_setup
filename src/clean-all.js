require('dotenv').config({path: '.env'});
require('shelljs/global');
var path = require('path');
var rimraf = require('rimraf');


// sql

var db = require('./db.js');

exec('echo exit', {silent:true}).exec(db.SQLPLUS_AS_SYSTEM + ' @oracle/drop-tablespaces.sql');

function getUserHome() {
  return process.env[(process.platform == 'win32') ? 'USERPROFILE' : 'HOME'];
}

console.log('removing ~/.m2');
rimraf.sync(getUserHome() + '/.m2');

console.log('removing JBOSS_HOME)');
rimraf.sync(process.env.JBOSS_HOME);

try {
  process.chdir(process.env.JBOSS_HOME + '/..');
  var JBOSS_ZIP = process.env.JBOSS_VERSION === 'jboss-eap-6.2'? 'jboss-eap-6.2.0.zip': process.env.JBOSS_VERSION + '.zip';
  exec('unzip ' + JBOSS_ZIP);
}
catch (err) {
  console.log('chdir: ' + err);
}

console.log('cleaning git repos');

try {
  process.chdir(process.env.PA_HOME);
  rimraf.sync('pa-web/node_modules')
  exec('git clean -fdx');
  exec('git checkout -f master');
}
catch (err) {
  console.log('chdir: ' + err);
}

try {
  process.chdir(process.env.ADMINBOX_HOME);
  rimraf.sync('xbg-ab-web/node_modules')
  exec('git clean -fdx');
  exec('git checkout -f develop-pa');

}
catch (err) {
  console.log('chdir: ' + err);
}

try {
  process.chdir(process.env.RTT_HOME);
  rimraf.sync('xbg-rtt-web/node_modules')
  exec('git clean -fdx');
  exec('git checkout -f master');
}
catch (err) {
  console.log('chdir: ' + err);
}
