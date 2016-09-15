#!/usr/bin/env node
process.env.MAIN = 'ADMINBOX';
var config = require('./config.js');
var chdir = require('./chdir');
var npm_install = require('./npm_install');
var fs = require('fs-extra');
var rimraf = require('rimraf');

if(process.env.OFFLINE === 'true') {
  console.log('Exiting from ' + __filename + ' because OFFLINE === true')
  process.exit();
}

require('shelljs/global');

if(process.env.MAIN == 'PA') {
    npm_install('gulp');
} else {
    npm_install('grunt');
}

chdir(config.projectWeb(), function() {
  if(process.env.NPM_CLEAN === 'true') {
    rimraf.sync('node_modules');
  }

  exec('npm i node-sass@3.4.2');
  exec('npm i');

  if(process.env.MAIN == 'PA') {
      exec('gulp development');
  } else {
      exec('grunt');
  }
});
