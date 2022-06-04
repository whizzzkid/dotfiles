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
export CAFFE_ROOT="$GITC/caffe/"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export GIT_AUTHOR_EMAIL="nishant.arora@gusto.com"
export GIT_COMMITTER_EMAIL="nishant.arora@gusto.com"
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
export GIT_EXTERNAL_DIFF="git-gui-diff"
export GOPATH="$HOME/go"
export NVM_DIR="$HOME/.nvm"
export YVM_DIR="$HOME/.yvm"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export QMK_HOME="$HOME/.qmk"
export TF_DIFF_COMMAND="kdiff3 %1 %2"
export GITC="$HOME/gitc"
export VSCODE_GALLERY_SERVICE_URL='https://marketplace.visualstudio.com/_apis/public/gallery'
export VSCODE_GALLERY_CACHE_URL='https://vscode.blob.core.windows.net/gallery/index'
export VSCODE_GALLERY_ITEM_URL='https://marketplace.visualstudio.com/items'
export VSCODE_GALLERY_CONTROL_URL=''
export VSCODE_GALLERY_RECOMMENDATIONS_URL=''
export LDFLAGS="\
    -L$(xcrun --show-sdk-path)/usr/lib \
    -L$(brew --prefix bzip2)/lib \
    -L$(brew --prefix readline)/lib \
    -L$(brew --prefix openssl)/lib \
    -L$(brew --prefix zlib)/lib"

export CPPFLAGS="\
    -I$(xcrun --show-sdk-path)/usr/include \
    -I$(brew --prefix bzip2)/include \
    -I$(brew --prefix readline)/include \
    -I$(brew --prefix openssl)/include \
    -I$(brew --prefix zlib)/include"

# for git
ssh-add "$HOME/.ssh/id_ed25519_gusto" &>/dev/null
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
alias vs="codium"
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
    "$YVM_DIR/yvm.sh"
)

# Source everything.
for src in "${SOURCE_DIRS[@]}"; do
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
    /usr/local/opt/avr-gcc@8/bin
    /usr/local/opt/coreutils/libexec/gnubin
    /usr/local/opt/imagemagick@6/bin
    /usr/local/opt/mysql@5.7/bin
    /usr/local/opt/tomcat@7/bin
    /usr/local/sbin
    /usr/sbin
    /opt/homebrew/bin/
    /opt/homebrew/Cellar/jabba/0.11.2/bin
    /opt/homebrew/opt/bzip2/bin
    /sbin
    $HOME/.dotfiles/bin
    $HOME/.gem/ruby/2.7.0/bin
    $HOME/.local/bin
    $HOME/.npm-global/bin
    $HOME/.rvm/bin
    $HOME/.rvm/gems/ruby-2.7.0/bin
    $HOME/Android/Sdk/build-tools
    $HOME/Android/Sdk/platform-tools
    $HOME/bin
    $HOME/Library/Python/3.8/bin
    $GITC/gusto/updog/bin
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

[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

if [[ $CI == "true" ]]; then
  echo "Not loading nvm bash completion: executed in CI pipeline (\$CI is true)"
else
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

for f in $HOME/.gusto; do
   . $f
done
