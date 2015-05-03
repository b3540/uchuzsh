# 本格的に始めるzsh

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


# 本格的に始めるzsh
- 具体的なzshの使い方を勉強しましょう

# 本格的に始めるzsh
- いろんな機能があるけど

# 本格的に始めるzsh
今日はこの3つを紹介

- 補完
- ディレクトリ移動
- コマンドライン履歴

# 本格的に始めるzsh
この3つが使えればだいたいいける

# 本格的に始めるzsh
- *補完*
- ディレクトリ移動
- コマンドライン履歴

# 補完
zshといえば補完機能が有名。
これを~/.zshrcに書いて、あとはTabを押す。

    autoload -Uz compinit
    compinit

# 補完
cd
:    ディレクトリだけ補完

# 補完
man
:    manのページ名を補完

# 補完
grep
:    --with-filename --recursive とか長いオプションを補完

# 補完
find
:    最初はディレクトリを補完。その後は-nameとか-type dとか、なんでも補完

# 補完
chmod
:    644のときはすでに644なファイルは補完しない。+xとかでも同様

# 補完
tar
:    tar xzfのときは.tar.gzファイルだけ補完。その後は展開対象ファイルをtarの中身から補完

# 補完
kill
:    プロセス名をプロセスIDに展開

# 補完
make
:    makeのターゲットを補完

# 補完
apt-get
:    apt-get installの後はインストールできるパッケージ名を補完

# 補完
brew
:    brew installの後はインストールできるパッケージ名を補完

# 補完
scp
:    コピー元またはコピー先ファイルとして、sshでログインできるリモートサーバーのファイル名を補完

# 補完
git
:    サブコマンドもオプションも、なんでも補完。git addの後はaddが必要なファイルだけ補完

# 補完
他にもいろいろあります。

# 補完
使い方もTabを押すだけで簡単。何でもTabで補完。

# 補完
Tabを押してちゃんと補完できなかったらバグと思ってよい

# 補完
zshを使い始めたら、まずは補完を堪能してほしい

# 補完
さらに補完を強化したいときは、zsh-completionsをインストールする

# zsh-completionsとは
- 標準に含まれていない補完ファイルを集めたやつ
- さっき言ったbrewとかもこれを入れないと補完できない

# zsh-completionsをインストールする
$HOME/.zsh/の下にインストールする場合の例

    % mkdir $HOME/.zsh/ # ディレクトリがまだない場合は作成する)
    % cd $HOME/.zsh/
    % git clone git://github.com/zsh-users/zsh-completions.git

# zsh-completionsをインストールする
その後、~/.zshrcに次を追加

    fpath=($HOME/.zsh/zsh-completions/src(N-/) $fpath)

注意として、これはcompinitの前に書く

# zsh-completionsをインストールする
または、Macの場合はhomebrewを使ってもインストールできる

    % brew install zsh-completions

# zsh-completionsをインストールする
この後、~/.zshrcに次を追加

    fpath=(/usr/local/share/zsh-completions(N-/) $fpath)

# zsh-completionsをインストールする
ただし、homebrewで入れるやつは若干古いので、GitHubから取ってくる方がおすすめ

# 補完候補をうろうろ選ぶ
- 補完候補をうろうろ選ぶやつもあります
- 正式にはメニュー補完と呼びます

# 補完候補をうろうろ選ぶ
次を~/.zshrcに書く

    zstyle ':completion:*:default' menu select=2

# 補完候補をうろうろ選ぶ
Ctrl+n, Ctrl+fとかEmacs風の操作で補完候補が選べる

# 補完
これぐらいやっておけば補完はOK

# 本格的に始めるzsh
- 補完
- *ディレクトリ移動*
- コマンドライン履歴

# ディレクトリ移動
- ディレクトリ移動は頻度が高い
- なので重要

# ディレクトリ移動
とりあえずこの設定を使っておけばOK

    setopt auto_cd
    setopt auto_pushd
    setopt pushd_ignore_dups

# ディレクトリ移動
setopt auto_cd
ディレクトリ名だけでcdする

# ディレクトリ移動
auto_pushd
cdしたら勝手にpushdする

# ディレクトリ移動
pushd_ignore_dups
pushdで残るディレクトリ一覧で、重複したものは残さないようにする

# ディレクトリ移動
この3つでcdした履歴が残る感じになるので、まあ便利

    setopt auto_cd
    setopt auto_pushd
    setopt pushd_ignore_dups

# ディレクトリ移動
- autp_pushdの履歴はzshを終了したら消える
- ディレクトリ移動の履歴を永続化して、終了しても保存されるようにしたいときは、cdrを使う

# cdrを使う
cdrはzshに標準で含まれているので、使うのは簡単

    autoload -Uz add-zsh-hook
    autoload -Uz chpwd_recent_dirs cdr
    add-zsh-hook chpwd chpwd_recent_dirs

# cdrを使う
あとは適当にcdして、cdr のあとTABで移動したディレクトリが補完される

# cdrを使う
なかなか便利なやつ

# ディレクトリ移動
- ディレクトリ移動は、まあこれぐらいでOK

# 本格的に始めるzsh
- 補完
- ディレクトリ移動
- *コマンドライン履歴*

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

# まとめ
zshの機能はいろいろあるけど、この3つを設定しておけばだいたい大丈夫っぽい

- 補完
- ディレクトリ移動
- コマンドライン履歴

# まとめ
- 他の機能はおいおいやっていけばいいと思う

# 本格的に始めるzsh
- ありがとうございました

