[[ "$1" != init && ! -e ~/.nave ]] && return 1

export PATH
PATH=~/.nave/installed/default/bin:"$(path_remove ~/.nave/installed/*/bin)"

export VOLTA_HOME=~/.volta
grep --silent "$VOLTA_HOME/bin" <<< $PATH || export PATH="$VOLTA_HOME/bin:$PATH"

# Use npx instead of installing global npm modules
function make_npx_alias () {
  alias $1="npx $@"
}

make_npx_alias json2yaml
make_npx_alias pushstate-server
make_npx_alias yaml2json

function get_last_modified_js_file_recursive() {
  find . -type d \( -name node_modules -o -name .git -o -name .build \) -prune -o -type f \( -name '*.js' -o -name '*.jsx' \) -print0 \
    | xargs -0 stat -f '%m %N' \
    | sort -rn \
    | head -1 \
    | cut -d' ' -f2-
}

# Use the version of node in the local .nvmrc file
alias nvmrc='exec nave use $(<.nvmrc)'

# Global npm modules to install.
npm_globals=(
  babel-cli
  eslint
  grunt-cli
  node-inspector
  tern
  pushstate-server
  webpack
)

# Because "rm -rf node_modules && npm install" takes WAY too long. Not sure
# if this really works as well, though. We'll see.
alias npm_up='npm prune && npm install && npm update'

# Run arbitrary command with npm "bin" directory in PATH.
function npm_run() {
  git rev-parse 2>/dev/null && (
    PATH="$(git rev-parse --show-toplevel)/node_modules/.bin:$PATH"
    "$@"
  )
}

# Update npm and install global modules.
function npm_install() {
  local installed modules
  e_header "Updating npm"
  npm update -g npm
  { pushd "$(npm config get prefix)/lib/node_modules"; installed=(*); popd; } >/dev/null
  modules=($(setdiff "${npm_globals[*]}" "${installed[*]}"))
  if (( ${#modules[@]} > 0 )); then
    e_header "Installing Npm modules: ${modules[*]}"
    npm install -g "${modules[@]}"
  fi
}

function watchdir() {
  yarn watch --testPathPattern "$(dirname "$(get_last_modified_js_file_recursive)")"
}
