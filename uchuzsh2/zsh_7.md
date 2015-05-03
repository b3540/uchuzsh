# pecoを使おう

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

# pecoを使おう
- pecoとは
- pecoのインストール
- pecoの基本
- pecoで使う関数を作る

# pecoを使おう
- *pecoとは*
- pecoのインストール
- pecoの基本
- pecoで使う関数を作る

# pecoとは
- インクリメンタルに絞り込んで、候補から選んでなんかするやつ

# pecoとは
- プロジェクトページのURLは [https://github.com/peco/peco](https://github.com/peco/peco)

# pecoとは
- 言葉では説明しにくい

# pecoとは
- 典型的には、コマンドライン履歴から選んで、それを実行する

# pecoとは
- 去年はやった

# pecoとは
- Anything風インタフェースとか呼ばれることもある

# pecoとは
- Anything風インタフェースというのは、もともとEmacsのやつ
- Vimにもunite.vimという似たようなやつがある
- pecoもそれに似てる

# pecoとは
- 似てるけど、たぶん元のEmacsのやつとはちょっと違う
- なので、「pecoはAnythingですー ^^」とか適当に言うと、たぶん本気のEmacsの人に怒られる
- 気をつけたほうがいい

# pecoとは
- 使ってみないとよく分からない
- 使ってみましょう

# pecoを使おう
- pecoとは
- *pecoのインストール*
- pecoの基本
- pecoで使う関数を作る

# pecoのインストール
- [https://github.com/peco/peco/releases](https://github.com/peco/peco/releases) にバイナリがあるので、ダウンロードして好きな場所に置く
- 実行パーミッションを付ける

# pecoのインストール
- 安定したバージョンをインストールできる
- たぶん一番安心して使える方法
- バージョンアップのときに手動でダウンロードしないといけないのが欠点

# pecoのインストール
Macを使っている場合はHomebrewでもインストールできる

    % brew install peco

# pecoのインストール
前は`brew tap peco/peco`というのが必要だったけど、今はいらない

    % brew tap peco/peco #<= これは不要

# pecoのインストール
- 最新版とは限らない。若干バージョンが古いこともある
- 更新はbrew update pecoでできる。楽
- Macの人にはわりとおすすめ

# pecoのインストール
- Macの人はbrew
- それ以外の人はバイナリを手動でダウンロード

# pecoを使おう
- pecoとは
- pecoのインストール
- *pecoの基本*
- pecoで使う関数を作る

# pecoの基本
- とりあえずpecoを使ってみる

# pecoの基本

    % cat /etc/passwd | peco

# pecoの基本
- 要するに絞り込んで出力してるだけ
- 絞り込むときにインクリメンタルに絞り込める
- grepを手動でやってる感じ

# pecoの基本
- 動作自体は非常に単純
- peco単体では役に立たない

# pecoの基本
- たぶん意図的に単純にしてる
- 単純だから、他のコマンドと組み合わせやすい
- cutとかsedとかawkとか
- 複数の候補から選ばせるときに、「選ばせる」という操作だけをpecoに任せる感じ

# pecoを使おう
- pecoとは
- pecoのインストール
- pecoの基本
- *pecoで使う関数を作る*

# pecoで使う関数を作る
- pecoは入力を絞り込んで出力するだけのツール
- 他と組み合わせて使う
- 「他」の部分を作ってみましょう

# pecoで使う関数を作る
- pecoは入力を絞り込んで出力するだけのツール

# pecoで使う関数を作る
- 「入力」が必要
- pecoの出力を「どうするか」という処理も必要

# pecoで使う関数を作る
- 典型的な例
- 「入力」 = コマンドライン履歴
- 「どうするか」 = コマンドとみなしてそのまま実行する

# pecoで使う関数を作る
雰囲気でいうとこんな感じ

    # コマンドライン履歴をpecoで絞り込む
    # その結果を一旦変数に入れる
    cmd=$(history | peco)
    # それをそのまま実行する
    eval "$cmd"

# pecoで使う関数を作る
簡単な例

    function h() {
      local item
      item=$(builtin history -n -r 1 | peco)

      if [[ -z "$item" ]]; then
        return 1
      fi
      eval "$item"
    }

# pecoで使う関数を作る
- コマンドラインで`h`と打って使う

# pecoで使う関数を作る
- いちいちEnterを押すのがめんどうという人は、Ctrl+rみたいなキーバインドで実行することもできる

# pecoで使う関数を作る
Ctrl+x Ctrl+rで実行する例
何かのキーバインドで関数を呼び出すときはこう書く

    function peco-execute-history() {
      # この中に処理を書く
    }
    zle -N peco-execute-history
    bindkey '^x^r' peco-execute-history

# pecoで使う関数を作る
Ctrl+x Ctrl+rで実行する例

    function peco-execute-history() {
      local item
      item=$(builtin history -n -r 1 | peco)

      if [[ -z "$item" ]]; then
        return 1
      fi

      BUFFER="$item"
      zle accept-line
    }
    zle -N peco-execute-history
    bindkey '^x^r' peco-execute-history

# pecoで使う関数を作る
- `BUFFER="$item"` で、今のコマンドラインの内容を置き換える
- `zle accept-line`でコマンドラインを実行する。つまりEnterを押したのと同じ

# pecoで使う関数を作る
zle -Nとかいうのは、コマンドラインを操作する処理を自分で作っているイメージ

    function peco-execute-history() {
       # この中に処理を書く
    }
    zle -N peco-execute-history
    bindkey '^x^r' peco-execute-history

# pecoで使う関数を作る
- 「コマンドラインを操作する処理」というのは、Ctrl+fでカーソルを右に動かす、とかそういうの
- zshではそういうのを自分で作れる

# pecoで使う関数を作る
- さらにその中では現在のコマンドラインとかを変更できる

# pecoで使う関数を作る
- 「手でコマンドラインを入力して」「Enterを押す」という操作をzshのシェルスクリプトから操作できる
- peco自体は他のシェルでも使えるけど、zshはこのへんが柔軟なのでpecoと組み合わせて使いやすい

# pecoで使う関数を作る
さっきと同じだけど、コマンドラインに代入するだけの例

    function peco-put-history() {
      local item
      item=$(builtin history -n -r 1 | peco)

      if [[ -z "$item" ]]; then
        return 1
      fi

      BUFFER="$item"
      CURSOR=$#BUFFER
    }
    zle -N peco-put-history
    bindkey '^x^p' peco-put-history

# pecoで使う関数を作る
- さっきのzle accept-line(Enterを押す)をなくしただけ
- これも便利

# pecoで使う関数を作る
- ここまででできたこと
- 「履歴から選んで実行する」
- 「履歴から選んでコマンドラインに挿入する」

# pecoで使う関数を作る
- 他には?
- もちろん工夫次第でいろいろできる

# pecoで使う関数を作る
- 工夫次第?
- 工夫次第 = *シェルスクリプトでがんばれば*

# pecoで使う関数を作る
- 普通のシェルスクリプトで書ける
- head, sort, uniq, sed, awk などなど
- テキスト処理なので、Perl, Rubyとかを使ってもいい

# pecoで使う関数を作る
- *シェルスクリプトでがんばれば*
- がんばりたくない

# pecoで使う関数を作る
- シェルスクリプトが苦手な人はどうしたらええの?
- そういう人向けのやつがあります

# pecoで使う関数を作る
- 続きは次の発表で

# pecoを使おう
- ありがとうございました

