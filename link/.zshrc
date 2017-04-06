# source profile like .bashrc
if [ -f /etc/profile ]; then
	source /etc/profile
fi

# Google bash completions
if [ -f /etc/bash_completion.d/g4d ]; then
  source /etc/bash_completion.d/g4d
fi

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
alias reboot="sudo reboot now"
alias shutdown="sudo shutdown -h now"

# Source this
source $ZSH/oh-my-zsh.sh

# for git
ssh-add ~/.ssh/id_rsa &>/dev/null
GIT_COMMITTER_EMAIL="me@nishantarora.in"
GIT_AUTHOR_EMAIL="me@nishantarora.in"
alias gitc="cd ~/git-clients"

# I do not want to correct following commands.
if [ -f ~/.zsh_nocorrect ]; then
    while read -r COMMAND; do
        alias $COMMAND="nocorrect $COMMAND"
    done < ~/.zsh_nocorrect
fi

# The next line updates PATH for the Google Cloud SDK.
source $HOME'/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source $HOME'/google-cloud-sdk/completion.zsh.inc'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then source '$HOME/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then source '$HOME/google-cloud-sdk/completion.zsh.inc'; fi
source <(antibody init)
