# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if (( $+commands[pbcopy] )); then
  # Mac
  alias -g C='| pbcopy'
elif (( $+commands[xsel] )); then
  # Linux
  alias -g C='| xsel --input --clipboard'
elif (( $+commands[putclip] )); then
  # Cygwin
  alias -g C='| putclip'
fi
