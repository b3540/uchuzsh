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
- ちょっと注意

# Antigenを使おう
- *Antigenとは*
- Antigenをインストールする
- Antigenを使ってプラグインをインストールする
- ちょっと注意

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
- ちょっと注意

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
- Antigenとは
- Antigenをインストールする
- *Antigenを使ってプラグインをインストールする*
- ちょっと注意

# Antigenを使ってプラグインをインストールする
- さっそくzshのプラグインをインストールしてみましょう

# Antigenを使ってプラグインをインストールする
antigenの書式

    antigen bundle <GitリポジトリのURL>

# Antigenを使ってプラグインをインストールする
これをsourceとantigen applyの間に書く

    if [[ -f ~/.zsh/antigen/antigen.zsh ]]; then
      source ~/.zsh/antigen/antigen.zsh
      antigen bundle https://github.com/mollifier/cd-gitroot.git
      antigen apply
    fi

# Antigenを使ってプラグインをインストールする
ただし、リポジトリがGitHubにある場合はURLを省略して <ユーザ名/リポジトリ名> と書ける

    if [[ -f ~/.zsh/antigen/antigen.zsh ]]; then
      source ~/.zsh/antigen/antigen.zsh
      antigen bundle mollifier/cd-gitroot
      antigen apply
    fi

# Antigenを使ってプラグインをインストールする
- これでsource ~/.zshrcすると、インストール、初期設定をやってくれる

# Antigenを使ってプラグインをインストールする
- つまり、さっき手でやっていたgit cloneと、~/.zshrcに追記していたやつをAntigenが代わりにやってくれる

# Antigenを使ってプラグインをインストールする
あとは、基本的なAntigenのコマンド

    # Antigenで管理しているプラグインを一覧表示する
    antigen list

# Antigenを使ってプラグインをインストールする

    # Antigenで管理しているプラグインをすべて更新する
    antigen update

# Antigenを使ってプラグインをインストールする

    # Antigen本体を更新する
    antigen selfupdate

# Antigenを使ってプラグインをインストールする
- これが基本的な使い方

# Antigenを使おう
- Antigenとは
- Antigenをインストールする
- Antigenを使ってプラグインをインストールする
- *ちょっと注意*

# ちょっと注意
- Antigenにはいくつか注意しないといけないポイントがある

# 注意点その1
- Antigenでインストールできないプラグインがある

# 注意点その1
- Antigenは万能ではない
- 基本的には、プラグインの作者がAntigenに対応した形式で書いているやつだけ使える

# 注意点その1
- 対応しているかどうかの見方

# 注意点その1
- リポジトリに「*.plugin.zsh」または「init.zsh」のどちらかのファイルがある
- インストールするファイルが、zshの補完ファイルである
- 基本的には、この2つのどちらかだったらOK

# 注意点その1
- それ以外は「Antigenで使えることもある」
- 使えないこともある
- ソースを見ないと、はっきりとは分からない

# 注意点その1
- ちゃんとしたプラグインならREADMEとかに「Antigenでインストールするときは…」とか書いてあるので、それを目安にする

# 注意点その2
- lsにaliasを設定していると、Antigen本体が正しく動作しないことがある

# 注意点その2
だめな例

    alias ls='ls -F'

けっこうよく使われるalias

# 注意点その2
対策としては、~/.zshrcの中で順番に気をつける

    if [[ -f ~/.zsh/antigen/antigen.zsh ]]; then
      source ~/.zsh/antigen/antigen.zsh
      antigen apply
    fi

    # これなら大丈夫
    alias ls='ls -F'

# 注意点その2
- 根本的な対策としては、Antigen本体の方を直す
- aliasの設定によって動かなくなるのは、おかしいでしょう

# 注意点その2
- というわけで、はっきり言ってAntigenの品質は低い
- 他にもバグがあるかも…

# 注意点その2
- なんかおかしかったら、~/.zshrcからAntigen以外の設定を消して試してみましょう
- それでなおったら、~/.zshrcの中で書く順番を変えて、なんとかする

# Antigenを使おう
- というわけで、若干使いにくいところはあるけど、zshのプラグイン管理は現状これしかない
- 手動で管理するよりは便利

# Antigenを使おう
- ぜひ使ってみてください

# Antigenを使おう
- ありがとうございました

