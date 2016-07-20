#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$DIR"

if [ ! -d "$DIR/../node_modules" ]; then
  echo 'run `npm i` in project root';
  exit 1;
fi

node rtt-oracle-setup.js && \
node jboss-setup.js && \
node jboss-deploy.js RTT && \
node jboss-start.js
