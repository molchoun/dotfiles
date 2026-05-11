tmx() {
  if [[ $# -gt 0 ]]; then
    tmux-sessionizer "$1"
    return
  fi
  tmux-sessionizer
}

if [[ -f "$HOME/.local/scripts/wg-wrapper.sh" ]]; then
  source "$HOME/.local/scripts/wg-wrapper.sh"
fi
