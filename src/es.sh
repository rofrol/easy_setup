#!/bin/bash

git config --global alias.es "!echo easy_setup; git fetch; git branch -f easy_setup origin/easy_setup; git checkout -f -- config; git clean -fd; git cherry-pick -n -X theirs easy_setup; git reset; git checkout 5f24678 -- pa-web/src/main/java/de/mlp/xbg/pa/adapter/CrmAdapter.java; sh /c/projects/xbg-pa/easy_setup/es.sh"