#!/bin/sh
set -e

if ! which docker >/dev/null; then
  echo installing docker…
  curl -s https://get.docker.io/ubuntu/ | sudo sh

  # see https://github.com/docker/compose/issues/88#issuecomment-51583724
  echo DOCKER_OPTS="-H tcp://127.0.0.1:4243 -H unix:///var/run/docker.sock" >> /etc/default/docker
  sudo restart docker
  echo export DOCKER_HOST=tcp://localhost:4243 >> ~/.zshrc
  echo export DOCKER_HOST=tcp://localhost:4243 >> ~/.bashrc

  echo docker installed
fi
