# Golang
PATH=$PATH:$GOPATH/bin

if [[ "$(uname -r)" == *microsoft* ]]; then
  export PATH=$PATH:/usr/local/go/bin
fi
