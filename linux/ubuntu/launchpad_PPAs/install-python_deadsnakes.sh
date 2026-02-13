#!/usr/bin/env bash

set -o nounset

scriptBaseName=${0/*\//}

if [ $# -eq 0 ];then
        echo "=> Usage: $scriptBaseName pythonVersion" >&2
        exit 1
fi

pythonVersion=$1
if grep [0-9].[0-9] -q <<< $pythonVersion;then
        echo installPackagesFromRepo.sh ppa:deadsnakes/ppa python-$pythonVersion
else
        echo "=> Please enter version in the form digit.digit" >&2
        exit 2
fi
