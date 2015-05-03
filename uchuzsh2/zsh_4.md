# zshでコマンドライン履歴を活用する

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

# コマンドライン履歴
- コマンドライン履歴とは
- 実行したコマンドを覚えていて、後から使えるやつ

# コマンドライン履歴
- 過去に入力したコマンドをもう一度入力したいことが、けっこうある

# コマンドライン履歴
- 毎日のように使うコマンドで、決まりきったパターンを何回も入力するのがめんどう
- だいぶ前に入力したあのコマンドをもう一度使いたいけど、引数の指定とか忘れてしまった

# コマンドライン履歴
- そんなときはコマンドライン履歴を使えばOK
- 1回入力したコマンドラインを覚えておいて、あとから使える

# コマンドライン履歴
とりあえず基本の設定

    HISTFILE=~/.zsh_history
    HISTSIZE=1000000
    SAVEHIST=1000000

# コマンドライン履歴
- HISTFILEはコマンドライン履歴を保存するファイル名の指定
- 何でもいいけど、~/.zsh_historyとしている人が多いもよう
- 別のファイル名でもいい


# コマンドライン履歴
- HISTSIZE、SAVEHISTはコマンドライン履歴を何行保存するかの設定

# コマンドライン履歴
- 多めの設定を推奨
- 目安としては一生使っても使い切れないぐらいの量
- 100万にしたら普通の人は100年ぐらいたっても足りるので、だいたいそれぐらいでOK
- 気前よく1億とかにしてもOK

# コマンドライン履歴
これも足しておいたほうがいい

    setopt share_history
    setopt hist_ignore_all_dups

# コマンドライン履歴
- setopt share_history
- 同時に起動したzshの間でヒストリを共有する

# コマンドライン履歴
- setopt hist_ignore_all_dups
- 同じコマンドをヒストリに残さない

# コマンドライン履歴の活用(1)
- インクリメンタル検索する
- いろいろあるけど、標準のCtrl+rでだいたいOK

# コマンドライン履歴の活用(2)
今の入力を元にコマンドライン履歴から補完する

    autoload -Uz history-search-end
    zle -N history-beginning-search-backward-end \
      history-search-end
    bindkey "^O" history-beginning-search-backward-end

# コマンドライン履歴の活用(2)
- 言葉では説明しにくいのでデモを見せる

# コマンドライン履歴の活用(2)
- これが便利
- 個人的にはzshの一番好きな機能

# コマンドライン履歴の活用(3)
普通にgrepで検索
汎用的
zsh関係ない

    % history 1 | grep 'git'
     153  git commit
    2862  git init
    % !2861

# コマンドライン履歴
- とりあえずこれぐらいでOK
- もう、1回入力したコマンドは2度と手入力しない
- 2回入力してしまったら死ぬ、ぐらいの勢いで

# zshでコマンドライン履歴を活用する
- ありがとうございました

