require('dotenv').config({path: '../.env'});
require('shelljs/global');
var fs = require('fs-extra');
var path = require('path');

var MAIN = process.argv.slice(2)[0];

var PROJECT_HOME = process.env[MAIN + '_HOME'];
var PROJECT_WAR = PROJECT_HOME + '/' + process.env[MAIN + '_WAR'];

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
  exec('mvn clean' + mvnOffline() + ' install -T 4' + mvnUpdate() + mvnSkipTests() + mvnProfile();
}
catch (err) {
  console.log('chdir: ' + err);
}

fs.removeSync(process.env.JBOSS_HOME + '/standalone/deployments/*.war*');
fs.copySync(PROJECT_WAR, process.env.JBOSS_HOME + '/standalone/deployments/' + path.basename(PROJECT_WAR));
