require('dotenv').config({path: '../.env'});
require('shelljs/global');
var fs = require('fs-extra');
var path = require('path');

var MAIN = process.argv.slice(2)[0];

var PROJECT_HOME = process.env[MAIN + '_HOME'];
var PROJECT_WAR = PROJECT_HOME + '/' + process.env[MAIN + '_WAR'];

function offline(option) {
    if(option === 'mvnOffline') return process.env.OFFLINE === 'true'? '-o': '';
    if(option === 'mvnUpdate') return process.env.OFFLINE === 'true'? '': '-U';
    if(option === 'mvnProfile') return process.env.OFFLINE === 'true'? '-P development': '';
}

function mvnUpdate() {
  return process.env.OFFLINE === 'true'? '': '-U';
}

function mvnUpdate() {
  return process.env.OFFLINE === 'true'? '': '-U';
}

try {
  process.chdir(PROJECT_HOME);
  // `-P development` probably not needed, as we need to run grunt/gulp manually anyway
  exec('mvn clean ' + offline('mvnOffline') + ' install -T 4 ' + offline('mvnUpdate') + ' -DskipTests'  + offline('mvnProfile'));
}
catch (err) {
  console.log('chdir: ' + err);
}

fs.removeSync(process.env.JBOSS_HOME + '/standalone/deployments/*.war*');
fs.copySync(PROJECT_WAR, process.env.JBOSS_HOME + '/standalone/deployments/' + path.basename(PROJECT_WAR));
