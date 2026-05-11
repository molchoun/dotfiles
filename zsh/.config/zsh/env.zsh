typeset -U path PATH

path=(
  "$HOME/.local/bin"
  "$HOME/bin"
  "/usr/local/bin"
  "$HOME/go/bin"
  "$HOME/.cargo/bin"
  "$HOME/.opencode/bin"
  "$HOME/.local/share/omarchy/bin"
  $path
)

export PATH
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"
export BROWSER="google-chrome-stable"
export OMARCHY_PATH="$HOME/.local/share/omarchy"
