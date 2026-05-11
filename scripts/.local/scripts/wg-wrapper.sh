#!/bin/bash

wg() {
  if [[ "$1" == "up" || "$1" == "down" ]]; then
    local action=$1
    local env=$2
    local config_dir="$HOME/workspace/configs/wg"

    if [[ -z "$env" ]]; then
      env=$(ls "$config_dir"/*.conf 2>/dev/null | xargs -n1 basename | sed 's/.conf$//' | sort | fzf --preview "cat $config_dir/{}.conf" --preview-window=right:40%)

      if [[ -z "$env" ]]; then
        echo "No config selected"
        return 1
      fi
    fi

    local conf="$config_dir/${env}.conf"

    if [[ ! -f "$conf" ]]; then
      echo "Error: Config file not found: $conf"
      return 1
    fi

    wg-quick "$action" "$conf"
  else
    command wg "$@"
  fi
}

_wg_complete() {
  local config_dir="$HOME/workspace/configs/wg"
  local -a configs

  configs=($(ls "$config_dir"/*.conf 2>/dev/null | xargs -n1 basename | sed 's/.conf$//' | sort))

  if [[ ${CURRENT} -eq 2 ]]; then
    _values 'action' 'up' 'down'
  elif [[ ${CURRENT} -eq 3 ]]; then
    _values 'environment' ${configs[@]}
  fi
}

compdef _wg_complete wg
