# source profile like .bashrc
if [ -f /etc/profile ]; then
	source /etc/profile
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="agnoster"

# hyphen-insensitive completion.
HYPHEN_INSENSITIVE="true"

# Correction.
ENABLE_CORRECTION="true"

# Waiting
COMPLETION_WAITING_DOTS="true"

# ZSH plugins.
plugins=(command-not-found git git-extras history npm nyan pip pylint python sudo )

# User configuration
export LC_ALL="en_US.UTF-8"
export GIT_EXTERNAL_DIFF=git-gui-diff
export DEFAULT_USER=`whoami`
export PATH="/usr/local/google/home/nishantarora/.nave/installed/default/bin:/usr/local/google/home/nishantarora/.dotfiles/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin:/etc/aws-eb-tools/eb/linux/python2.7:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

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
alias blaze=bazel

#Google Settings
setopt PROMPT_SUBST
precmd() { PTEXT=$(echo $PWD | sed -e s/nishantarora/~/ | sed -e "s#usr/local/google#ulg#")$\ ; print -Pn "\e]0;$PTEXT\a"; }
PROMPT='$PTEXT'
preexec() { print -Pn "\e]0;$1\a" }

cdg() {
  cd ${PWD%/google3*}/google3
}


echo $PWD | egrep -q '^/home/nishantarora$'

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG="en_US.UTF-8"

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
