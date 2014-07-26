#!/bin/sh
set -e

if ! which zsh >/dev/null; then
  echo installing zsh…
  sudo apt-get --yes install zsh
  # chsh the right way (no prompt)
  sudo chsh -s $(which zsh) vagrant
  echo zsh installed
fi

# setting up oh my zsh
if [ ! -d /home/vagrant/.oh-my-zsh/ ]; then
  echo 'installing oh my zsh'
  # remove headless-install offending lines
  curl -L --silent http://install.ohmyz.sh | sed -n '/chsh/!p' | sed -n '/env zsh/!p' | sed -n '/^\. ~\/\.zshrc/!p' > /home/vagrant/oh-my-zsh-install.sh
  # execute install from file
  su -c "sh /home/vagrant/oh-my-zsh-install.sh" -s /bin/sh vagrant

  if [ ! -d /home/vagrant/.oh-my-zsh/ ]; then
    # retry
    su -c "sh /home/vagrant/oh-my-zsh-install.sh" -s /bin/sh vagrant
    if [ ! -d /home/vagrant/.oh-my-zsh/ ]; then
      # retry
      su -c "sh /home/vagrant/oh-my-zsh-install.sh" -s /bin/sh vagrant
    fi
  fi

  # chsh the right way (no prompt)
  sudo chsh -s $(which zsh) vagrant
  echo oh-my-zsh installed
fi

if [ -f /home/vagrant/.zshrc ]; then
  if ! grep -q "golem \$PROMPT" /home/vagrant/.zshrc
  then
    echo 'setting golem prompt at .zshrc'
    echo '# identify as golem in prompt' >> /home/vagrant/.zshrc
    echo 'export PROMPT="golem $PROMPT"' >> /home/vagrant/.zshrc
  fi
fi
