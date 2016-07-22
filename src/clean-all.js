#!/usr/bin/env node
var config = require('./config.js');
require('shelljs/global');
var path = require('path');
var rimraf = require('rimraf');


// sql

exec('echo exit', {silent:true}).exec(config.SQLPLUS_AS_SYSTEM + ' @oracle/drop-tablespaces.sql');

function getUserHome() {
  return process.env[(process.platform == 'win32') ? 'USERPROFILE' : 'HOME'];
}

console.log('removing ~/.m2');
rimraf.sync(getUserHome() + '/.m2');

console.log('removing JBOSS_HOME)');
rimraf.sync(process.env.JBOSS_HOME);

chdir(process.env.JBOSS_HOME + '/..', function() {
  var JBOSS_ZIP = process.env.JBOSS_VERSION === 'jboss-eap-6.2'? 'jboss-eap-6.2.0.zip': process.env.JBOSS_VERSION + '.zip';
  exec('unzip ' + JBOSS_ZIP);
});

console.log('cleaning git repos');

chdir(process.env.PA_HOME, function() {
  rimraf.sync('pa-web/node_modules')
  exec('git clean -fdx');
  exec('git checkout -f master');
});

chdir(process.env.ADMINBOX_HOME, function() {
  rimraf.sync('xbg-ab-web/node_modules')
  exec('git clean -fdx');
  exec('git checkout -f develop-pa');
});

chdir(process.env.RTT_HOME, function() {
  rimraf.sync('xbg-rtt-web/node_modules')
  exec('git clean -fdx');
  exec('git checkout -f master');
});
