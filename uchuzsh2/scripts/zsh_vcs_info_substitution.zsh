# vcs_info 別解その2
# 直接RPROMPTに代入する

autoload -Uz add-zsh-hook
autoload -Uz vcs_info

zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'

function _update_vcs_info_msg() {
  LANG=en_US.UTF-8 vcs_info
  RPROMPT="$vcs_info_msg_0_"
}
add-zsh-hook precmd _update_vcs_info_msg

