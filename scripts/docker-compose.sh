#!/bin/sh

set -e

if ! which docker-compose >/dev/null; then
  echo installing docker-compose…
  sudo curl -s -L https://github.com/docker/compose/releases/download/1.3.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  echo docker-compose installed
fi
