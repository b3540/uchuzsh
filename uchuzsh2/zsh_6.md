# Antigenを使おう

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


# Antigenを使おう
- Antigenとは
- Antigenをインストールする
- Antigenを使ってプラグインをインストールする

# Antigenを使おう
- *Antigenとは*
- Antigenをインストールする
- Antigenを使ってプラグインをインストールする

# Antigenとは
- Antigenとは、zshのプラグインを管理するやつ
- [https://github.com/zsh-users/antigen](https://github.com/zsh-users/antigen)

# Antigenとは
- zshプラグインのインストール、更新ができる
- VimのNeoBundleみたいなやつ

# ありがちなパターン
- 「zshを使ってる人は、これを入れると便利だよ!」
- 「ほうほう、試してみるか」

# ありがちなパターン
GitHubからリポジトリをクローンして…

    % mkdir ~/.zsh
    % cd ~/.zsh
    % git clone https://github.com/mollifier/cd-gitroot.git

# ありがちなパターン
~/.zshrcに追記して…

    fpath=(~/.zsh/cd-gitroot(N-/) $fpath)
    autoload -Uz cd-gitroot

# ありがちなパターン
- めんどくさい
- 特に、複数のマシンを使ってるときは、それぞれでこの作業をする必要がある

# ありがちなパターン
- 久しぶりにノートマシンを使ったら…「あれ、XXXが入ってないぞ?」

# ありがちなパターン
- どこに何をインストールしたのかを忘れる
- 新しいバージョンに更新するのも大変

# ありがちなパターン
- そんなときはAntigenを使いましょう

# Antigenを使おう
- Antigenとは
- *Antigenをインストールする*
- Antigenを使ってプラグインをインストールする

# Antigenをインストールする
~/.zshの下にインストールする場合の例

    % mkdir ~/.zsh
    % cd ~/.zsh
    % git clone git@github.com:zsh-users/antigen.git

# Antigenをインストールする
その後~/.zshrcにこれを追加する

    if [[ -f ~/.zsh/antigen/antigen.zsh ]]; then
      source ~/.zsh/antigen/antigen.zsh
      antigen apply
    fi


# Antigenを使おう
- ありがとうございました

