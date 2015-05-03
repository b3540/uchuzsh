function h() {
  local item
  item=$(builtin history -n -r 1 | peco)

  if [[ -z "$item" ]]; then
    return 1
  fi
  eval "$item"
}

