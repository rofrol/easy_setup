#!/usr/bin/env node
var config = require('./config.js');
var chdir = require('./chdir');
require('shelljs/global');

var user = require('./user.js');

// sql

exec('echo exit', {silent:true}).exec(config.SQLPLUS_AS_SYSTEM + ' @oracle/create-tablespaces.sql');

user.dropUserIfExists('PARTT');
user.dropUserIfExists('PARTTWORK');
exec('echo exit', {silent:true}).exec(config.SQLPLUS_AS_SYSTEM + ' @' + process.env.RTT_HOME + '/config/local/usersPARTT.sql');

// flyway

var path = require('path');

function mvnOffline() {
  return process.env.OFFLINE === 'true'? '-o': '';
}

chdir(process.env.RTT_HOME + '/xbg-rtt-core', function() {
  exec('mvn clean compile ' + mvnOffline() + ' flyway:migrate -e -Dflyway.locations=filesystem:src/main/resources/db/migration/rtt -Dflyway.placeholders.rttUser=PARTT -Dflyway.placeholders.rttWorkUser=PARTTWORK -Dflyway.url=jdbc:oracle:thin:@localhost:1521:XE -Dflyway.table=schema_version -Dflyway.outOfOrder=false -Dflyway.user=PARTT -Dflyway.password=partt');
  exec('mvn clean compile ' + mvnOffline() + ' flyway:migrate -e -Dflyway.locations=filesystem:src/main/resources/db/migration/rttwork -Dflyway.placeholders.rttUser=PARTT -Dflyway.placeholders.rttWorkUser=PARTTWORK -Dflyway.url=jdbc:oracle:thin:@localhost:1521:XE -Dflyway.table=schema_version -Dflyway.outOfOrder=false -Dflyway.user=PARTTWORK -Dflyway.password=parttwork');
});

// http://stackoverflow.com/questions/19803748/change-working-directory-in-my-current-shell-context-when-running-node-script
