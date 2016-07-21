#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$DIR"

sh pa-all.sh && \
sh adminbox-all.sh && \
sh rtt-all.sh
