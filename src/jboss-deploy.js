require('dotenv').config({path: '../.env'});
require('shelljs/global');
var fs = require('fs-extra');

var path = require('path');

var PROJECT_HOME = process.env[process.env.MAIN + '_HOME'];
var PROJECT_WAR = PROJECT_HOME + '/' + process.env[process.env.MAIN + '_WAR'];

try {

  process.chdir(PROJECT_HOME);

  if(process.env.OFFLINE === 'true') {
    exec('mvn clean install -T 4 -DskipTests -P development');
  } else {
    exec('mvn clean install -T 4 -U -DskipTests -P development');
  }

  fs.removeSync(process.env.JBOSS_HOME + '/standalone/deployments/*.war*');
  fs.copySync(PROJECT_WAR, process.env.JBOSS_HOME + '/standalone/deployments/' + path.basename(PROJECT_WAR));
}
catch (err) {
  console.log('chdir: ' + err);
}
