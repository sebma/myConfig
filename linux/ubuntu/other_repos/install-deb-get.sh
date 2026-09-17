#!/usr/bin/env bash

sudo apt install curl lsb-release wget jq -Vy
curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get
