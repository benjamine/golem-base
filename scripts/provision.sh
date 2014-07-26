#!/bin/sh
set -e

cd /vagrant/scripts/
sh ./bootstrap.sh
sh ./banner.sh
sh ./tools.sh
sh ./docker.sh
sh ./fig.sh
sh ./zsh.sh
echo "provisioning complete"
