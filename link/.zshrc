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
COMPLETION_WAITING_DOTS="true"

# ZSH plugins.
plugins=(command-not-found git git-extras history npm pip pylint python sudo)

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
alias update="~/sys-update.sh"
alias reboot="sudo prime-select intel; sudo reboot now"
alias shutdown="sudo prime-select intel; sudo shutdown -h now"
alias makeinstall="make -j $(($(nproc)+1)); sudo make install -j $(($(nproc)+1))"
mcd () {
  mkdir "$1"
  cd "$1"
}

# Source this
source $ZSH/oh-my-zsh.sh

export DEFAULT_USER=`whoami`

# for git
ssh-add ~/.ssh/id_rsa &>/dev/null
GIT_COMMITTER_EMAIL="me@nishantarora.in"
GIT_AUTHOR_EMAIL="me@nishantarora.in"
alias gitc="cd $GIT_CLIENTS"

# I do not want to correct following commands.
if [ -f ~/.zsh_nocorrect ]; then
    while read -r COMMAND; do
        alias $COMMAND="nocorrect $COMMAND"
    done < ~/.zsh_nocorrect
fi
