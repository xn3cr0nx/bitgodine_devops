#!/bin/bash

#set -x
set -e # Exit with nonzero when a command fails.
set -u # Exit with nonzero when referencing an unbound variable
set -o pipefail # Exit with nonzero when a command in a pipeline fails.

ENV=$1
PROJECT=$2
SHA=$3
SLACK_URL=$4
CI_URL=$2

case ${PROJECT} in

"bitgodine-bitgodine-dashboard")
CI_URL="https://github.com/uspaceit/bitgodine-bitgodine-dashboard";;

esac

MSG="Deployed <${CI_URL}|${PROJECT}> on *${ENV}*, version <${CI_URL}/commit/${SHA}|${SHA}>"

echo ${MSG}

curl -X POST -H 'Content-type: application/json' --data '{"text": "'"${MSG}"'"}' "${SLACK_URL}"
