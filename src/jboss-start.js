require('dotenv').config({path: '.env'});
require('shelljs/global');
var path = require('path');

try {
  process.chdir(process.env.JBOSS_HOME + '/bin');

  process.env.JAVA_OPTS = "-XX:PermSize=512m -XX:MaxPermSize=512m";

  var isWin = /^win/.test(process.platform);

  if(isWin) {
    process.env.JBOSS_HOME = path.resolve(process.env.JBOSS_HOME).replace(/\\/g, '\\');
    exec('standalone.bat');
  } else {
    process.env.JBOSS_HOME = '/c' + process.env.JBOSS_HOME;
    exec('sh standalone.sh');
  }
}
catch (err) {
  console.log('chdir: ' + err);
}

// http://stackoverflow.com/questions/8683895/how-do-i-determine-the-current-operating-system-with-node-js
