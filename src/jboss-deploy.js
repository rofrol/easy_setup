require('dotenv').config({path: '../.env'});
require('shelljs/global');
var fs = require('fs-extra');
var path = require('path');

var PROJECT_HOME = process.env[process.env.MAIN + '_HOME'];
var PROJECT_WAR = PROJECT_HOME + '/' + process.env[process.env.MAIN + '_WAR'];

function offline() {
  return process.env.OFFLINE === 'true'? '': '-U';
}

try {
  process.chdir(PROJECT_HOME);
  exec('mvn clean install -T 4 ' + offline() + ' -DskipTests -P development');
}
catch (err) {
  console.log('chdir: ' + err);
}

fs.removeSync(process.env.JBOSS_HOME + '/standalone/deployments/*.war*');
fs.copySync(PROJECT_WAR, process.env.JBOSS_HOME + '/standalone/deployments/' + path.basename(PROJECT_WAR));
