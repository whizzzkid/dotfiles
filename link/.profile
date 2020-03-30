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


# if running bash
if [ -n "$BASH_VERSION" ]; then
    # Where the magic happens.
    export DOTFILES=~/.dotfiles

    # Add binaries into the path
    export PATH="$DOTFILES/bin:$PATH"

    # Source all files in "source"
    function src() {
        local file
        if [[ "$1" ]]; then
            source "$DOTFILES/source/$1.sh"
        else
            for file in $DOTFILES/source/*; do
                source "$file"
            done
        fi
    }

    # Run dotfiles script, then source.
    function dotfiles() {
        $DOTFILES/bin/dotfiles "$@" && src
    }

    src
fi

# if running zsh
if [ -n "$ZSH_VERSION" ]; then
    :
fi

# Load Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load Ruby Version Manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Google Cloud SDK
# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.${0##*/}.inc' ]; then
  source '$HOME/google-cloud-sdk/path.${0##*/}.inc';
fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.${0##*/}.inc' ]; then
  source '$HOME/google-cloud-sdk/completion.${0##*/}.inc';
fi

CUDA="/usr/local/cuda"
GITC="/mnt/SharedFS/gitc"

# I Want these directories in my path.
PATH_DIRS=(
    /bin
    /etc/aws-eb-tools/eb/linux/python2.7
    /usr/bin
    /usr/games
    /usr/lib/ccache
    /usr/lib/jvm/java-8-oracle/bin
    /usr/lib/jvm/java-8-oracle/db/bin
    /usr/lib/jvm/java-8-oracle/jre/bin
    /usr/local/bin
    /usr/local/games
    /usr/local/go/bin
    /usr/local/opencv/include
    /usr/local/sbin
    /usr/sbin
    /sbin
    $CUDA/bin
    $GOROOT/bin
    $HOME/bin
    $HOME/.local/bin
    $HOME/Android/Sdk/platform-tools
    $HOME/Android/Sdk/build-tools
    $HOME/.npm-global/bin
    $HOME/.rvm/bin
    $HOME/.nvm/installed/default/bin
    $HOME/.dotfiles/bin
    $GITC/flutter/bin
)

#Merging with existing path and sorting.
PATH_DIRS=( $(echo $(echo $PATH_DIRS) ${PATH//:/ } | tr ' ' '\n' | sort -u | tr '\n' ' ') )

#Removing unnecessary dirs from path.
CLEAN_DIRS=()
for tmp in ${PATH_DIRS[@]}
do
    if [ -d "$tmp" ]; then
        CLEAN_DIRS+=("$tmp")
    fi
done

#Defining new $PATH
export PATH=$(join_by : "${CLEAN_DIRS[@]}")

# for git
ssh-add ~/.ssh/id_rsa &>/dev/null
GIT_COMMITTER_EMAIL="me@nishantarora.in"
GIT_AUTHOR_EMAIL="me@nishantarora.in"
GIT_DISCOVERY_ACROSS_FILESYSTEM=1
alias gitc="cd $GITC"

#Aliases
alias ls="ls --color"
alias tf="$GITC/vsts-tee/tf"
alias grep="grep --color"
alias ..="cd .."
alias bfg="java -jar $HOME/bfg-1.13.0.jar"
alias zshrc="source ~/.zshrc; cd ~-"
alias update="~/sys-update.sh"
alias reboot="sudo prime-select intel; sudo reboot now"
alias shutdown="sudo prime-select intel; sudo shutdown -h now"
alias makeinstall="make -j $(($(nproc)+1)); sudo make install -j $(($(nproc)+1))"
mcd () {
    mkdir "$1"
    cd "$1"
}

# User configuration
export CAFFE_ROOT="$GITC/caffe/"
export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:$CUDA/include"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export GIT_EXTERNAL_DIFF=git-gui-diff
export GOROOT=$HOME/go
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$CUDA/lib64:/usr/local/lib:/usr/local/opencv/lib"
export OpenCV_DIR="/usr/local/opencv/share/OpenCV"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opencv/lib/pkgconfig/"
export PYTHONPATH="$PYTHONPATH:$GITC/caffe2/build/:$GITC/caffe/python:$GITC/interactive-deep-colorization/caffe_files:/usr/local/opencv/lib/python2.7/dist-packages:/usr/local/lib/python2.7/site-packages"
export TF_DIFF_COMMAND="kdiff3 %1 %2"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
