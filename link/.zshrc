# source profile like .bashrc
if [ -f /etc/profile ]; then
	source /etc/profile
fi

if [ -f /etc/bash_completion.d/g4d ]; then
  source /etc/bash_completion.d/g4d
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="agnoster"

# hyphen-insensitive completion.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Waiting
COMPLETION_WAITING_DOTS="true"

# ZSH plugins.
plugins=(command-not-found git git-extras history npm pip pylint python sudo)

# User configuration
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export GIT_EXTERNAL_DIFF=git-gui-diff
export DEFAULT_USER=`whoami`
export PATH="/home/whizzzkid/bin:/home/whizzzkid/.nave/installed/default/bin:/home/whizzzkid/.dotfiles/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin:/etc/aws-eb-tools/eb/linux/python2.7:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# Command history.
setopt share_history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.history
setopt APPEND_HISTORY

#Aliases
alias ls="ls --color"
alias grep="grep --color"
alias ..="cd .."
alias zshrc="source ~/.zshrc; cd ~-"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='emacs -nw'
else
  export EDITOR='emacs -nw'
fi

# The next line updates PATH for the Google Cloud SDK.
source $HOME'/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source $HOME'/google-cloud-sdk/completion.zsh.inc'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export NVM_DIR="/home/whizzzkid/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
