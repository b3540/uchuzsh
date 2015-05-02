# anyframeを使おう

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
- mollifier氏が作った
- https://github.com/mollifier/anyframe

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
- ちゃんとman読め

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
- 現状ではあんまりはやってない
- ぜひ使いましょう

# anyframeを使おう
- anyframeとは
- *anyframeのインストール*
- anyframeの設定
- anyframeでできること
- 自分で関数を追加する

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
割り当てできる関数はhttps://github.com/mollifier/anyframe/tree/master/anyframe-functions/widgetsの中にある

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
:  ghqコマンドで管理しているリポジトリに移動する

anyframe-widget-insert-filename
:  ファイル名をコマンドラインに挿入する


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
- 具体的な書き方は「ソースコード読んで」

# 自分で関数を追加する
- ほんとはちゃんとドキュメント書かないといけない
- ドキュメントはだいぶ不足してる
- これがはやっていない原因の1つ

# anyframeを使おう
- でも、普通に使う分にはだいたい使えると思う

# anyframeを使おう
- ぜひ使ってみてください

# anyframeを使おう
- ありがとうございました

