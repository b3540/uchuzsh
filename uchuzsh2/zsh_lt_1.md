# oh-my-zshを使うのは止めよう

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

# oh-my-zshを使うのは止めよう

# oh-my-zshとは
- zshの設定フレームワーク
- 便利な設定がいっぱい入ってるやつ
- [https://github.com/robbyrussell/oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

# oh-my-zshとは
- けっこう使っている人がいるもよう

# oh-my-zshとは
- 便利

# oh-my-zshとは
- 便利なんだけど、ちょっと、今となってはあんまりおすすめできない

# なにが良くないか
- 便利な設定が*いっぱい*入ってるやつ
- *「いっぱい」*すぎる

# なにが良くないか
- oh-my-zshをインストールすると、オプションやらaliasやらがいっぱい設定される
- たいていの人は全部を把握していない

# なにが良くないか
- oh-my-zshだけを使って、すべてを任せていたら、あんまり問題はない
- でも、普通はそうじゃない

# なにが良くないか
- oh-my-zshの設定にプラスして、自分の独自の設定も追加することが多い

# なにが良くないか
- ちゃんと設定してるはずなのに、oh-my-zshの設定のせいでうまく動かない、ということがありえる

# なにが良くないか
特に、標準のコマンドをoh-my-zshがaliasで置き換えてることがある

    alias rails='_rails_command'

# なにが良くないか
- ブログ記事に書いてあった便利な設定を追加したぞ
- でも、なんかおかしい
- oh-my-zshのせいでした

# なにが良くないか
- ありがち

# なにが良くないか
- あと、これは好みの問題だけど、oh-my-zshはけっこうaliasを設定してる
- aliasって、だれかの真似して入れるものなん?

# なにが良くないか
- (僕は)aliasは自分で決めたい
- aliasをどういう名前にしたいのかは人による

# なにが良くないか
- (1) 基本的なライブラリ的な処理
- (2) それを呼び出しやすくするためのalias
- (1)をoh-my-zshがやってくれる。(2)は自分で.zshrcに書く、だったら分かる

# なにが良くないか
- (1) 基本的なライブラリ的な処理
- (2) それを呼び出しやすくするためのalias
- でも、oh-my-zshは(1)も(2)も両方やってる
- それは過剰

# まとめ
- oh-my-zshは便利

# まとめ
- 便利だけど、自分で設定を書くようになると、邪魔になることがある

# まとめ
- 全体を把握できないほどの巨大なプログラムは、問題になることがある

# まとめ
- そういうリスクがあるので、安易に使うのは止めたほうが良いと思います!

# まとめ
- ありがとうございました

