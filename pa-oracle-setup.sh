#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. ${DIR}/env.sh

if [ -z "$JBOSS_HOME" ]; then
  echo "JBOSS_HOME not set"
  exit 1
fi

cd ${DIR}

# sql

echo -e "drop user pa cascade; \n drop user pawork cascade;" | sqlplus -s system/${ORACLE_SYSTEM_PASSWORD}@localhost:1521/xe
exit | sqlplus -s system/${ORACLE_SYSTEM_PASSWORD}@localhost:1521/xe @pa-users.sql

# flyway

cd ${PROJECT_HOME}/pa-storage

mvn compile flyway:migrate -e -Dflyway.locations=filesystem:src/main/resources/db/migration/pa -Dflyway.placeholders.paUser=PA -Dflyway.placeholders.paWorkUser=PAWORK -Dflyway.url=jdbc:oracle:thin:@localhost:1521:XE -Dflyway.table=schema_version -Dflyway.outOfOrder=false -Dflyway.user=PA -Dflyway.password=pa
mvn compile flyway:migrate -e -Dflyway.locations=filesystem:src/main/resources/db/migration/pawork -Dflyway.placeholders.paUser=PA -Dflyway.placeholders.paWorkUser=PAWORK -Dflyway.url=jdbc:oracle:thin:@localhost:1521:XE -Dflyway.table=schema_version -Dflyway.outOfOrder=false -Dflyway.user=PAWORK -Dflyway.password=pawork

# Operation not authorized: Sie verf▒gen nicht ▒ber ausreichende Berechtigungen.
# Title: [PA] Permissions update
# From: Ostrowka Pawel
# Date: 2016-04-01 18:17
echo -e "INSERT INTO PA_ROLE_RIGHT_STATIC (PA_ROLE, PA_RIGHT, CREATED_DATE, VERSION, AGENT, INHERITABLE) VALUES ('ZSC_AWT_BERATER_DE', 'PA', sysdate, sysdate, 'Adminbox', 'N');" | sqlplus -s pa/pa@localhost:1521/xe
