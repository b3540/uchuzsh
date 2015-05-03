# vcs_info 別解その1
# prompt_substを使う方法

setopt prompt_subst
autoload -Uz add-zsh-hook
autoload -Uz vcs_info

zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'

function _update_vcs_info_msg() {
  LANG=en_US.UTF-8 vcs_info
  # 集めた情報は$vcs_info_msg_0_変数に入る
}
add-zsh-hook precmd _update_vcs_info_msg
RPROMPT='$vcs_info_msg_0_'

