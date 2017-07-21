# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


# Load Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Load Ruby Version Manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# User configuration
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export GIT_EXTERNAL_DIFF=git-gui-diff
export DEFAULT_USER=`whoami`
export GOROOT=$HOME/go
export GIT_CLIENTS="/mnt/SharedFS/gitc"
export PYTHONPATH="$PYTHONPATH:$GIT_CLIENTS/caffe/python:$GIT_CLIENTS/interactive-deep-colorization/caffe_files:$HOME/.opencv/lib/python2.7/dist-packages/"
export CAFFE_ROOT="$GIT_CLIENTS/caffe/"
export PATH="$PATH:$HOME/bin:$HOME/Android/Sdk/platform-tools:$HOME/Android/Sdk/build-tools:$HOME/.npm-global/bin:$HOME/.rvm/bin:$HOME/.nave/installed/default/bin:$HOME/.dotfiles/bin:$HOME/.rvm/bin:$HOME/anaconda2/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin:/etc/aws-eb-tools/eb/linux/python2.7:/usr/local/go/bin:$GOROOT/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$HOME/.opencv/lib/pkgconfig/"

