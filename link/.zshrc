# source profile like .bashrc
if [ -f /etc/profile ]; then
	source /etc/profile
fi

# Theme
ZSH_THEME="agnoster"

# Insensitive ti hyphens.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# ZSH plugins.
plugins=(command-not-found git git-extras history npm pip pylint python sudo)

# User configuration
export DEFAULT_USER=`whoami`
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export GIT_EXTERNAL_DIFF=git-gui-diff
export LANG="en_US.UTF-8"
export DEFAULT_USER=`whoami`
export PATH="$PATH:$HOME/bin:$HOME/.npm-global/bin:$HOME/.rvm/bin:$HOME/.nave/installed/default/bin:$HOME/.dotfiles/bin:$HOME/.rvm/bin:$HOME/anaconda2/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin:/etc/aws-eb-tools/eb/linux/python2.7:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# History.
setopt share_history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.history
setopt APPEND_HISTORY

#Aliases
# Aliases
alias ls="ls --color"
alias grep="grep --color"
alias ..="cd .."
alias zshrc="source ~/.zshrc; cd ~-"
alias update="~/sys-update.sh"
alias reboot="sudo reboot now"
alias shutdown="sudo shutdown -h now"
alias makeinstall="make -j $(($(nproc)+1)); sudo make install -j $(($(nproc)+1))"

# Source this
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='emacs -nw'
else
  export EDITOR='emacs -nw'
fi

source $ZSH/oh-my-zsh.sh
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

# The next line updates PATH for the Google Cloud SDK.
source $HOME'/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source $HOME'/google-cloud-sdk/completion.zsh.inc'
source <(antibody init)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/whizzzkid/google-cloud-sdk/path.zsh.inc' ]; then source '/home/whizzzkid/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/whizzzkid/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/whizzzkid/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
