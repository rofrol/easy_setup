#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$DIR"

if [ ! -d "$DIR/../node_modules" ]; then
  echo 'run `npm i` in project root';
  exit 1;
fi

./adminbox-npm-setup.js && \
./generate-configs.js && \
./mvn-install.js ADMINBOX && \
./adminbox-oracle-setup.js
