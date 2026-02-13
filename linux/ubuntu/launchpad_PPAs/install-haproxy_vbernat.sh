#!/usr/bin/env bash

set -o nounset

scriptBaseName=${0/*\//}

if [ $# -eq 0 ];then
        echo "=> Usage: $scriptBaseName haproxyVersion" >&2
        exit 1
fi

haproxyVersion=$1
if grep [0-9].[0-9] -q <<< $haproxyVersion;then
        installPackagesFromRepo.sh ppa:vbernat/haproxy-$haproxyVersion haproxy
else
        echo "=> Please enter version in the form digit.digit" >&2
        exit 2
fi
