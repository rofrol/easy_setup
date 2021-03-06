#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$DIR"

if [ ! -d "$DIR/../node_modules" ]; then
  echo 'run `npm i`';
  exit 1;
fi

./npm-setup.js PA && \
./generate-configs.js PA && \
./mvn-install.js PA && \
./pa-oracle-setup.js
