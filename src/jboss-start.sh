#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. ${DIR}/env.sh

if [ -z "$JBOSS_HOME" ]; then
  echo "JBOSS_HOME not set"
  exit 1
fi

export JAVA_OPTS="-XX:PermSize=512m -XX:MaxPermSize=512m"
cd "$JBOSS_HOME"/bin
sh standalone.sh
