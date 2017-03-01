# source profile like .bashrc
if [ -f /etc/profile ]; then
	source /etc/profile
fi

if [ -f /etc/bash_completion.d/g4d ]; then
  source /etc/bash_completion.d/g4d
fi

# Theme
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"

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
alias mouse="sudo rmmod psmouse && sudo modprobe -a psmouse"

# Source this
source $ZSH/oh-my-zsh.sh

# for git
ssh-add ~/.ssh/id_rsa &>/dev/null
GIT_COMMITTER_EMAIL="me@nishantarora.in"
GIT_AUTHOR_EMAIL="me@nishantarora.in"
alias gitc="cd /media/whizzzkid/COMMON/git-clients/"

# The next line updates PATH for the Google Cloud SDK.
source $HOME'/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source $HOME'/google-cloud-sdk/completion.zsh.inc'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/whizzzkid/google-cloud-sdk/path.zsh.inc' ]; then source '/home/whizzzkid/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/whizzzkid/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/whizzzkid/google-cloud-sdk/completion.zsh.inc'; fi
source <(antibody init)

# PowerLevel9k https://github.com/bhilburn/powerlevel9k/
POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status nvm node_version)

POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
