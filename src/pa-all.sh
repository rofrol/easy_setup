#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$DIR"

if [ ! -d "$DIR/../node_modules" ]; then
  echo 'run `npm i`';
  exit 1;
fi

./pa-oracle-setup.js && \
./pa-npm-setup.js && \
./jboss-setup.js && \
./jboss-deploy.js PA
