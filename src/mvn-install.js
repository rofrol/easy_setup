#!/usr/bin/env node
var config = require('./config.js');
config.main();
var chdir = require('./chdir');
require('shelljs/global');
var fs = require('fs-extra');
var path = require('path');

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

chdir(PROJECT_HOME, function() {
  exec('mvn clean' + mvnOffline() + ' install -T 4' + mvnUpdate() + mvnSkipTests() + mvnProfile());
});
