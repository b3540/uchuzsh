# anyframeを使おう

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

# anyframeを使おう
- anyframeとは
- anyframeのインストール
- anyframeの設定
- anyframeでできること
- 自分で関数を追加する

# anyframeを使おう
- *anyframeとは*
- anyframeのインストール
- anyframeの設定
- anyframeでできること
- 自分で関数を追加する

# anyframeとは
- pecoと組み合わせて使う関数が入ってるやつ
- mollifierさんが作った
- [https://github.com/mollifier/anyframe](https://github.com/mollifier/anyframe)

# anyframeとは
- 要するに便利な関数が入ってるだけ
- 自分で書けない/書きたくない人向け

# anyframeとは
- 作ろうと思ったきっかけ

# anyframeとは
ググったらよく出てくるやつ

    function peco-select-history() {
        local tac
        if which tac > /dev/null; then
            tac="tac"
        else
            tac="tail -r"
        fi
        BUFFER=$(history -n 1 | \
            eval $tac | \
            peco --query "$LBUFFER")
        CURSOR=$#BUFFER
        zle clear-screen
    }
    zle -N peco-select-history

# anyframeとは
- 間違いではない
- 動く
- でも無駄なことしてる
- なんかかっこわるい

# かっこわるいポイント1
evalしてる

    eval $tac | \

    # こうすればevalしなくてもいける
    ${=tac} | \

# かっこわるいポイント2
そもそもtacとかいらない
historyの-rオプションで上下順番が逆になる

    BUFFER=$(history -n -r 1 | \
      peco --query "$LBUFFER")

# anyframeとは
- manに書いてある
- man読めば分かる

# anyframeとは
- でも実際にはみんなコピペで使う
- ブログとかにコピペで広まってる
- 多すぎてもう直せない

# anyframeとは
- じゃあちゃんとしたやつを作ろう
- ブログ記事は直せない
- でもGitHubに置けば直せる
- プルリクもできる

# anyframeとは
- というわけでanyframeを作りました

# anyframeとは
- 特徴
- 普通の人が使いたいと思う関数がだいたい入ってる
- peco、percol、fzfに対応してる

# anyframeとは
- 特徴
- aliasでもbindkey(キーボード ショートカットから呼び出すやつ)でも、どちらからでも使える
- 選んだ結果をすぐに実行するのも、コマンドラインに挿入するのもできる
- 拡張しやすい

# anyframeとは
- 現状ではあんまりはやってない
- ぜひ使いましょう

# anyframeを使おう
- anyframeとは
- *anyframeのインストール*
- anyframeの設定
- anyframeでできること
- 自分で関数を追加する

# anyframeのインストール
- まずは先にpeco、percol、fzfをインストールしておく
- どれかひとつ好きなやつでOK
- 特に理由がなければ、pecoが無難

# anyframeのインストール
手動でインストールする方法
$HOME/.zsh/の下にインストールする場合の例

    # ディレクトリがまだない場合は作成する
    % mkdir $HOME/.zsh/
    % cd $HOME/.zsh/
    % git clone git@github.com:mollifier/anyframe.git

# anyframeのインストール
そのあと~/.zshrcに次の設定を追加する

    fpath=($HOME/.zsh/anyframe(N-/) $fpath)
    autoload -Uz anyframe-init
    anyframe-init

# anyframeのインストール
Antigenでもインストールできる

    antigen bundle mollifier/anyframe

# anyframeを使おう
- anyframeとは
- anyframeのインストール
- *anyframeの設定*
- anyframeでできること
- 自分で関数を追加する

# anyframeの設定
- 使い方は、関数があるので、それにキーバインドを割り当てるだけ

# anyframeの設定
~/.zshrcの設定の例

    bindkey '^xb' anyframe-widget-cdr
    bindkey '^x^b' anyframe-widget-checkout-git-branch
    bindkey '^x^r' anyframe-widget-execute-history
    bindkey '^x^p' anyframe-widget-put-history
    bindkey '^x^g' anyframe-widget-cd-ghq-repository
    bindkey '^x^k' anyframe-widget-kill
    bindkey '^x^i' anyframe-widget-insert-git-branch

# anyframeの設定
- 割り当てできる関数は [https://github.com/mollifier/anyframe/tree/master/anyframe-functions/widgets](https://github.com/mollifier/anyframe/tree/master/anyframe-functions/widgets) の中にある

# anyframeを使おう
- anyframeとは
- anyframeのインストール
- anyframeの設定
- *anyframeでできること*
- 自分で関数を追加する

# anyframeでできること
anyframe-widget-execute-history
:  コマンドライン履歴から選んで実行する

anyframe-widget-put-history
:  コマンドライン履歴から選んでコマンドラインに挿入する

# anyframeでできること
anyframe-widget-checkout-git-branch
:  Gitブランチを切り替える

anyframe-widget-insert-git-branch
:  Gitブランチ名をコマンドラインに挿入する

# anyframeでできること
anyframe-widget-cdr
:  過去に移動したことのあるディレクトリに移動する(cdrが必要)

anyframe-widget-kill
:  プロセスをkillする

# anyframeでできること
anyframe-widget-cd-ghq-repository
:  ghqコマンドで管理しているリポジトリに移動する(ghqが必要)

anyframe-widget-insert-filename
:  ファイル名をコマンドラインに挿入する

# anyframeでできること
anyframe-widget-tmux-attach
:  tmuxセッションを選んでアタッチする

anyframe-widget-select-widget
:  anyframe-widget(anyframeで使える関数)から選んでそれを実行する

# anyframeを使おう
- anyframeとは
- anyframeのインストール
- anyframeの設定
- anyframeでできること
- *自分で関数を追加する*

# 自分で関数を追加する
- もちろん、自分で関数を追加できる
- anyframeに含まれている他の関数が使える
- 自分で一から書くより楽

# 自分で関数を追加する
- 具体的な書き方はと言うと

# 自分で関数を追加する
まず、ファイルを保存するためのディレクトリを作る。$HOME/.zsh/anyframe-customの下に配置する場合の例

    # ディレクトリがまだない場合は作成する
    # このディレクトリ名は何でも良い
    % mkdir -p $HOME/.zsh/anyframe-custom
    % cd $HOME/.zsh/anyframe-custom

    # このディレクトリ名は固定
    % mkdir -p anyframe-functions/widgets

# 自分で関数を追加する
antigen bundleする前(anyframe-initを呼び出す前)に、このディレクトリを$fpathに追加する。

    if [[ -f ~/.zsh/antigen/antigen.zsh ]]; then
      source ~/.zsh/antigen/antigen.zsh
      fpath=($HOME/.zsh/anyframe-custom(N-/) $fpath) # <= これを追加
      antigen bundle mollifier/anyframe
      antigen apply
    fi

# 自分で関数を追加する
- これでひとまず準備完了

# 自分で関数を追加する
次に、作ったディレクトリの下($HOME/.zsh/anyframe-custom)にファイルを作って、zshの関数の中身を書く。

    history -n -r 1 \
      | anyframe-selector-auto \
      | anyframe-action-execute

# 自分で関数を追加する
後は、aliasを設定するかbindkeyでキーバインドを割り当てる

    alias ah=anyframe-widget-execute-history
    # または
    bindkey '^xr' anyframe-widget-execute-history

ファイル名が関数名になるので、実際にはanyframe-widget-execute-historyの部分はファイル名に置き換える

# 自分で関数を追加する
- 自分で追加するのはちょっとややこしい
- 詳しくは以下の記事を参照
- [http://qiita.com/mollifier/items/81b18c012d7841ab33c3](http://qiita.com/mollifier/items/81b18c012d7841ab33c3)

# anyframeを使おう
- でも、普通に使う分にはだいたい使えると思う

# anyframeを使おう
- ぜひ使ってみてください

# anyframeを使おう
- ありがとうございました

