#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$DIR"

if [ ! -d "$DIR/../node_modules" ]; then
  echo 'run `npm i` in project root';
  exit 1;
fi

./npm-setup.js ADMINBOX && \
./generate-configs.js ADMINBOX && \
./mvn-install.js ADMINBOX && \
./adminbox-oracle-setup.js
