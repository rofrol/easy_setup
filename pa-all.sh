#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$DIR"

sh pa-oracle-setup.sh
sh pa-npm-setup.sh
node jboss-setup.sh
sh jboss-deploy.sh
sh jboss-start.sh