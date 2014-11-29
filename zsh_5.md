# pecoを使おう

date
:  2014/11/30

author
:   三宅 英明(mollifier)

theme
:   ligntning-gl-sample

# 自己紹介

- 名前: 三宅 英明
- Twitter: @mollifier
- はてなID: mollifier
- 神戸のプログラマ

![](images/usagi-kao-kiritori.png){:width='180' height='180' align="right"}

# 好きなもの
- zsh
- vim
- vimperator

![](images/usagi-kao-kiritori.png){:width='180' height='180' align="right"}

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
- 言葉では説明しにくい

# pecoとは
- 典型的には、コマンドライン履歴から選んで、それを実行する

# pecoとは
- 今年はやった

# pecoとは
- Anything風インタフェースとか呼ばれることもある

# pecoとは
- Anything風インタフェースというのは、もともとEmacsのやつ
- pecoもそれに似てる

# pecoとは
- 似てるけど、たぶん元のEmacsのやつとはちょっと違う
- なので、「pecoはAnythingですー」とか適当に言うと、たぶんEmacs原理主義の人に怒られる
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
- https://github.com/peco/peco/releasesにバイナリがあるので、ダウンロードして好きな場所に置く
- 実行パーミッションを付ける

# pecoのインストール
- 安定したバージョンをインストールできる
- たぶん一番安心して使える方法
- バージョンアップのときに手動でダウンロードしないといけないのが欠点

# pecoのインストール
Macを使っている場合はHomebrewでもインストールできる

    % brew tap peco/peco
    % brew install peco

# pecoのインストール
- 最新版とは限らない。若干バージョンが古いこともある
- 更新はbrew update pecoでできる。楽
- Macでしかできない
- Macの人にはわりとおすすめ

# pecoのインストール
- pecoはGoで実装されている
- Goのパッケージシステムを使ってもインストールできる
- % go getとかする

# pecoのインストール
- ソースからコンパイルする
- Goの開発環境をインストールしないといけない
- たぶん、タグが付けられた安定版とは限らない
- 単に使いたいだけの人にとっては、ちょっとやりすぎ

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
- 単純であるがゆえに、他のコマンドと組み合わせやすい
- cutとかsedとかawkとか
- 複数の候補から選ばせるときに、「選ばせる」という操作だけをpecoに任せる感じ

# pecoを使おう
- pecoとは
- pecoのインストール
- pecoの基本
- *pecoで使う関数を作る*

# pecoで使う関数を作る
- 入力をpecoを絞り込んで出力するだけのツール
- 他と組み合わせて使う
- 「他」の部分を作ってみましょう

# pecoで使う関数を作る
- 入力をpecoを絞り込んで出力するだけのツール
- まず「入力」が必要
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
一応これでもできる

    function peco-execute-history() {
      local item
      item=$(builtin history -n -r 1 | peco)

      if [[ -z "$item" ]]; then
        return 1
      fi
      eval "$item"
    }
    alias eh=peco-execute-history

# pecoで使う関数を作る
- % ehとか打たないとだめで、なんかおしゃれじゃない
- 特に、いちいちEnterを押さないといけないところがめんどう
- こいつをCtrl+rみたいなキーバインドで実行したい

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
- BUFFER="$item"で、今のコマンドラインの内容を置き換える
- zle accept-lineでコマンドラインを実行する。つまりEnterを押したのと同じ

# pecoで使う関数を作る
注意としては、BUFFER="$item"というのはこの形の書き方のときしか使えない

    function peco-execute-history() {
       # この中に処理を書く
    }
    zle -N peco-execute-history
    bindkey '^x^r' peco-execute-history

# pecoで使う関数を作る
- zle -Nとかいうのは、コマンドラインを操作する処理を自分で作っているイメージ
- 「コマンドラインを操作する処理」というのは、Ctrl+fで右に動く、とかそういうの
- zshではそういうのを自分で作れる

# pecoで使う関数を作る
- さらにその中では現在のコマンドラインとかを変更できる
- BUFFERは現在のコマンドラインの内容を表す変数で、読み書き両方可能
- こいつに代入して、実行してる

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

# ちょっと余談
- 「履歴から選んで実行する」はCtrl+x Ctrl+r
- 「履歴から選んでコマンドラインに挿入する」はCtrl+x Ctrl+p
- 別のキーバインドに割り当ててる

# ちょっと余談
- 本当は表示される候補を見ながら「すぐ実行するのか」「コマンドラインに挿入するのか」を選びたい

# ちょっと余談
- Ctrl+x Ctrl+rで起動
- すぐに実行したいときはEnterで決定
- コマンドラインに挿入したいときはCtrl+oで決定
- とか

# ちょっと余談
- すぐに実行すればよいのか、コマンドラインに挿入したいのか(つまり、ちょっと変更したいのか)は、候補を見ないとよく分からない

# ちょっと余談
- pecoの場合は
- 「1. 候補一覧を作る」
- 「2. 候補を選ぶ」
- 「3. 選んだ候補に対して動作を行う」
- の3つが完全に分かれてる

# ちょっと余談
- 選んだ結果を文字列として出力してるだけ
- 「それに対してどういう動作を行うか」という情報はpecoからは送れない

# ちょっと余談
- (確か)EmacsのAnythingはこのへんがちゃんとしてる
- さっき言った3つが分かれていないから
- 「何を選んだのか」と「どういう動作を行いたいか」の両方が次に伝わっている

# ちょっと余談
- でもpecoでは分かれているから、他と組み合わせるのが簡単
- peco以外の部分は一般的なシェルスクリプトで書ける

# ちょっと余談
- どっちが良いかは一概に言えない
- でも、pecoの方がシンプルでよさそう

# ちょっと余談
- 余談終わり

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
- がんばりたくない

# pecoで使う関数を作る
- シェルスクリプトが苦手な人はどうしたらええの?
- そういう人向けのやつがあります

# pecoで使う関数を作る
- 続きは次の発表で

# pecoを使おう
- ありがとうございました

