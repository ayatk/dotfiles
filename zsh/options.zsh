# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_ignore_all_dups      # 重複するコマンドは古い方を削除
setopt share_history             # ヒストリを複数のzshで共有
setopt extended_history          # 実行時間とタイムスタンプを記録
setopt hist_reduce_blanks


# 自動補完される余分なカンマなどを適宜削除してスムーズに入力できるようにする
setopt auto_param_keys

# 範囲指定できるようにする
# 例 : mkdir {1-3} で フォルダ1, 2, 3を作れる
setopt brace_ccl

setopt complete_in_word          # 単語の途中でも補完開始
setopt magic_equal_subst         # =以降もファイル名補完

setopt auto_cd                 # ディレクトリ名だけでcdする
setopt auto_pushd              # cdしたディレクトリを自動でスタックに追加
setopt pushd_ignore_dups       # 重複するディレクトリを記録しない
setopt pushd_to_home           # pushdでディレクトリスタックにホームディレクトリを追加しない

# 補完候補を詰めて表示
setopt list_packed

# 補完候補にファイルの種類も表示
setopt list_types

# 補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補を矢印キーで選択
zstyle ':completion:*:default' menu select=1
