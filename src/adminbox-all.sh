#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$DIR"

if [ ! -d "$DIR/../node_modules" ]; then
  echo 'run `npm i` in project root';
  exit 1;
fi

node adminbox-oracle-setup.js && \
node adminbox-npm-setup.js && \
node jboss-setup.js && \
node jboss-deploy.js ADMINBOX
