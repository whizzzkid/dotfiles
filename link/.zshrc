# source profile like .bashrc
if [ -f /etc/profile ]; then
	source /etc/profile
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme.
ZSH_THEME="agnoster"

# Insensitive ti hyphens.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# ZSH plugins
plugins=(command-not-found git git-extras history npm nyan pip pylint python sudo )

# User configuration
export DEFAULT_USER=`whoami`
export LC_ALL="en_US.UTF-8"
export GIT_EXTERNAL_DIFF=git-gui-diff
export LANG="en_US.UTF-8"
export PATH="/home/whizzzkid/bin:/home/whizzzkid/.nave/installed/default/bin:/home/whizzzkid/.dotfiles/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin:/etc/aws-eb-tools/eb/linux/python2.7:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# History.
setopt share_history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.history
setopt APPEND_HISTORY

# Aliases
alias ls="ls --color"
alias grep="grep --color"
alias ..="cd .."
alias zshrc="source ~/.zshrc; cd ~-"
alias blaze=bazel

source $ZSH/oh-my-zsh.sh

# The next line updates PATH for the Google Cloud SDK.
source $HOME'/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source $HOME'/google-cloud-sdk/completion.zsh.inc'
