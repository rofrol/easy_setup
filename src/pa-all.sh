#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$DIR"

node pa-oracle-setup.js
node pa-npm-setup.js
node jboss-setup.sh
sh jboss-deploy.sh
sh jboss-start.sh
