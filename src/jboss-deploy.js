require('dotenv').config({path: '../.env'});
require('shelljs/global');
var fs = require('fs-extra');
var path = require('path');

var PROJECT_HOME = process.env[process.env.MAIN + '_HOME'];
var PROJECT_WAR = PROJECT_HOME + '/' + process.env[process.env.MAIN + '_WAR'];

function ifOffline() {
  return process.env.OFFLINE === 'true'? '-o': '';
}

function ifUpdate() {
  return process.env.OFFLINE === 'true'? '': '-U';
}

try {
  process.chdir(PROJECT_HOME);

  //maybe not needed anymore
  exec('git checkout 5f24678 -- pa-web/src/main/java/de/mlp/xbg/pa/adapter/CrmAdapter.java');
  
  exec('mvn clean ' + ifOffline() + ' install -T 4 ' + ifUpdate() + ' -DskipTests -P development');
}
catch (err) {
  console.log('chdir: ' + err);
}

fs.removeSync(process.env.JBOSS_HOME + '/standalone/deployments/*.war*');
fs.copySync(PROJECT_WAR, process.env.JBOSS_HOME + '/standalone/deployments/' + path.basename(PROJECT_WAR));
