#!/bin/sh

set -e

if ! which fig >/dev/null; then
  curl -L https://github.com/orchardup/fig/releases/download/0.5.1/linux > /usr/local/bin/fig
  chmod +x /usr/local/bin/fig
fi
echo fig installed
