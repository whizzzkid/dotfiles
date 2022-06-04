# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/bashrc.pre.bash"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -s "/Users/nishant.arora/.jabba/jabba.sh" ] && source "/Users/nishant.arora/.jabba/jabba.sh"

src

# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/bashrc.pre.bash"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -s "/Users/nishant.arora/.jabba/jabba.sh" ] && source "/Users/nishant.arora/.jabba/jabba.sh"

export YVM_DIR=~/.yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh

# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/bashrc.post.bash"
