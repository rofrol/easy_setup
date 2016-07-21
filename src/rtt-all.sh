#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$DIR"

if [ ! -d "$DIR/../node_modules" ]; then
  echo 'run `npm i` in project root';
  exit 1;
fi

./rtt-oracle-setup.js && \
./rtt-npm-setup.js && \
./jboss-setup.js && \
./jboss-deploy.js RTT
