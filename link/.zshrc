# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' max-errors 3 numeric
zstyle :compinstall filename '/Users/nishant.arora/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

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
ZSH_THEME="powerlevel9k/powerlevel9k"

# Shorter Parg
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_unique"

# hyphen-insensitive completion.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Waiting
COMPLETION_WAITING_DOTS="true"

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
