if [[ "$(uname -r)" != *microsoft* ]]; then
  return
fi

# VS Code
export PATH="$PATH:/mnt/c/Users/$(whoami)/AppData/Local/Programs/Microsoft VS Code/bin"
