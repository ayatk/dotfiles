# Golang
if (( $+commands[go] )); then
  export GOROOT=/usr/local/opt/go/libexec
  export GO111MODULE=on
  PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

