# RPROMPTに日付、現在時刻を表示する
autoload -Uz add-zsh-hook

function _update_date_message() {
  psvar=()
  psvar[1]="[$(date)]"
}
add-zsh-hook precmd _update_date_message
RPROMPT="%v"

