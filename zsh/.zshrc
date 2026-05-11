# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source "$ZSH/oh-my-zsh.sh"

source "$HOME/.config/zsh/env.zsh"
source "$HOME/.config/zsh/aliases.zsh"
source "$HOME/.config/zsh/functions.zsh"

if [[ -f "$HOME/.config/zsh/local.zsh" ]]; then
  source "$HOME/.config/zsh/local.zsh"
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
fi

bindkey -r "^H"
bindkey -r "^L"
bindkey "^E" autosuggest-accept
bindkey -s "^F" 'fzfcopy\n'
bindkey -s "\e[1;6F" 'fzfcopy -f\n'

fpath+=(~/.zfunc)
autoload -Uz compinit
compinit

bindkey $'\e[100;6u' fzf-cd-widget
