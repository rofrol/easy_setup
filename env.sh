#!/bin/bash
# http://stackoverflow.com/questions/3601515/how-to-check-if-a-variable-is-set-in-bash/

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
envfile="$DIR/../.env"

function process() {
    echo "INFO: Using file '${file}'"

    # http://stackoverflow.com/questions/19331497/set-environment-variables-from-file/30969768#30969768
    set -o allexport
    source "${file}"
    set +o allexport

    echo
    echo "INFO: Sourced env variables:"
    while read -r line; do
        key=${line%%=*}
        echo "INFO:   ${key}=${!key}"
    done < "$file"
}

function usage() {
    echo
    echo Usage:
    echo "  Create file with key=value pairs separated by newline"
    echo "  Default file name is .env"
    echo "  You can set it with dotenv_config_path env variable"
    echo "  Then run:"
    echo "  'env.sh'"
}

if [ -z ${dotenv_config_path+x} ]; then
  #echo "DEBUG: dotenv_config_path unset"
  if [ -f "$envfile" ]; then
      #echo "DEBUG: "${DIR}/.env" exists"
      file="$envfile"
      process
  else
      #echo "DEBUG: ${DIR}/.env does't exists"
      usage
  fi
elif  [ -f "$dotenv_config_path" ]; then
    #echo "DEBUG: file dotenv_config_path exists"
    file=$dotenv_config_path
    process
else
    #echo "DEBUG: file dotenv_config_path=${dotenv_config_path} doesn't exists"
    usage
fi

