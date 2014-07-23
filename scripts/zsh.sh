#!/bin/sh

set -e

if ! which zsh >/dev/null; then
  echo installing zsh…
  sudo apt-get --yes install zsh
  # chsh the right way (no prompt)
  sudo chsh -s $(which zsh) vagrant
fi
echo zsh installed

# setting up oh my zsh
if [ ! -d ~/.oh-my-zsh/ ]; then
  echo 'installing oh my zsh'
  # remove headless-install offending lines
  curl -L http://install.ohmyz.sh | sed -n '/chsh/!p' | sed -n '/env zsh/!p' | sed -n '/^\. ~\/\.zshrc/!p' > /tmp/oh-my-zsh-install.sh
  # execute install from file
  sh /tmp/oh-my-zsh-install.sh
  # chsh the right way (no prompt)
  sudo chsh -s $(which zsh) vagrant
fi
echo oh-my-zsh installed

if [ -f ~/.zshrc ]; then
  if ! grep -q "golem \$PROMPT" ~/.zshrc
  then
    echo 'setting golem prompt at .zshrc'
    echo '# identify as golem in prompt' >> ~/.zshrc
    echo 'export PROMPT="golem $PROMPT"' >> ~/.zshrc
  fi
fi
