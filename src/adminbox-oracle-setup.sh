#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. ${DIR}/env.sh

if [ -z "$JBOSS_HOME" ]; then
  echo "JBOSS_HOME not set"
  exit 1
fi

cd ${DIR}

echo -e "drop user paab cascade; \n drop user paabwork cascade;" | sqlplus -s system/${ORACLE_SYSTEM_PASSWORD}@localhost:1521/xe
exit | sqlplus -s system/${ORACLE_SYSTEM_PASSWORD}@localhost:1521/xe @admninbox-users.sql
