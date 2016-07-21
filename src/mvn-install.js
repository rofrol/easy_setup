#!/usr/bin/env node
require('dotenv').config();
require('shelljs/global');
var fs = require('fs-extra');
var path = require('path');
var config = require('./config.js');

var PROJECT_HOME = config.projectHome();

function mvnOffline() {
    return process.env.OFFLINE === 'true'? ' -o': '';
}

function mvnUpdate() {
  return process.env.MVN_UPDATE === 'true'? ' -U': '';
}

function mvnProfile() {
  return process.env.MVN_PROFILE !== ''? ' -P ' + process.env.MVN_PROFILE: '';
}

function mvnSkipTests() {
  return process.env.MVN_SKIPTESTS === 'true'? ' -DskipTests': '';
}

try {
  process.chdir(PROJECT_HOME);
  exec('mvn clean' + mvnOffline() + ' install -T 4' + mvnUpdate() + mvnSkipTests() + mvnProfile());
}
catch (err) {
  console.log('chdir: ' + err);
}
