# source profile like .bashrc
if [ -f /etc/profile ]; then
	source /etc/profile
fi

if [ -f $HOME/.profile ]; then
  source $HOME/.profile
fi


# Zsh
ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="agnoster"

# hyphen-insensitive completion.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Waiting
COMPLETION_WAI
TING_DOTS="true"

# ZSH plugins.
plugins=(command-not-found git git-extras history npm pip pylint python sudo)

# Command history.
setopt share_history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.history
setopt APPEND_HISTORY

# Source this
source $ZSH/oh-my-zsh.sh

export DEFAULT_USER=`whoami`

# I do not want to correct following commands.
if [ -f ~/.zsh_nocorrect ]; then
    while read -r COMMAND; do
        alias $COMMAND="nocorrect $COMMAND"
    done < ~/.zsh_nocorrect
fi
