#!/bin/sh
set -e

if ! which fig >/dev/null; then
  curl -L --silent https://github.com/orchardup/fig/releases/download/0.5.1/linux > /usr/local/bin/fig
  chmod +x /usr/local/bin/fig
  echo fig installed
fi
