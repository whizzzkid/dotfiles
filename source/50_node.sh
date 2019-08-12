[[ "$1" != init ]] && return 1

export PATH

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
