# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# Join function
function join_by {
    local IFS="$1";
    shift;
    echo "$*";
}

# User configuration
export CAFFE_ROOT="$GITC/caffe/"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export GIT_AUTHOR_EMAIL="nishant.arora@appdirect.com"
export GIT_COMMITTER_EMAIL="nishant.arora@appdirect.com"
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
export GIT_EXTERNAL_DIFF=git-gui-diff
export GOROOT=$HOME/go
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export QMK_HOME="$HOME/.qmk"
export TF_DIFF_COMMAND="kdiff3 %1 %2"
export GITC="$HOME/gitc"

# for git
ssh-add "$HOME/.ssh/id_rsa" &>/dev/null
alias gitc="cd $GITC"

#Aliases
alias ls="ls -G"
alias tf="$GITC/vsts-tee/tf"
alias grep="grep --color"
alias ..="cd .."
alias bfg="java -jar $HOME/bfg-1.13.0.jar"
alias zshrc="source ~/.zshrc; cd ~-"
alias reboot="sudo reboot now"
alias shutdown="sudo shutdown -h now"
alias makeinstall="make -j $(($(nproc)+1)); sudo make install -j $(($(nproc)+1))"
alias vs="code --enable-proposed-api GitHub.vscode-pull-request-github"
alias clone="git clone ";
alias gc="git checkout ";
mcd () {
    mkdir -p "$1"
    cd "$1"
}

SOURCE_DIRS=(
    "$HOME/.rvm/scripts/rvm"
    "$HOME/google-cloud-sdk/path.${0##*/}.inc"
    "$HOME/google-cloud-sdk/completion.${0##*/}.inc"
    "$HOME/.jabba/jabba.sh"
    "$NVM_DIR/nvm.sh"
    "$NVM_DIR/bash_completion"
)

# Source everything.
for src in "${SOURCE_DIRS[@]}"
do
    [[ -s "$src" ]] && source "$src"
done

# I Want these directories in my path.
PATH_DIRS=(
    /bin
    /usr/bin
    /usr/games
    /usr/lib/ccache
    /usr/local/bin
    /usr/local/Cellar/emacs/26.2/bin
    /usr/local/games
    /usr/local/go/bin
    /usr/local/opt/avr-gcc@8/bin
    /usr/local/opt/coreutils/libexec/gnubin
    /usr/local/sbin
    /usr/sbin
    /sbin
    $GOROOT/bin
    $HOME/Android/Sdk/platform-tools
    $HOME/Android/Sdk/build-tools
    $HOME/bin
    $HOME/.gem/ruby/2.7.0/bin
    $HOME/.local/bin
    $HOME/.npm-global/bin
    $HOME/.rvm/bin
    $HOME/.dotfiles/bin
    $HOME/Library/Python/3.7/bin
    $GITC/flutter/bin
)

#Merging with existing path and sorting.
PATH_DIRS=( $(echo $(echo "$PATH_DIRS") ${PATH//:/ } | tr ' ' '\n' | sort -u | tr '\n' ' ') )

#Removing unnecessary dirs from path.
CLEAN_DIRS=()
for tmp in "${PATH_DIRS[@]}"
do
    if [ -d "$tmp" ]; then
        CLEAN_DIRS+=("$tmp")
    fi
done

#Defining new $PATH
export PATH=$(join_by : "${CLEAN_DIRS[@]}")
