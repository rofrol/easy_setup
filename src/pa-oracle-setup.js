require('dotenv').config({path: '../.env'});
require('shelljs/global');

// sql

var db = require('./db.js');

exec('echo exit', {silent:true}).exec(db.DB + ' @oracle/create-tablespaces.sql');
exec('echo exit', {silent:true}).exec(db.DB + ' @oracle/pa-users.sql');

// flyway

var path = require('path');

function ifOffline() {
  return process.env.OFFLINE === 'true'? '-o': '';
}

var PROJECT_HOME = process.env[process.env.MAIN + '_HOME'];

try {
  process.chdir(PROJECT_HOME + '/pa-storage');
  exec('mvn compile ' + ifOffline() + ' flyway:migrate -e -Dflyway.locations=filesystem:src/main/resources/db/migration/pa -Dflyway.placeholders.paUser=PA -Dflyway.placeholders.paWorkUser=PAWORK -Dflyway.url=jdbc:oracle:thin:@localhost:1521:XE -Dflyway.table=schema_version -Dflyway.outOfOrder=false -Dflyway.user=PA -Dflyway.password=pa');
  exec('mvn compile ' + ifOffline() + ' flyway:migrate -e -Dflyway.locations=filesystem:src/main/resources/db/migration/pawork -Dflyway.placeholders.paUser=PA -Dflyway.placeholders.paWorkUser=PAWORK -Dflyway.url=jdbc:oracle:thin:@localhost:1521:XE -Dflyway.table=schema_version -Dflyway.outOfOrder=false -Dflyway.user=PAWORK -Dflyway.password=pawork');
}
catch (err) {
  console.log('chdir: ' + err);
}

// Operation not authorized: Sie verf▒gen nicht ▒ber ausreichende Berechtigungen.
// Title: [PA] Permissions update
// From: Ostrowka Pawel
// Date: 2016-04-01 18:17
exec("echo INSERT INTO PA_ROLE_RIGHT_STATIC (PA_ROLE, PA_RIGHT, CREATED_DATE, VERSION, AGENT, INHERITABLE) VALUES ('ZSC_AWT_BERATER_DE', 'PA', sysdate, sysdate, 'Adminbox', 'N');", {silent:true})
.exec('sqlplus -s pa/pa@' + db.ORACLE_HOSTNAME);

// http://stackoverflow.com/questions/19803748/change-working-directory-in-my-current-shell-context-when-running-node-script
