#!/bin/sh
set -e

cd /vagrant/scripts/
sh ./bootstrap.sh
sh ./banner.sh
sh ./tools.sh
sh ./zsh.sh
sh ./docker.sh
sh ./docker-compose.sh
echo "provisioning complete"
