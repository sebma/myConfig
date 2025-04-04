#!/usr/bin/env bash

installPackagesFromRepo.sh "http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_$(lsb_release -sr)/ /" podman
if ! grep $USER /etc/subuid;then
	start=$(awk -F: '/^[a-zA-Z]/{start=$2+$3}END{printf start}' /etc/subuid)
 	count=$((2**16))
	last=$(($start+$count-1))
	usermod --add-subuids $start-$last --add-subgids $start-$last $USER
fi
