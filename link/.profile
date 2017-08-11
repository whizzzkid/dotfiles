# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

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

# if running bash
if [ -n "$BASH_VERSION" ]; then
    :
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

# User configuration
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export GIT_EXTERNAL_DIFF=git-gui-diff
export GOROOT=$HOME/go
export GIT_CLIENTS="/mnt/SharedFS/gitc"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$HOME/.opencv/lib/pkgconfig/"
export PYTHONPATH="$PYTHONPATH:$GIT_CLIENTS/caffe/python:$GIT_CLIENTS/interactive-deep-colorization/caffe_files:$HOME/.opencv/lib/python2.7/dist-packages/"
export CAFFE_ROOT="$GIT_CLIENTS/caffe/"

PATH_DIRS=(
    # Binaries
    /bin
    /sbin
    /usr/bin
    /usr/sbin
    /usr/local/bin
    /usr/local/sbin
    # Games
    /usr/games
    /usr/local/games
    # Java
    /usr/lib/jvm/java-8-oracle/bin
    /usr/lib/jvm/java-8-oracle/db/bin
    /usr/lib/jvm/java-8-oracle/jre/bin
    /etc/aws-eb-tools/eb/linux/python2.7
    # Go
    /usr/local/go/bin
    $GOROOT/bin
    # Custom
    $HOME/bin
    $HOME/.local/bin
    $HOME/Android/Sdk/platform-tools
    $HOME/Android/Sdk/build-tools
    $HOME/.npm-global/bin
    $HOME/.rvm/bin
    $HOME/.nave/installed/default/bin
    $HOME/.dotfiles/bin
    $HOME/anaconda2/bin
)

for path in {$PATH_DIRS[@]}
do
    if [ -s $path ]; then
        PATH="$PATH:$path"
    fi
done
export PATH=$PATH
