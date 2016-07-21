#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$DIR"

if [ ! -d "$DIR/../node_modules" ]; then
  echo 'run `npm i` in project root';
  exit 1;
fi

./rtt-npm-setup.js && \
./jboss-setup.js && \
./mvn-install.js RTT && \
./rtt-oracle-setup.js

# oracle migration needs xbg-rtt-core so it's run after mvn install
