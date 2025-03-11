# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# Join function
function join_by() {
    local IFS="$1"
    shift
    echo "$*"
}

arch_name="$(uname -m)"
alias brew="/opt/homebrew/bin/brew"
if [ "${arch_name}" = "x86_64" ]; then
    alias brew="/usr/local/bin/brew"
fi

# User configuration
export EDITOR="code -w"
export CPATH=$(xcrun --show-sdk-path)/usr/include
export DOCKER_HOST="unix://$HOME/.colima/default/docker.sock"
export CAFFE_ROOT="$GITC/caffe/"
export COMMITTER_AUTO_FIX=true
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export GIT_AUTHOR_EMAIL="1895906+whizzzkid@users.noreply.github.com"
export GIT_COMMITTER_EMAIL="1895906+whizzzkid@users.noreply.github.com"
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
export GIT_EXTERNAL_DIFF="git-gui-diff"
export GOPATH="$HOME/go"
export LESSOPEN="|/opt/homebrew/bin/lesspipe.sh %s"
export NVM_DIR="$HOME/.nvm"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export QMK_HOME="$HOME/.qmk"
export TF_DIFF_COMMAND="kdiff3 %1 %2"
export GITC="$HOME/gitc"
export PYENV_ROOT="$HOME/.pyenv"
export VSCODE_GALLERY_SERVICE_URL='https://marketplace.visualstudio.com/_apis/public/gallery'
export VSCODE_GALLERY_CACHE_URL='https://vscode.blob.core.windows.net/gallery/index'
export VSCODE_GALLERY_ITEM_URL='https://marketplace.visualstudio.com/items'
export VSCODE_GALLERY_CONTROL_URL=''
export VSCODE_GALLERY_RECOMMENDATIONS_URL=''
export LDFLAGS="\
    -L$(xcrun --show-sdk-path)/usr/lib \
    -L$(brew --prefix bzip2)/lib \
    -L$(brew --prefix readline)/lib \
    -L$(brew --prefix zlib)/lib \
    -L$(brew --prefix openssl@3.0)/lib \
    -L$(brew --prefix llvm)/lib \
    -L$(brew --prefix curl)/lib"

export CPPFLAGS="\
    -I$(xcrun --show-sdk-path)/usr/include \
    -I$(brew --prefix bzip2)/include \
    -I$(brew --prefix readline)/include \
    -I$(brew --prefix zlib)/include \
    -I$(brew --prefix openssl@3.0)/include \
    -I$(brew --prefix llvm)/include \
    -I$(brew --prefix curl)/include"

alias gitc="cd $GITC"

#Aliases
alias ls="command ls -G"
alias tf="$GITC/vsts-tee/tf"
alias grep="command grep --color"
alias ..="cd .."
alias bfg="java -jar $HOME/bfg-1.13.0.jar"
alias zshrc="source ~/.zshrc; cd ~-"
alias reboot="sudo reboot now"
alias shutdown="sudo shutdown -h now"
alias makeinstall="make -j $(($(sysctl -n hw.physicalcpu) + 1)); sudo make install -j $(($(sysctl -n hw.physicalcpu) + 1))"
alias vs="code"
alias clone="git clone "
alias gc="git switch -c "
mcd() {
    mkdir -p "$1"
    cd "$1" || return
}

# I Want these directories in my path.
PATH_DIRS=(
    /bin
    /usr/bin
    /usr/games
    /usr/lib/ccache
    /usr/local/Cellar/emacs/26.2/bin
    /usr/local/games
    /usr/local/opt/avr-gcc@8/bin
    /usr/local/opt/coreutils/libexec/gnubin
    /usr/local/opt/imagemagick@6/bin
    /usr/local/opt/mysql@5.7/bin
    /usr/local/opt/tomcat@7/bin
    /usr/local/sbin
    /usr/sbin
    /opt/homebrew/bin/
    /opt/homebrew/sbin
    /opt/homebrew/Cellar/jabba/0.11.2/bin
    /opt/homebrew/opt/bzip2/bin
    /sbin
    $(brew --prefix python)/libexec/bin
    $(brew --prefix gnu-tar)/libexec/gnubin
    $(brew --prefix postgresql@16)/bin
    $(brew --prefix gnu-getopt)/bin
    $(brew --prefix bash)/bin
    $HOME/.dotfiles/bin
    $HOME/.local/bin
    $HOME/.npm-global/bin
    $HOME/.pyenv/bin
    $HOME/.pyenv/shims
    $HOME/Android/Sdk/build-tools
    $HOME/Android/Sdk/platform-tools
    $HOME/Library/Python/3.8/bin
    $HOME/bin
)

#Merging with existing path and sorting.
PATH_DIRS=($(echo $(echo "$PATH_DIRS") ${PATH//:/ } | tr ' ' '\n' | sort -u | tr '\n' ' '))

#Removing unnecessary dirs from path.
CLEAN_DIRS=()
for tmp in "${PATH_DIRS[@]}"; do
    if [ -d "$tmp" ]; then
        CLEAN_DIRS+=("$tmp")
    fi
done

#Defining new $PATH
export PATH=$(join_by : "${CLEAN_DIRS[@]}")

export PATH="/usr/local/bin:$PATH"

SOURCE_DIRS=(
    "$HOME/google-cloud-sdk/path.${0##*/}.inc"
    "$HOME/google-cloud-sdk/completion.${0##*/}.inc"
    "$NVM_DIR/nvm.sh"
    "$NVM_DIR/bash_completion"
    "$HOME/.colima/zsh_completion"
    "$(brew --prefix git-extras)/share/git-extras/git-extras-completion.zsh"
)

# Source everything.
for src in "${SOURCE_DIRS[@]}"; do
    [[ -s "$src" ]] && source "$src"
done

# ngrok
if command -v ngrok &>/dev/null; then
    eval "$(ngrok completion)"
fi

# pyenv
if command -v pyenv &>/dev/null; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# mise
if [[ -s "$HOME/.local/bin/mise" ]]; then
    eval "$($HOME/.local/bin/mise activate zsh)"
fi
