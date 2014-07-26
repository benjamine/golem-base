#!/bin/sh
set -e

if ! which dos2unix >/dev/null; then
  echo installing dos2unix…
  sudo apt-get --yes install dos2unix
  echo dos2unix installed
fi
