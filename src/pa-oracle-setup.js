require('dotenv').config({path: '../.env'});
require('shelljs/global');

// sql

var db = 'sqlplus -s system/' + process.env.ORACLE_SYSTEM_PASSWORD + '@localhost:1521/xe';
exec('echo drop user pa cascade;').exec(db);
exec('echo drop user pawork cascade;').exec(db);
exec('echo exit', {silent:true}).exec(db);

// flyway

var path = require('path');

try {
  process.chdir(path.resolve(process.env.PROJECT_HOME, 'pa-storage'));
  exec('mvn compile flyway:migrate -e -Dflyway.locations=filesystem:src/main/resources/db/migration/pa -Dflyway.placeholders.paUser=PA -Dflyway.placeholders.paWorkUser=PAWORK -Dflyway.url=jdbc:oracle:thin:@localhost:1521:XE -Dflyway.table=schema_version -Dflyway.outOfOrder=false -Dflyway.user=PA -Dflyway.password=pa');
  exec('mvn compile flyway:migrate -e -Dflyway.locations=filesystem:src/main/resources/db/migration/pawork -Dflyway.placeholders.paUser=PA -Dflyway.placeholders.paWorkUser=PAWORK -Dflyway.url=jdbc:oracle:thin:@localhost:1521:XE -Dflyway.table=schema_version -Dflyway.outOfOrder=false -Dflyway.user=PAWORK -Dflyway.password=pawork');
}
catch (err) {
  console.log('chdir: ' + err);
}

// Operation not authorized: Sie verf▒gen nicht ▒ber ausreichende Berechtigungen.
// Title: [PA] Permissions update
// From: Ostrowka Pawel
// Date: 2016-04-01 18:17
var c = "echo INSERT INTO PA_ROLE_RIGHT_STATIC (PA_ROLE, PA_RIGHT, CREATED_DATE, VERSION, AGENT, INHERITABLE) VALUES ('ZSC_AWT_BERATER_DE', 'PA', sysdate, sysdate, 'Adminbox\', 'N');";
console.log('c:', c);
exec(c).exec('sqlplus -s pa/pa@localhost:1521/xe');

// http://stackoverflow.com/questions/19803748/change-working-directory-in-my-current-shell-context-when-running-node-script
