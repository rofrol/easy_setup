require('dotenv').config({path: '../.env'});
require('shelljs/global');
var path = require('path');

try {
  process.chdir(process.env.JBOSS_HOME + '/bin');
  console.log(path.resolve(process.env.JBOSS_HOME));
  process.env.JAVA_OPTS = "-XX:PermSize=512m -XX:MaxPermSize=512m";
  process.env.JBOSS_HOME = path.resolve(process.env.JBOSS_HOME).replace(/\\/g, '\\');
  exec('standalone.bat');
}
catch (err) {
  console.log('chdir: ' + err);
}
