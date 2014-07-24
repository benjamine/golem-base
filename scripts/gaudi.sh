#!/bin/sh

set -e

if ! which gaudi >/dev/null; then
  wget -O - http://gaudi.io/apt/gaudi.gpg.key | sudo apt-key add -
  echo "deb http://gaudi.io/apt/ precise main" | sudo tee -a /etc/apt/sources.list

  sudo apt-get -y update
  sudo apt-get --yes install gaudi
fi
echo gaudi installed
