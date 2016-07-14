#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. ${DIR}/env.sh

if [ -z "$PROJECT_HOME" ]; then
  echo "PROJECT_HOME not set"
  exit 1
fi

npm i -g gulp
cd ${PROJECT_HOME}/pa-web
rm -rf node_modules
npm i node-sass@3.4.2
npm i