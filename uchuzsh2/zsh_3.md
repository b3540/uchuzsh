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
または、Macの場合はHomebrewを使ってもインストールできる

    % brew install zsh-completions

# zsh-completionsをインストールする
この後、~/.zshrcに次を追加

    fpath=(/usr/local/share/zsh-completions(N-/) $fpath)

# zsh-completionsをインストールする
ただし、Homebrewで入れるやつは若干古いので、GitHubから取ってくる方がおすすめ

# 補完に関する設定
基本的にはTabを押せばいいんだけど、もうちょっと細かく設定したほうがよいところもある

# 補完に関する設定
- 大文字と小文字を区別しない
- 補完候補をうろうろ選ぶ

# 大文字と小文字を区別しない
次を~/.zshrcに書く

    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

これで「小文字のときに大文字も補完に含まれる」

# 大文字と小文字を区別しない
`% cat re`の後にTABを押すと、readme.mdもREADME.mdも補完できる

# 大文字と小文字を区別しない
`% cat RE`の後にTABを押すと、README.mdだけが補完できる(readme.mdは含まれない)

# 大文字と小文字を区別しない
Shiftを押さなくてよくなる

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
`setopt auto_cd`
ディレクトリ名だけでcdする

# ディレクトリ移動
`auto_pushd`
cdしたら勝手にpushdする

# ディレクトリ移動
`pushd_ignore_dups`
pushdで残るディレクトリ一覧で、重複したものは残さないようにする

# ディレクトリ移動
この3つでcdした履歴が残る感じになるので、まあ便利

    setopt auto_cd
    setopt auto_pushd
    setopt pushd_ignore_dups

# ディレクトリ移動
- auto_pushdの履歴はzshを終了したら消える
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
- これは次の発表で紹介する

# まとめ
zshの機能はいろいろあるけど、この3つを設定しておけばだいたい大丈夫っぽい

- 補完
- ディレクトリ移動
- コマンドライン履歴

# まとめ
- 他の機能はおいおいやっていけばいいと思う

# まとめ
GitHubとかに.zshrcの見本がいっぱいあるので、それを参考にするのもよい

# まとめ
- 少し凝った zshrc
- [https://gist.github.com/mollifier/4979906](https://gist.github.com/mollifier/4979906)

# まとめ
ただし、解説もない、自分で意味の分からない設定を適当にコピペするのは避けたほうが良い

# まとめ
- 何百行もまとめてコピペしました
- 自分にはちょっと合わない、変な動作になりました
- でも、元に戻したくてもどこを消せばよいのか分かりません

# まとめ
- とかある

# まとめ
- 小さめの設定ファイルをコピペする
- ひとつ設定を変えたら、それでしばらく使ってみて様子を見る

とか、ちょっとずつ試してみるのがよさそう

# まとめ
みなさんも試してみてください

# 本格的に始めるzsh
- ありがとうございました

