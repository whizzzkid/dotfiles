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

# User configuration
export ANDROID_HOME="$HOME/Library/Android/sdk"
export BREW_HOME="/opt/homebrew"
export BREW_INSTALLS="$BREW_HOME/opt"
export BUN_INSTALL="$HOME/.bun"
export CAFFE_ROOT="$GITC/caffe/"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DVM_DIR="$HOME/.dvm"
export GEM_HOME="$HOME/.gem"
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
export PYENV_ROOT="$HOME/.pyenv"
export QMK_HOME="$HOME/.qmk"
export RUST_DIR="$HOME/.cargo"
export RVM_DIR="$HOME/.rvm"
export SDKMAN_DIR="$HOME/.sdkman"
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
export TF_DIFF_COMMAND="kdiff3 %1 %2"
export VSCODE_GALLERY_CACHE_URL='https://vscode.blob.core.windows.net/gallery/index'
export VSCODE_GALLERY_CONTROL_URL=''
export VSCODE_GALLERY_ITEM_URL='https://marketplace.visualstudio.com/items'
export VSCODE_GALLERY_RECOMMENDATIONS_URL=''
export VSCODE_GALLERY_SERVICE_URL='https://marketplace.visualstudio.com/_apis/public/gallery'
export YVM_DIR="$HOME/.yvm"

alias brew="$BREW_HOME/bin/brew"
if [ "${arch_name}" = "x86_64" ]; then
    alias brew="/usr/local/bin/brew"
fi

export LDFLAGS="                                                                        \
    -L$(brew --prefix bzip2)/lib                                                        \
    -L$(brew --prefix imagemagick@6)/lib                                           x     \
    -L$(brew --prefix llvm)/lib                                                         \
    -L$(brew --prefix llvm)/lib/c++ -Wl,-rpath,$(brew --prefix llvm)/lib/c++            \
    -L$(brew --prefix openssl)/lib                                                      \
    -L$(brew --prefix readline)/lib                                                     \
    -L$(brew --prefix zlib)/lib                                                         \
    -L$(xcrun --show-sdk-path)/usr/lib                                                  \
"

export CPPFLAGS="                                                                       \
    -I$(brew --prefix bzip2)/include                                                    \
    -I$(brew --prefix imagemagick@6)/include                                            \
    -I$(brew --prefix llvm)/include                                                     \
    -I$(brew --prefix openjdk)/include                                                  \
    -I$(brew --prefix openssl)/include                                                  \
    -I$(brew --prefix readline)/include                                                 \
    -I$(brew --prefix zlib)/include                                                     \
    -I$(xcrun --show-sdk-path)/usr/include                                              \
"

# for brew
arch_name="$(uname -m)"

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
    "$BUN_INSTALL/_bun"
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
    /sbin
    /usr/bin
    /usr/games
    /usr/lib/ccache
    /usr/local/bin
    /usr/local/Cellar/emacs/26.2/bin
    /usr/local/games
    /usr/local/sbin
    /usr/sbin
    $ANDROID_HOME/build-tools/33.0.0
    $ANDROID_HOME/cmdline-tools/latest/bin
    $ANDROID_HOME/emulator/bin64
    $ANDROID_HOME/platform-tools
    $BREW_HOME/bin
    $BREW_HOME/sbin
    $BREW_INSTALLS/avr-gcc@8/bin
    $BREW_INSTALLS/bzip2/bin
    $BREW_INSTALLS/coreutils/libexec/gnubin
    $BREW_INSTALLS/imagemagick@6/bin
    $BREW_INSTALLS/imagemagick@6/bin
    $BREW_INSTALLS/llvm/bin
    $BREW_INSTALLS/nvm
    $BREW_INSTALLS/openjdk/bin
    $BUN_INSTALL/bin
    $DVM_DIR/bin
    $HOME
    $HOME/.dotfiles/bin
    $HOME/.gem/ruby/2.7.0/bin
    $HOME/.local/bin
    $HOME/.npm-global/bin
    $HOME/bin
    $PYENV_ROOT/shims
    $RUST_DIR/bin
    $RVM_DIR/bin
    $RVM_DIR/gems/default/bin
)

SETUP_SCRIPTS=(
    $BREW_INSTALLS/nvm/etc/bash_completion.d/nvm
    $BUN_INSTALL/_bun
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

# Load nvm based on nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "$nvmrc_path" ]; then
        local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

        if [ "$nvmrc_node_version" = "N/A" ]; then
        nvm install
        elif [ "$nvmrc_node_version" != "$node_version" ]; then
        nvm use
        fi
    elif [ "$node_version" != "$(nvm version default)" ]; then
        echo "Reverting to nvm default version"
        nvm use default
    fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
