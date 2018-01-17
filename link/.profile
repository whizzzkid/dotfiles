# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

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

CUDA="/usr/local/cuda-9.1"

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
    $HOME/.nave/installed/default/bin
    $HOME/.opencv/include/
    $HOME/.dotfiles/bin
)

#Merging with existing path and sorting.
PATH_DIRS=( $(echo $(echo $PATH_DIRS) ${PATH//:/ } | tr ' ' '\n' | sort -u | tr '\n' ' ') )

#Defining new $PATH
function join_by { local IFS="$1"; shift; echo "$*"; }
export PATH=$(join_by : "${PATH_DIRS[@]}")

# User configuration
export LC_ALL="en_US.UTF-8"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$CUDA/lib64:/usr/local/lib:$HOME/.opencv/lib"
export LANG="en_US.UTF-8"
export GIT_EXTERNAL_DIFF=git-gui-diff
export GOROOT=$HOME/go
export GIT_CLIENTS="/mnt/SharedFS/gitc"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$HOME/.opencv/lib/pkgconfig/"
export OpenCV_DIR="$HOME/.opencv/share/OpenCV"
export PYTHONPATH="$PYTHONPATH:$GIT_CLIENTS/caffe/python:$GIT_CLIENTS/interactive-deep-colorization/caffe_files:$HOME/.opencv/lib/python2.7/dist-packages:/usr/local/lib/python2.7/site-packages"
export CAFFE_ROOT="$GIT_CLIENTS/caffe/"
