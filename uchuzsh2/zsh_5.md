# vcs_infoを使おう

date
:  2015/05/04

author
:   三宅 英明(mollifier)

theme
:   ligntning-gl-sample

# 自己紹介

- 名前: 三宅 英明
- Twitter: @mollifier
- はてなID: mollifier
- 神戸のプログラマ

![](images/usagi-kao-kiritori.png){:caption="" relative_height="60" align="right"}

# 好きなもの
- zsh
- vim
- vimperator

![](images/usagi-kao-kiritori.png){:caption="" relative_height="60" align="right"}

# ブログとか
はてなブログ
:    http://mollifier.hatenablog.com/

Twitter
:    http://twitter.com/mollifier

Qiita
:    http://qiita.com/mollifier


# vcs_infoを使おう
- vcs_infoとは
- vcs_infoの設定
- vcs_infoの設定のしくみ
- もう少し凝った設定

# vcs_infoを使おう
- *vcs_infoとは*
- vcs_infoの設定
- vcs_infoの設定のしくみ
- もう少し凝った設定

# vcs_infoとは
- vcs(Version Control Systems)の情報(info)を表示するやつ

# vcs_infoとは
- Git使ってて、今どのブランチにいるのか勘違いしてコミットしてしまったりして困る
- かといっていちいちgit statusするのも面倒

# vcs_infoとは
- 常にブランチの情報表示しとけば便利ちゃうの?
- 便利でした
- みんな使おう

# vcs_infoを使おう
- vcs_infoとは
- *vcs_infoの設定*
- vcs_infoの設定のしくみ
- もう少し凝った設定

# vcs_infoの設定例
とりあえずこれを~/.zshrcにコピペ

    autoload -Uz add-zsh-hook
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' formats '(%s)-[%b]'
    zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'

    function _update_vcs_info_msg() {
      psvar=()
      LANG=en_US.UTF-8 vcs_info
      psvar[1]="$vcs_info_msg_0_"
    }
    add-zsh-hook precmd _update_vcs_info_msg
    RPROMPT="%v"

# vcs_infoの設定例
- 実はいくつか流派がある
- さっきのやつは一番まじめなやつ

# vcs_infoを使おう
- vcs_infoとは
- vcs_infoの設定
- *vcs_infoの設定のしくみ*
- もう少し凝った設定

# どういう仕組みなのか?
そもそも、プロンプトに変数を埋め込んでもリアルタイムに変わるわけではない

    var1="hoge"
    RPROMPT="$var1"
    var1="fuga"
    # プロンプトは変わらない

# どういう仕組みなのか?
基本的には、プロンプト変数に値を設定した時点でプロンプト文字列は固定される

# どういう仕組みなのか?
でも、vcs_infoの場合は、ブランチを切り替えたときとかプロンプト文字列を動的に変えたい

# どういう仕組みなのか?
psvarという配列に値を入れておけば、PROMPT変数で%vでそれを参照できる

    psvar=()
    psvar[1]="hoge"

    RPROMPT="%v"
    psvar[1]="fuga"
    # これは変わる

# どういう仕組みなのか?
- psvarはプロンプトを動的に買えるための変数(配列)
- これを使うのが王道っぽい

# どういう仕組みなのか?
もう一つ、add-zsh-hook precmdというのが大事

    autoload -Uz add-zsh-hook
    function precmd_hook() {
      # 何か処理
    }
    add-zsh-hook precmd precmd_hook

# どういう仕組みなのか?
- add-zsh-hook precmd precmd_hookというのは、プロンプトを表示する直前のフック関数を登録している
- 要するに、Enterを押すたびに勝手に実行される関数を作ってる

# どういう仕組みなのか?
これでpsvarを更新すればプロンプトの表示を動的に変えれる

    autoload -Uz add-zsh-hook

    function _update_vcs_info_msg() {
      psvar=()
      psvar[1]="[$(date)]"
    }
    add-zsh-hook precmd _update_vcs_info_msg
    RPROMPT="%v"

# どういう仕組みなのか?
- プロンプト文字列は基本固定
- でも、psvar変数を使えば動的に変えれる
- precmdで毎回psvar変数を変える
- プロンプト表示が動的に変わる

# どういう仕組みなのか?
- なんか回りくどい
- もっと楽な方法ないの?

# 別解その1
- 楽な方法ある
- setopt prompt_substを使う

# 別解その1
- プロンプト文字列は基本固定
- でも、setopt prompt_substすれば別
- プロンプト文字列の中に埋め込んだ変数が毎回そのときの値に置き換えられるようになる

# 別解その1

    setopt prompt_subst
    var1="hoge"
    RPROMPT="$var1"
    var1="fuga"
    # 変わる

# 別解その1

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
    RPROMPT="$vcs_info_msg_0_"

# 別解その2
プロンプト変数が代入した瞬間の内容で固定されるなら、毎回プロンプト変数に代入したらいいんじゃないの?

    autoload -Uz add-zsh-hook
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' formats '(%s)-[%b]'
    zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'

    function _update_vcs_info_msg() {
      LANG=en_US.UTF-8 vcs_info
      RPROMPT="$vcs_info_msg_0_"
    }
    add-zsh-hook precmd _update_vcs_info_msg

# 別解その2
- この方法は好き嫌いが分かれる
- 「きたない」「なんかキモい」「邪道」という人もいるもよう

# 別解その2
- 「細かいこと気にすんなよ」派もいる
- vcs_infoを実行したら内部で20個ぐらいコマンド実行してるし、今さら変数1個代入するぐらい誤差

# 別解その2
- 僕は最後の方法を使ってる
- 「なんかキモい」という気はする
- でも、一番分かりやすいし、設定しやすい
- 色を付けたりifで分岐したりするときも一番トラブルが少ないと思う


# 色を付ける

    autoload -Uz vcs_info
    autoload -Uz add-zsh-hook

    zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
    zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

    function _update_vcs_info_msg() {
      LANG=en_US.UTF-8 vcs_info
      RPROMPT="${vcs_info_msg_0_}"
    }
    add-zsh-hook precmd _update_vcs_info_msg

# vcs_infoを使おう
- vcs_infoとは
- vcs_infoの設定
- vcs_infoの設定のしくみ
- *もう少し凝った設定*

# もう少し凝った設定
作業コピーの中で変更があるかどうかを表示する

    zstyle ':vcs_info:git:*' check-for-changes true
    zstyle ':vcs_info:git:*' stagedstr "+"
    zstyle ':vcs_info:git:*' unstagedstr "-"
    zstyle ':vcs_info:git:*' formats '(%s)-[%b] %c%u'
    zstyle ':vcs_info:git:*' actionformats '(%s)-[%b|%a] %c%u'


# もう少し凝った設定
- stagedstr "+"が、ステージングされた変更があるときの表示
- git addした変更があるときに表示されるやつ

# もう少し凝った設定
- unstagedstr "-"が、ステージングされていない変更があるときの表示
- ファイルを変更してgit addしていないときに表示されるやつ

# もう少し凝った設定
- %c が stagedstr、%u が unstagedstr

# もう少し凝った設定
- %cがstagedstr、%uがunstagedstrに置き換わる

# もう少し凝った設定
- まだコミットしていない変更があることに気がつける
- なんか変更してたけど、実はコミットしていない変更があってそれと混ざってしまった、というのがなくなる

# 欠点
- 重い

# 欠点
- 目に見えて遅くなる

# 欠点
- 対策
- いいマシンを買いましょう

# 欠点
これでちょっとはましになる

    zstyle ':vcs_info:*' enable git svn hg

# 欠点
- でも、vcs_info無しよりは、vcs_infoありでちょっと遅いのをがまんする方がマシだと思う

# まとめ
- vcs_info使いましょう
- ぶっちゃけ適当にググってコピペで使える
- 自分なりにカスタマイズしたいときはもうちょっと詳しく知ってないとつらい

# vcs_infoを使おう
- ありがとうございました

