#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. ${DIR}/env.sh

if [ -z "$JBOSS_HOME" ]; then
  echo "JBOSS_HOME not set"
  exit 1
fi

if [ -z "$PROJECT_HOME" ]; then
  echo "PROJECT_HOME not set"
  exit 1
fi

rm -rf ${PROJECT_TARGET}/*.war
cd ${PROJECT_HOME}
#mvn clean install -T 4 -U -DskipTests -P development
mvn clean install -T 4 -DskipTests

rm -rf "${JBOSS_HOME}"/standalone/deployments/*.war*

cp ${PROJECT_TARGET}/*.war "${JBOSS_HOME}"/standalone/deployments/
