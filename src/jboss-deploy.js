require('dotenv').config({path: '../.env'});
require('shelljs/global');
var fs = require('fs-extra');
var path = require('path');

var MAIN = process.argv.slice(2)[0];

var PROJECT_HOME = process.env[MAIN + '_HOME'];
var PROJECT_WAR = PROJECT_HOME + '/' + process.env[MAIN + '_WAR'];

function mvnOffline() {
  return process.env.OFFLINE === 'true'? '-o': '';
}

function mvnUpdate() {
  return process.env.OFFLINE === 'true'? '': '-U';
}

try {
  process.chdir(PROJECT_HOME);
  // development probably not needed, as we need to run grunt/gulp manually anyway
  // exec('mvn clean ' + mvnOffline() + ' install -T 4 ' + mvnUpdate() + ' -DskipTests -P development');
  exec('mvn clean ' + mvnOffline() + ' install -T 4 ' + mvnUpdate() + ' -DskipTests');
}
catch (err) {
  console.log('chdir: ' + err);
}

fs.removeSync(process.env.JBOSS_HOME + '/standalone/deployments/*.war*');
fs.copySync(PROJECT_WAR, process.env.JBOSS_HOME + '/standalone/deployments/' + path.basename(PROJECT_WAR));
