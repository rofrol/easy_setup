#!/usr/bin/env node
var config = require('./config.js');
var chdir = require('./chdir');
var npm_install = require('./npm_install');
var fs = require('fs-extra');
var rimraf = require('rimraf');

if(process.env.OFFLINE === 'true') {
  console.log('Exiting because OFFLINE === true')
  process.exit();
}

require('shelljs/global');

npm_install('grunt');

chdir(process.env.ADMINBOX_HOME + '/xbg-ab-web', function() {
  if(process.env.NPM_CLEAN === 'true') {
    rimraf.sync('node_modules');
  }

  exec('npm i node-sass@3.4.2');
  exec('npm i');
  exec('grunt');
});
