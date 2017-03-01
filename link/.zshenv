# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


# User configuration
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export GIT_EXTERNAL_DIFF=git-gui-diff
export DEFAULT_USER=`whoami`
export PATH="$PATH:$HOME/bin:$HOME/.npm-global/bin:$HOME/.rvm/bin:$HOME/.nave/installed/default/bin:$HOME/.dotfiles/bin:$HOME/.rvm/bin:$HOME/anaconda2/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin:/etc/aws-eb-tools/eb/linux/python2.7:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='emacs -nw'
else
    export EDITOR='emacs -nw'
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
