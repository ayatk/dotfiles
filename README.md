# dotfiles

mac とか linux とかで使うシェルの設定

このリポジトリはそのまま `~/.config/mise` として使う。[mise](https://mise.jdx.dev/) の `mise bootstrap` がパッケージ・ツール・dotfiles のリンク・macOS の設定までまとめて面倒を見る

### 使い方

これを黒い画面でｶﾀｶﾀｯｯｯﾀｰﾝってするだけ（仕事用マシンの場合）

    curl -fsSL https://mise.run | sh && ~/.local/bin/mise -E ayatk-work bootstrap --adopt ayatk/dotfiles

私物マシンなら `-E ayatk-personal` にする

    curl -fsSL https://mise.run | sh && ~/.local/bin/mise -E ayatk-personal bootstrap --adopt ayatk/dotfiles

初回に `-E` で選んだプロファイルは `~/.config/mise/miserc.local.toml` に保存されるので、2 回目以降は付けなくていい

中身を先に見たいときは clone だけして dry-run する

    git clone https://github.com/ayatk/dotfiles.git ~/.config/mise && ~/.local/bin/mise bootstrap --dry-run

### 日常の運用

設定を更新したらこれだけ。`git pull --ff-only` してから適用してくれる。`--adopt` は origin が `https://github.com/ayatk/dotfiles.git` と完全一致することを要求する。ホームで実行しないとプロジェクトの mise 設定が合流するので `-C ~` を付ける

    mise -C ~ bootstrap --adopt ayatk/dotfiles --update

`mise use -g` や `mise settings set` は `~/.config/mise/config.toml`（＝このリポジトリ）を直接書き換えるので、差分を確認してコミットする

    git -C ~/.config/mise diff

### プロファイルの切り替え

`~/.config/mise/miserc.local.toml` の `env` で `config.ayatk-personal.toml` か `config.ayatk-work.toml` を重ねて読む

    env = ["ayatk-work"]

### 注意

Apple Silicon 前提。Intel Mac では mise の brew マネージャの仕様で `brew:` の CLI 類は入らない

コミット署名（`git/config` の `commit.gpgsign=true`、`gpg.format=ssh`）の鍵 `user.signingkey` などはリポジトリ外の `~/.config/git/local`（＝ `~/.config/mise/git/local`、gitignore 済み）に置く。無いとコミットできない
