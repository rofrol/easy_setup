#!/usr/bin/env node
var config = require('./config.js');
require('shelljs/global');
var path = require('path');
var fs = require('fs-extra');
var chdir = require('./chdir');

var PROJECT_WAR = config.projectWar();

fs.removeSync(process.env.JBOSS_HOME + '/standalone/deployments/*.war*');
fs.copySync(PROJECT_WAR, process.env.JBOSS_HOME + '/standalone/deployments/' + path.basename(PROJECT_WAR));

chdir(process.env.JBOSS_HOME + '/bin', function() {
  process.env.JAVA_OPTS = "-XX:PermSize=512m -XX:MaxPermSize=512m";

  var isWin = /^win/.test(process.platform);

  if(isWin) {
    process.env.JBOSS_HOME = path.resolve(process.env.JBOSS_HOME).replace(/\\/g, '\\');
    exec('standalone.bat');
  } else {
    process.env.JBOSS_HOME = '/c' + process.env.JBOSS_HOME;
    exec('sh standalone.sh');
  }
});

// http://stackoverflow.com/questions/8683895/how-do-i-determine-the-current-operating-system-with-node-js
