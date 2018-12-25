PROXY_SERVER='wwwproxy.kanazawa-it.ac.jp:8080'

if [ "$(/usr/sbin/networksetup -getcurrentlocation)" = "university" ]; then
	export http_proxy=http://$PROXY_SERVER/
	export https_proxy=http://$PROXY_SERVER/
	export ALL_PROXY=http://$PROXY_SERVER/
	export NO_PROXY=*.local,*.kanazawa-it.ac.jp,*.kitnet.ne.jp,localhost,127.0.0.1
	git config -f $HOME/.gitconfig.proxy http.proxy $PROXY_SERVER
	git config -f $HOME/.gitconfig.proxy https.proxy $PROXY_SERVER
	git config -f $HOME/.gitconfig.proxy url."https://".insteadOf git://
else
	unset http_proxy
	unset https_proxy
	unset ALL_PROXY
	: >|$HOME/.gitconfig.proxy
fi
