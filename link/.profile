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
export BUN_INSTALL="$HOME/.bun"
export CAFFE_ROOT="$GITC/caffe/"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DVM_DIR="$HOME/.dvm"
export GIT_AUTHOR_EMAIL="1895906+whizzzkid@users.noreply.github.com"
export GIT_COMMITTER_EMAIL="1895906+whizzzkid@users.noreply.github.com"
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
export GIT_EXTERNAL_DIFF="git-gui-diff"
export GITC="$HOME/gitc"
export GOPATH="$HOME/go"
export HOMEBREW_AUTO_UPDATE_SECS="86400"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export NVM_DIR="$HOME/.nvm"
export QMK_HOME="$HOME/.qmk"
export RUST_DIR="$HOME/.cargo"
export RVM_DIR="$HOME/.rvm"
export TF_DIFF_COMMAND="kdiff3 %1 %2"
export VSCODE_GALLERY_CACHE_URL='https://vscode.blob.core.windows.net/gallery/index'
export VSCODE_GALLERY_CONTROL_URL=''
export VSCODE_GALLERY_ITEM_URL='https://marketplace.visualstudio.com/items'
export VSCODE_GALLERY_RECOMMENDATIONS_URL=''
export VSCODE_GALLERY_SERVICE_URL='https://marketplace.visualstudio.com/_apis/public/gallery'
export YVM_DIR="$HOME/.yvm"
export LDFLAGS="\
    -L$(xcrun --show-sdk-path)/usr/lib \
    -L$(brew --prefix bzip2)/lib \
    -L$(brew --prefix imagemagick)/lib \
    -L$(brew --prefix openssl)/lib \
    -L$(brew --prefix readline)/lib \
    -L$(brew --prefix zlib)/lib \
    -L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++"

export CPPFLAGS="\
    -I$(xcrun --show-sdk-path)/usr/include \
    -I$(brew --prefix bzip2)/include \
    -I$(brew --prefix imagemagick)/include \
    -I$(brew --prefix readline)/include \
    -I$(brew --prefix openssl)/include \
    -I$(brew --prefix zlib)/include"

# for git
ssh-add "$HOME/.ssh/id_ed25519" &>/dev/null
alias gitc="cd $GITC"

#Aliases
alias ls="command ls -G"
alias tf="$GITC/vsts-tee/tf"
alias grep="command grep --color"
alias ..="cd .."
alias macq="xattr -d com.apple.quarantine"
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

SOURCE_DIRS=(
    "$HOME/.rvm/scripts/rvm"
    "$HOME/google-cloud-sdk/path.${0##*/}.inc"
    "$HOME/google-cloud-sdk/completion.${0##*/}.inc"
    "$NVM_DIR/nvm.sh"
    "$NVM_DIR/bash_completion"
    "$RUST_DIR/env"
    "$RVM_DIR/scripts/rvm"
)

# I Want these directories in my path.
PATH_DIRS=(
    /bin
    /usr/bin
    /usr/games
    /usr/lib/ccache
    /usr/local/bin
    /usr/local/Cellar/emacs/26.2/bin
    /usr/local/games
    /usr/local/opt/avr-gcc@8/bin
    /usr/local/opt/coreutils/libexec/gnubin
    /usr/local/opt/imagemagick@6/bin
    /usr/local/opt/mysql@5.7/bin
    /usr/local/opt/nvm/nvm.sh
    /usr/local/opt/tomcat@7/bin
    /usr/local/sbin
    /usr/sbin
    /opt/homebrew/bin/
    /opt/homebrew/sbin/
    /opt/homebrew/Cellar/jabba/0.11.2/bin
    /opt/homebrew/opt/bzip2/bin
    /sbin
    $HOME/.dotfiles/bin
    $HOME/.gem/ruby/2.7.0/bin
    $HOME/.local/bin
    $HOME/.npm-global/bin
    $HOME/Android/Sdk/build-tools
    $HOME/Android/Sdk/platform-tools
    $HOME/bin
    $HOME/Library/Python/3.8/bin
    $BUN_INSTALL/bin
    $DVM_DIR/bin
    $RUST_DIR/bin
    $RVM_DIR/bin
)

SETUP_SCRIPTS=(
    $BUN_INSTALL/_bun
    /usr/local/opt/nvm/etc/bash_completion.d/nvm.sh
    $HOME/.sdkman/bin/sdkman-init.sh
    $YVM_DIR/yvm.sh
)

# Source everything.
for src in "${SOURCE_DIRS[@]}"; do
    [[ -s "$src" ]] && source "$src"
done

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

for script in "${SETUP_SCRIPTS[@]}"; do
    [[ -s "$script" ]] && . "$script"
done
