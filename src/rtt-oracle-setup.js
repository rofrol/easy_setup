#!/usr/bin/env node
require('dotenv').config();
require('shelljs/global');

// sql

var db = require('./db.js');

exec('echo exit', {silent:true}).exec(db.SQLPLUS_AS_SYSTEM + ' @oracle/create-tablespaces.sql');
exec('echo exit', {silent:true}).exec(db.SQLPLUS_AS_SYSTEM + ' @oracle/rtt-users.sql');
exec('echo exit', {silent:true}).exec(db.SQLPLUS_AS_SYSTEM + ' @' + process.env.RTT_HOME + '/config/local/usersPARTT.sql');

// flyway

var path = require('path');

function mvnOffline() {
  return process.env.OFFLINE === 'true'? '-o': '';
}

try {
  process.chdir(process.env.RTT_HOME + '/xbg-rtt-core');
  exec('mvn clean compile ' + mvnOffline() + ' flyway:migrate -e -Dflyway.locations=filesystem:src/main/resources/db/migration/rtt -Dflyway.placeholders.rttUser=PARTT -Dflyway.placeholders.rttWorkUser=PARTTWORK -Dflyway.url=jdbc:oracle:thin:@localhost:1521:XE -Dflyway.table=schema_version -Dflyway.outOfOrder=false -Dflyway.user=PARTT -Dflyway.password=partt');
  exec('mvn clean compile ' + mvnOffline() + ' flyway:migrate -e -Dflyway.locations=filesystem:src/main/resources/db/migration/rttwork -Dflyway.placeholders.rttUser=PARTT -Dflyway.placeholders.rttWorkUser=PARTTWORK -Dflyway.url=jdbc:oracle:thin:@localhost:1521:XE -Dflyway.table=schema_version -Dflyway.outOfOrder=false -Dflyway.user=PARTTWORK -Dflyway.password=parttwork');
}
catch (err) {
  console.log('chdir: ' + err);
}

// http://stackoverflow.com/questions/19803748/change-working-directory-in-my-current-shell-context-when-running-node-script
